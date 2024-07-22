import 'package:colornames/colornames.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vibrate/flutter_vibrate.dart';
import 'package:ftoast/ftoast.dart';
import 'package:ibeauty/app_constants.dart';
import 'package:ibeauty/application/cart/cart_bloc.dart';
import 'package:ibeauty/application/products/product_bloc.dart';
import 'package:ibeauty/domain/model/model/product_model.dart';
import 'package:ibeauty/domain/model/response/global_settings_response.dart';
import 'package:ibeauty/domain/service/tr_keys.dart';
import 'package:ibeauty/infrastructure/local_storage/local_storage.dart';
import 'package:ibeauty/presentation/components/button/custom_button.dart';
import 'package:ibeauty/presentation/style/style.dart';
import 'package:ibeauty/presentation/style/theme/theme.dart';
import 'package:ibeauty/presentation/style/theme/theme_warpper.dart';
import 'package:intl/intl.dart';

import 'img_service.dart';

abstract class AppHelper {
  AppHelper._();

  static String errorHandler(e, {String? statusCode}) {
    return (e.runtimeType == DioException)
        ? ((e as DioException).response?.data["message"] == "Bad request."
            ? e.response?.data["params"] != null
                ? (e.response?.data["params"] as Map).values.first[0]
                : e.response?.data["message"]
            : e.response?.data["message"])
        : e.toString();
  }

