import 'dart:convert';

import 'package:ibeauty/app_constants.dart';
import 'package:ibeauty/domain/di/dependency_manager.dart';
import 'package:ibeauty/domain/model/model/address_model.dart';
import 'package:ibeauty/domain/model/model/currency_model.dart';
import 'package:ibeauty/domain/model/model/local_cart_model.dart';
import 'package:ibeauty/domain/model/model/location_model.dart';
import 'package:ibeauty/domain/model/model/user_model.dart';
import 'package:ibeauty/domain/model/response/delivery_point_response.dart';
import 'package:ibeauty/domain/model/response/global_settings_response.dart';
import 'package:ibeauty/domain/model/response/languages_response.dart';
import 'package:ibeauty/game/models/board.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class LocalStorage {
  static SharedPreferences? local;

  static Future init() async {
    local = await SharedPreferences.getInstance();
  }

  static Future setToken(String value) async {
    await local?.setString(AppConstants.keyToken, value);
  }

  static String getToken() {
    return local?.getString(AppConstants.keyToken) ?? "";
  }

  static deleteToken() {
    local?.remove(AppConstants.keyToken);
  }

  static bool getMode() {
    return (local?.getString("theme_mode") ?? "light") == "light";
  }

  static Future setAdminId(int value) async {
    await local?.setInt(AppConstants.keyAdmin, value);
  }

  static int getAdminId() {
    return local?.getInt(AppConstants.keyAdmin) ?? 0;
  }

  static deleteAdminId() {
    local?.remove(AppConstants.keyAdmin);
  }

  static Future<void> setSettingsList(List<SettingsData> settings) async {
    final List<String> strings =
        settings.map((setting) => jsonEncode(setting.toJson())).toList();
    await local?.setStringList(AppConstants.keyGlobalSettings, strings);
  }

  static List<SettingsData> getSettingsList() {
    final List<String> settings =
        local?.getStringList(AppConstants.keyGlobalSettings) ?? [];

    final List<SettingsData> settingsList = settings
        .map(
          (setting) => SettingsData.fromJson(jsonDecode(setting)),
        )
        .toList();
    return settingsList;
  }

  static deleteSettingsList() => local?.remove(AppConstants.keyGlobalSettings);

  static Future<void> setOtherTranslations(
      {required Map<String, dynamic>? translations,
      required String key}) async {
    SharedPreferences? local = await SharedPreferences.getInstance();
    final String encoded = jsonEncode(translations);
    await local.setString(key, encoded);
  }

  static Future<Map<String, dynamic>> getOtherTranslations(
      {required String key}) async {
    SharedPreferences? local = await SharedPreferences.getInstance();
    final String encoded = local.getString(key) ?? '';
    if (encoded.isEmpty) {
      return {};
    }
    final Map<String, dynamic> decoded = jsonDecode(encoded);
    return decoded;
  }

  static Future<void> setTranslations(
      Map<String, dynamic>? translations) async {
    final String encoded = jsonEncode(translations);
    await local?.setString(AppConstants.keyTranslations, encoded);
  }

  static Map<String, dynamic> getTranslations() {
    final String encoded = local?.getString(AppConstants.keyTranslations) ?? '';
    if (encoded.isEmpty) {
      return {};
    }
    final Map<String, dynamic> decoded = jsonDecode(encoded);
    return decoded;
  }

  static deleteTranslations() => local?.remove(AppConstants.keyTranslations);

  static Future<void> setLanguageData(LanguageData? langData) async {
    final String lang = jsonEncode(langData?.toJson());
    setLangLtr(langData?.backward);
    await local?.setString(AppConstants.keyLangSelected, lang);
  }

  static LanguageData? getLanguage() {
    final lang = local?.getString(AppConstants.keyLangSelected);
    if (lang == null) {
      return null;
    }
    final map = jsonDecode(lang);
    if (map == null) {
      return null;
    }
    return LanguageData.fromJson(map);
  }

  static deleteLanguage() => local?.remove(AppConstants.keyLangSelected);

  static Future<void> setLangLtr(bool? backward) async {
    if (local != null) {
      await local?.setBool(AppConstants.keyLangLtr, backward ?? false);
    }
  }

  static bool getLangLtr() =>
      !(local?.getBool(AppConstants.keyLangLtr) ?? true);

  static deleteLangLtr() => local?.remove(AppConstants.keyLangLtr);

  static Future<void> setUser(UserModel? user) async {
    if (local != null) {
      await local?.setString(AppConstants.keyUser, jsonEncode(user?.toJson()));
    }
  }

  static UserModel getUser() {
    Map jsonData = {};
    if (local?.getString(AppConstants.keyUser) != null) {
      jsonData = jsonDecode(local?.getString(AppConstants.keyUser) ?? "");
    }

    if (jsonData.isNotEmpty) {
      UserModel user = UserModel.fromJson(jsonData);
      return user;
    }

    return UserModel();
  }

  static deleteUser() => local?.remove(AppConstants.keyUser);

  static Future<void> setWareHouse(DeliveryPoint? wareHouse) async {
    if (local != null) {
      await local?.setString(
          AppConstants.keyWareHouse, jsonEncode(wareHouse?.toJson()));
    }
  }

  static DeliveryPoint getWareHouse() {
    Map jsonData = {};
    if (local?.getString(AppConstants.keyWareHouse) != null) {
      jsonData = jsonDecode(local?.getString(AppConstants.keyWareHouse) ?? "");
    }

    if (jsonData.isNotEmpty) {
      DeliveryPoint wareHouse = DeliveryPoint.fromJson(jsonData);
      return wareHouse;
    }

    return DeliveryPoint();
  }

  static deleteWareHouse() => local?.remove(AppConstants.keyWareHouse);

  static Future<void> setSelectedCurrency(CurrencyData currency) async {
    if (local != null) {
      final String currencyString = jsonEncode(currency.toJson());
      await local!.setString(AppConstants.keySelectedCurrency, currencyString);
    }
  }

  static CurrencyData? getSelectedCurrency() {
    String json = local?.getString(AppConstants.keySelectedCurrency) ?? '';
    if (json.isEmpty) {
      return null;
    }
    final map = jsonDecode(json);
    return CurrencyData.fromJson(map);
  }

  static void deleteSelectedCurrency() =>
      local?.remove(AppConstants.keySelectedCurrency);

  static Future<void> setLikedProductsList(int id) async {
    if (id == 0) {
      return;
    }
    List<int> list = getLikedProductsList();
    if (list.contains(id)) {
      list.remove(id);
      if (LocalStorage.getToken().isNotEmpty) {
        userRepository.removeLikeProduct(id: id);
      }
    } else {
      list.add(id);
      if (LocalStorage.getToken().isNotEmpty) {
        userRepository.setLikeProduct(id: id);
      }
    }
    if (local != null) {
      final List<String> stringList = list.map((id) => id.toString()).toList();
      await local!.setStringList(AppConstants.keyLikedProducts, stringList);
    }
  }

  static List<int> getLikedProductsList() {
    final List<String> idsStrings =
        local?.getStringList(AppConstants.keyLikedProducts) ?? [];
    final List<int> ids = idsStrings.map((id) => int.parse(id)).toList();
    return ids;
  }

  static void deleteLikedProductsList() =>
      local?.remove(AppConstants.keyLikedProducts);

  static Future<void> setLikedShopsList(int id) async {
    if (id == 0) {
      return;
    }
    List<int> list = getLikedShopsList();
    if (list.contains(id)) {
      list.remove(id);
    } else {
      list.add(id);
    }
    if (local != null) {
      final List<String> stringList = list.map((id) => id.toString()).toList();
      await local!.setStringList(AppConstants.keyLikedShops, stringList);
    }
  }

  static List<int> getLikedShopsList() {
    final List<String> idsStrings =
        local?.getStringList(AppConstants.keyLikedShops) ?? [];
    final List<int> ids = idsStrings.map((id) => int.parse(id)).toList();
    return ids;
  }

  static void deleteLikedShopsList() =>
      local?.remove(AppConstants.keyLikedShops);

  static Future<void> setLikedMaster(int id) async {
    if (id == 0) {
      return;
    }
    List<int> list = getLikedMaster();
    if (list.contains(id)) {
      list.remove(id);
      userRepository.removeLikeMaster(id: id);
    } else {
      list.add(id);
      userRepository.setLikeMaster(id: id);
    }
    if (local != null) {
      final List<String> stringList = list.map((id) => id.toString()).toList();
      await local!.setStringList(AppConstants.keyLikedMasters, stringList);
    }
  }

  static List<int> getLikedMaster() {
    final List<String> idsStrings =
        local?.getStringList(AppConstants.keyLikedMasters) ?? [];
    final List<int> ids = idsStrings.map((id) => int.parse(id)).toList();
    return ids;
  }

  static void deleteLikedMaster() =>
      local?.remove(AppConstants.keyLikedMasters);

  static Future<void> setCompareList(int id) async {
    if (id == 0) {
      return;
    }
    List<int> list = getCompareList();
    if (list.contains(id)) {
      list.remove(id);
    } else {
      list.add(id);
    }
    if (local != null) {
      final List<String> stringList = list.map((id) => id.toString()).toList();
      await local!.setStringList(AppConstants.keyCompareProducts, stringList);
    }
  }

  static List<int> getCompareList() {
    final List<String> idsStrings =
        local?.getStringList(AppConstants.keyCompareProducts) ?? [];
    final List<int> ids = idsStrings.map((id) => int.parse(id)).toList();
    return ids;
  }

  static void deleteCompareList() =>
      local?.remove(AppConstants.keyCompareProducts);

  static Future<void> setViewedProductsList(int id) async {
    if (id == 0) {
      return;
    }
    List<int> list = getViewedProductsList();
    if (list.length == 10) {
      list.removeLast();
    }
    if (list.contains(id)) {
      list.remove(id);
      list.add(id);
    } else {
      list.add(id);
    }
    if (local != null) {
      final List<String> stringList = list.map((id) => id.toString()).toList();
      await local!.setStringList(AppConstants.keyViewedProducts, stringList);
    }
  }

  static List<int> getViewedProductsList() {
    final List<String> idsStrings =
        local?.getStringList(AppConstants.keyViewedProducts) ?? [];
    final List<int> ids = idsStrings.map((id) => int.parse(id)).toList();
    return ids;
  }

  static void deleteViewedProductsList() =>
      local?.remove(AppConstants.keyViewedProducts);

  static Future setTotalCartList({required List<LocalCartModel> list}) async {
    final List<String> stringList =
        list.map((e) => jsonEncode(e.toJson())).toList();
    await local!.setStringList(AppConstants.keyCart, stringList);
  }

  static Future setCartList(
      {required int? productId,
      required int? stockId,
      String? image,
      required int count}) async {
    List<LocalCartModel> list = getCartList();

    for (int i = 0; i < list.length; i++) {
      if (list[i].stockId == stockId && list[i].productId == productId) {
        list.removeAt(i);
        list.insert(
          i,
          LocalCartModel(
              productId: productId ?? 0,
              stockId: stockId ?? 0,
              count: count,
              image: image),
        );
        final List<String> stringList =
            list.map((e) => jsonEncode(e.toJson())).toList();
        await local!.setStringList(AppConstants.keyCart, stringList);
        return;
      }
    }
    list.add(LocalCartModel(
        productId: productId, stockId: stockId, count: count, image: image));
    final List<String> stringList =
        list.map((e) => jsonEncode(e.toJson())).toList();
    await local!.setStringList(AppConstants.keyCart, stringList);
  }

  static List<LocalCartModel> getCartList() {
    final List<String> listJson =
        local?.getStringList(AppConstants.keyCart) ?? [];
    if (listJson.isNotEmpty) {
      final List<LocalCartModel> list = [];
      for (var element in listJson) {
        list.add(
          LocalCartModel.fromJson(
            jsonDecode(element),
          ),
        );
      }
      return list;
    }

    return [];
  }

  static void deleteCartList() => local?.remove(AppConstants.keyCart);

  static Future<void> setSearchRecentlyList(String title) async {
    List<String> list = getSearchRecentlyList();
    if (!list.contains(title)) {
      list.add(title);
    }
    if (local != null) {
      await local!.setStringList(AppConstants.keySearchStores, list);
    }
  }

  static Future<void> removeSearchRecentlyList(String title) async {
    List<String> list = getSearchRecentlyList();
    list.remove(title);
    if (local != null) {
      await local!.setStringList(AppConstants.keySearchStores, list);
    }
  }

  static List<String> getSearchRecentlyList() {
    final List<String> list =
        local?.getStringList(AppConstants.keySearchStores) ?? [];
    return list;
  }

  static void deleteSearchRecentlyList() =>
      local?.remove(AppConstants.keySearchStores);

  static Future<void> setLatLong(LocationModel? location) async {
    if (local != null) {
      final String locationString = jsonEncode(location?.toJson());

      await local!.setString(AppConstants.keyLocation, locationString);
    }
  }

  static LocationModel? getLatLong() {
    String json = local?.getString(AppConstants.keyLocation) ?? '';
    if (json.isEmpty) {
      return null;
    }
    final map = jsonDecode(json);
    return LocationModel.fromJson(map);
  }

  static void deleteLatLong() => local?.remove(AppConstants.keyLocation);

  static Future<void> setAddress(AddressModel? address) async {
    if (local != null) {
      final String currencyString = jsonEncode(address?.toJson());
      await local!.setString(AppConstants.keyAddress, currencyString);
    }
  }

  static AddressModel? getAddress() {
    String json = local?.getString(AppConstants.keyAddress) ?? '';
    if (json.isEmpty) {
      return null;
    }
    final map = jsonDecode(json);
    return AddressModel.fromJson(map);
  }

  static void deleteAddress() => local?.remove(AppConstants.keyAddress);

  static Future<void> setUiType(int type) async {
    if (local != null) {
      await local!.setInt(AppConstants.keyUiType, type);
    }
  }

  static int? getUiType() => local?.getInt(AppConstants.keyUiType);

  static Future<void> setGroupOrder(UserModel? user) async {
    if (local != null) {
      await local?.setString(
          AppConstants.keyGroupUser, jsonEncode(user?.toJson()));
    }
  }

  static UserModel getGroupOrder() {
    Map jsonData = {};
    if (local?.getString(AppConstants.keyGroupUser) != null) {
      jsonData = jsonDecode(local?.getString(AppConstants.keyGroupUser) ?? "");
    }

    if (jsonData.isNotEmpty) {
      UserModel user = UserModel.fromJson(jsonData);
      return user;
    }

    return UserModel();
  }

  static deleteGroupOrder() {
    return local?.remove(AppConstants.keyGroupUser);
  }

  static Future<void> setBoard(Board? board) async {
    if (local != null) {
      await local?.setString(
          AppConstants.keyBoard, jsonEncode(board?.toJson()));
    }
  }

  static Board? getBoard() {
    Map jsonData = {};
    if (local?.getString(AppConstants.keyBoard) != null) {
      jsonData = jsonDecode(local?.getString(AppConstants.keyBoard) ?? "");
    }

    if (jsonData.isNotEmpty) {
      Board board = Board.fromJson(jsonData);
      return board;
    }

    return null;
  }

  static deleteBoard() {
    return local?.remove(AppConstants.keyBoard);
  }

  static clear() {
    deleteUser();
    deleteToken();
    deleteCartList();
    deleteSearchRecentlyList();
    deleteWareHouse();
    deleteViewedProductsList();
    deleteAddress();
    deleteAdminId();
    deleteBoard();
    deleteLikedMaster();
    deleteLikedProductsList();
    deleteLikedShopsList();
  }
}