  static errorSnackBar(
      {required BuildContext context,
      required String message,
      bool typeFixed = false}) {
    FToast.toast(context,
        toast: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                padding: EdgeInsets.all(16.r),
                margin: EdgeInsets.only(
                    bottom: MediaQuery.sizeOf(context).height / 1.5,
                    left: 32.r,
                    right: 32.r),
                decoration: BoxDecoration(
                    color: CustomStyle.primary,
                    borderRadius: BorderRadius.circular(8.r)),
                child: Text(
                  message,
                  style: CustomStyle.interNormal(
                      color: CustomStyle.white, size: 14),
                ))
          ],
        ));
  }

  static int searchIndex(List<int> ids, int target) {
    int h = 0;
    int l = ids.length - 1;

    while (l <= h) {
      int mid = l + (h - l) ~/ 2;
      if (ids[mid] == target) {
        return mid;
      }

      if (ids[mid] > target) {
        l = mid + 1;
      } else {
        h = mid - 1;
      }
    }
    return -1;
  }

  static String numberFormat(
      {num? number, String? symbol, bool? isOrder, int? decimalDigits}) {
    if (LocalStorage.getSelectedCurrency()?.position == "before") {
      return NumberFormat.currency(
        customPattern: '\u00a4#,###.#',
        symbol: (isOrder ?? false)
            ? symbol
            : LocalStorage.getSelectedCurrency()?.symbol,
        decimalDigits: decimalDigits ?? 2,
      ).format(number ?? 0);
    } else {
      return NumberFormat.currency(
        customPattern: '#,###.#\u00a4',
        symbol: (isOrder ?? false)
            ? symbol
            : LocalStorage.getSelectedCurrency()?.symbol,
        decimalDigits: decimalDigits ?? 2,
      ).format(number ?? 0);
    }
  }

  static openDialog({
    required BuildContext context,
    required String title,
  }) {
    return showDialog(
      context: context,
      builder: (_) {
        return ThemeWrapper(
          builder: (colors, controller) {
            return Dialog(
              backgroundColor: colors.transparent,
              insetPadding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Container(
                margin: EdgeInsets.all(24.w),
                width: double.infinity,
                padding: EdgeInsets.all(24.w),
                decoration: BoxDecoration(
                  color: colors.backgroundColor,
                  borderRadius: BorderRadius.circular(24.r),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Text(
                        title,
                        textAlign: TextAlign.center,
                        style: CustomStyle.interNormal(
                            color: colors.textBlack, size: 18),
                      ),
                      24.verticalSpace,
                      CustomButton(
                        onTap: () => Navigator.pop(context),
                        title: AppHelper.getTrn(TrKeys.close),
                        bgColor: CustomStyle.primary,
                        titleColor: CustomStyle.white,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  static Future<DateTime?> showSelectDate(
      {required BuildContext context,
      required CustomColorSet colors,
      DateTime? dateTime}) async {
    return await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: dateTime ?? DateTime.now(),
      lastDate: DateTime.now().add(
        const Duration(days: 365),
      ),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: colors.primary, // <-- SEE HERE
              onPrimary: CustomStyle.black, // <-- SEE HERE
              onSurface: CustomStyle.black, // <-- SEE HERE
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: CustomStyle.black, // button text color
              ),
            ),
          ),
          child: child!,
        );
      },
    );
  }

  static showCustomDialog({
    required BuildContext context,
    required Widget content,
  }) {
    return showDialog(
      context: context,
      builder: (_) {
        return ThemeWrapper(
          builder: (colors, controller) {
            return Dialog(
              backgroundColor: colors.transparent,
              insetPadding: EdgeInsets.symmetric(horizontal: 16.w),
              child: content,
            );
          },
        );
      },
    );
  }

  static void showCustomModalBottomSheet({
    required BuildContext context,
    required Widget modal,
    double radius = 24,
    bool isDrag = true,
    bool isDismissible = true,
    double paddingTop = 200,
  }) {
    showModalBottomSheet(
      isDismissible: isDismissible,
      enableDrag: isDrag,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(radius.r),
          topRight: Radius.circular(radius.r),
        ),
      ),
      isScrollControlled: true,
      constraints: BoxConstraints(
        maxHeight: MediaQuery.sizeOf(context).height - paddingTop.r,
      ),
      backgroundColor: CustomStyle.transparent,
      context: context,
      builder: (context) => modal,
    );
  }

  static void showCustomModalBottomSheetDrag({
    required BuildContext context,
    required Function(ScrollController controller) modal,
    double radius = 24,
    bool isDrag = true,
    bool isDismissible = true,
    double paddingTop = 200,
    double maxChildSize = 0.9,
    double initialChildSize = 0.9,
  }) {
    showModalBottomSheet(
      isDismissible: isDismissible,
      enableDrag: isDrag,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(radius.r),
          topRight: Radius.circular(radius.r),
        ),
      ),
      isScrollControlled: true,
      constraints: BoxConstraints(
        maxHeight: MediaQuery.sizeOf(context).height - paddingTop.r,
      ),
      backgroundColor: CustomStyle.transparent,
      context: context,
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: initialChildSize,
        maxChildSize: maxChildSize,
        expand: false,
        builder: (BuildContext context, ScrollController scrollController) {
          return modal(scrollController);
        },
      ),
    );
  }

  static addProduct(
      {required BuildContext context,
      required ProductData? product,
      required Stocks? stock}) {
    if ((stock?.quantity ?? 0) <= 0) {
      Vibrate.feedback(FeedbackType.error);
      openDialog(
          context: context, title: AppHelper.getTrn(TrKeys.errorQuantity));
      return;
    }
    Vibrate.feedback(FeedbackType.selection);
    int count = getCountCart(productId: product?.id, stockId: stock?.id);
    String? image;
    stock?.extras?.forEach((element) {
      if (element.group?.type == "color") {
        image = ImgService.checkIfImage(element.value, product?.stocks)?.path;
        return;
      }
    });
    if (count >= (product?.maxQty ?? 100)) {
      openDialog(
          context: context,
          title: "${AppHelper.getTrn(TrKeys.errorMaxQty)} $count");
      return;
    }
    if (count >= (stock?.quantity ?? 100)) {
      openDialog(
          context: context,
          title: "${AppHelper.getTrn(TrKeys.errorQuantity)} $count");
      return;
    }
    if ((stock?.quantity ?? 100) <=
        count + (count != 0 ? 1 : product?.minQty ?? 1)) {
      LocalStorage.setCartList(
          productId: product?.id,
          stockId: stock?.id,
          image: image,
          count: count + (count != 0 ? 1 : stock?.quantity ?? 1));
      context.read<ProductBloc>().add(const ProductEvent.updateState());
      context.read<CartBloc>().add(const CartEvent.updateState());

      return;
    }

    LocalStorage.setCartList(
        productId: product?.id,
        stockId: stock?.id,
        image: image,
        count: count +
            (count != 0
                ? 1
                : (product?.minQty ?? 1) == 0
                    ? 1
                    : (product?.minQty ?? 1)));
    context.read<ProductBloc>().add(const ProductEvent.updateState());
    context.read<CartBloc>().add(const CartEvent.updateState());
  }

  static removeProduct(
      {required BuildContext context,
      required ProductData? product,
      required Stocks? stock}) {
    Vibrate.feedback(FeedbackType.selection);
    int count =
        AppHelper.getCountCart(productId: product?.id, stockId: stock?.id);
    if (count <= (product?.minQty ?? 1)) {
      LocalStorage.setCartList(
          productId: product?.id, stockId: stock?.id, count: 0);
      context.read<ProductBloc>().add(const ProductEvent.updateState());
      context.read<CartBloc>().add(const CartEvent.updateState());
      return;
    }
    LocalStorage.setCartList(
        productId: product?.id, stockId: stock?.id, count: count - 1);
    context.read<ProductBloc>().add(const ProductEvent.updateState());
    context.read<CartBloc>().add(const CartEvent.updateState());
  }

  static deleteProduct(
      {required BuildContext context,
      required ProductData? product,
      required Stocks? stock}) {
    Vibrate.feedback(FeedbackType.selection);
    LocalStorage.setCartList(
        productId: product?.id, stockId: stock?.id, count: 0);
    context.read<ProductBloc>().add(const ProductEvent.updateState());
    context.read<CartBloc>().add(const CartEvent.updateState());
  }

  static String reviewText(num? review) {
    if (review != null) {
      if (review <= 1) {
        return AppHelper.getTrn(TrKeys.veryBad);
      }
      if (review <= 2) {
        return AppHelper.getTrn(TrKeys.bad);
      }
      if (review <= 3) {
        return AppHelper.getTrn(TrKeys.notBad);
      }
      if (review <= 4) {
        return AppHelper.getTrn(TrKeys.good);
      }
      if (review <= 4.5) {
        return AppHelper.getTrn(TrKeys.veryGood);
      }
      if (review <= 5) {
        return AppHelper.getTrn(TrKeys.exceptional);
      }
      return AppHelper.getTrn(TrKeys.newKey);
    } else {
      return AppHelper.getTrn(TrKeys.newKey);
    }
  }

  static String getAppName() {
    final List<SettingsData> settings = LocalStorage.getSettingsList();
    for (final setting in settings) {
      if (setting.key == 'title') {
        return setting.value ?? "";
      }
    }
    return '';
  }

  static num getCommission() {
    final List<SettingsData> settings = LocalStorage.getSettingsList();
    for (final setting in settings) {
      if (setting.key == 'commission') {
        return num.tryParse(setting.value ?? "0") ?? 0;
      }
    }
    return 0;
  }

  static bool getProductUiType() {
    final List<SettingsData> settings = LocalStorage.getSettingsList();
    for (final setting in settings) {
      if (setting.key == 'product_ui_type') {
        return setting.value == "2";
      }
    }
    return true;
  }

  static int getType() {
    if (AppConstants.isDemo) {
      return LocalStorage.getUiType() ?? 0;
    }
    final List<SettingsData> settings = LocalStorage.getSettingsList();
    for (final setting in settings) {
      if (setting.key == 'ui_type') {
        return (int.tryParse(setting.value ?? "1") ?? 1) - 1;
      }
    }
    return 0;
  }

  static String getTrn(String trKey) {
    final Map<String, dynamic> translations = LocalStorage.getTranslations();
    return translations[trKey] ?? trKey.replaceAll(".", " ");
  }

  static bool productInclude({required int? productId, required int? stockId}) {
    final list = LocalStorage.getCartList();
    for (var element in list) {
      if (element.productId == productId && element.stockId == stockId) {
        if (element.count <= 0) {
          return false;
        }
        return true;
      }
    }
    return false;
  }

  static int getCountCart({required int? productId, required int? stockId}) {
    final list = LocalStorage.getCartList();
    for (var element in list) {
      if (element.productId == productId && element.stockId == stockId) {
        return element.count;
      }
    }
    return 0;
  }

  static RichText getSearchResultText(
      String mainText, String subtext, CustomColorSet colors,
      {int? maxLine}) {
    if (!mainText.toUpperCase().contains(subtext.toUpperCase())) {
      return RichText(
        overflow: maxLine == null ? TextOverflow.clip : TextOverflow.ellipsis,
        maxLines: maxLine,
        text: TextSpan(
          text: mainText,
          style: CustomStyle.interNormal(
              color: colors.textBlack.withOpacity(0.3), size: 14),
        ),
      );
    }
    final int startIndex =
        mainText.toUpperCase().indexOf(subtext.toUpperCase());
    final String prefixText = mainText.substring(0, startIndex);
    final String centerText =
        mainText.substring(startIndex, startIndex + subtext.length);
    final hasPostText = subtext.length + startIndex < mainText.length - 1;
    final String postText = hasPostText
        ? mainText.substring(subtext.length + startIndex, mainText.length - 1)
        : '';
    return RichText(
      overflow: maxLine == null ? TextOverflow.clip : TextOverflow.ellipsis,
      maxLines: maxLine,
      text: TextSpan(
        text: prefixText,
        style: CustomStyle.interNormal(
            color: colors.textBlack.withOpacity(0.3), size: 14),
        children: <TextSpan>[
          TextSpan(
            text: centerText,
            style: CustomStyle.interNormal(color: colors.textBlack, size: 14),
          ),
          TextSpan(
            text: postText,
            style: CustomStyle.interNormal(
                color: colors.textBlack.withOpacity(0.3), size: 14),
          ),
        ],
      ),
    );
  }

  static bool checkPhone(String value) {
    String pattern = r'^[0-9]+$';
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(value.replaceAll("+", ""));
  }

  static ExtrasType getExtraTypeByValue(String? value) {
    switch (value) {
      case 'color':
        return ExtrasType.color;
      case 'text':
        return ExtrasType.text;
      case 'image':
        return ExtrasType.image;
      default:
        return ExtrasType.text;
    }
  }

  static bool checkIfHex(String? type) {
    if (type == null || type.isEmpty) {
      return false;
    }
    if (type.length == 7 && type[0] == '#') {
      return true;
    } else {
      return false;
    }
  }

  static String getNameColor(String? value) {
    if (checkIfHex(value)) {
      final color = Color(int.parse('0xFF${value?.substring(1, 7)}'));
      return color.colorName;
    }
    return value ?? TrKeys.unKnow;
  }

  static double getInitialLatitude() {
    final List<SettingsData> settings = LocalStorage.getSettingsList();
    for (final setting in settings) {
      if (setting.key == 'location') {
        final String? latString =
            setting.value?.substring(0, setting.value?.indexOf(','));
        if (latString == null) {
          return AppConstants.demoLatitude;
        }
        final double? lat = double.tryParse(latString);
        return lat ?? AppConstants.demoLatitude;
      }
    }
    return AppConstants.demoLatitude;
  }

  static double getInitialLongitude() {
    final List<SettingsData> settings = LocalStorage.getSettingsList();
    for (final setting in settings) {
      if (setting.key == 'location') {
        final String? latString =
            setting.value?.substring(0, setting.value?.indexOf(','));
        if (latString == null) {
          return AppConstants.demoLongitude;
        }
        final String? lonString = setting.value
            ?.substring((latString.length) + 2, setting.value?.length);
        if (lonString == null) {
          return AppConstants.demoLatitude;
        }
        final double lon = double.parse(lonString);
        return lon;
      }
    }
    return AppConstants.demoLongitude;
  }

  static bool getParcel() {
    final List<SettingsData> settings = LocalStorage.getSettingsList();
    for (final setting in settings) {
      if (setting.key == 'active_parcel') {
        return setting.value == "1";
      }
    }
    return true;
  }

  static num getMinAmount() {
    final List<SettingsData> settings = LocalStorage.getSettingsList();
    for (final setting in settings) {
      if (setting.key == 'min_amount') {
        return num.tryParse(setting.value ?? "0") ?? 0;
      }
    }
    return 0;
  }

  static bool getReferralActive() {
    final List<SettingsData> settings = LocalStorage.getSettingsList();
    for (final setting in settings) {
      if (setting.key == 'referral_active') {
        return setting.value == "1";
      }
    }
    return false;
  }

  static int getOrderStatusForNumber(String? value) {
    switch (value) {
      case 'new':
        return 6;
      case 'accepted':
        return 5;
      case 'ready':
        return 4;
      case 'on_a_way':
        return 3;
      case 'pause':
        return 2;
      case 'delivered':
        return 1;
      case 'canceled':
        return 0;
      default:
        return 6;
    }
  }

  static String? findLowPriceStocks(List<Stocks>? stocks) {
    if (stocks?.isEmpty ?? true) {
      return numberFormat(number: 0);
    }
    num price = stocks?.first.price ?? 0;
    stocks?.forEach((element) {
      if ((element.price ?? 0) < price) {
        price = element.price ?? 0;
      }
    });
    return numberFormat(number: price);
  }
}
