import 'package:ibeauty/domain/model/model/product_model.dart';
import 'package:ibeauty/domain/model/model/review_data.dart';

import '../model/translation_model.dart';

class AdsProductsResponse {
  DateTime? timestamp;
  bool? status;
  String? message;
  AdModel? data;
  List<AdModel>? listOfAds;

  AdsProductsResponse({
    this.timestamp,
    this.status,
    this.message,
    this.data,
    this.listOfAds,
  });

  AdsProductsResponse copyWith({
    DateTime? timestamp,
    bool? status,
    String? message,
    AdModel? data,
    List<AdModel>? listOfAds,
  }) =>
      AdsProductsResponse(
        timestamp: timestamp ?? this.timestamp,
        status: status ?? this.status,
        message: message ?? this.message,
        data: data ?? this.data,
        listOfAds: listOfAds ?? this.listOfAds,
      );

  factory AdsProductsResponse.fromJson(Map<String, dynamic> json,
          {bool list = false}) =>
      AdsProductsResponse(
        timestamp: json["timestamp"] == null
            ? null
            : DateTime.parse(json["timestamp"]),
        status: json["status"],
        message: json["message"],
        data: list ? null
            : json["data"] == null ? null
                : AdModel.fromJson(json["data"]),
        listOfAds: list
            ? json["data"] == null
                ? []
                : List<AdModel>.from(
                    json["data"]!.map((x) => AdModel.fromJson(x)))
            : null,
      );

  Map<String, dynamic> toJson({bool list = false}) => {
        "timestamp": timestamp?.toIso8601String(),
        "status": status,
        "message": message,
        "data": data?.toJson(),
        if (list)
          "data": listOfAds == null
              ? []
              : List<dynamic>.from(listOfAds!.map((x) => x.toJson())),
      };
}

class AdModel {
  int? id;
  bool? active;
  String? type;
  String? timeType;
  int? time;
  int? price;
  DateTime? createdAt;
  DateTime? updatedAt;
  Translation? translation;
  List<Translation>? translations;
  List<Galleries>? galleries;
  List<String>? locales;
  List<ShopAdsPackage>? shopAdsPackages;

  AdModel({
    this.id,
    this.active,
    this.type,
    this.timeType,
    this.time,
    this.price,
    this.createdAt,
    this.updatedAt,
    this.translation,
    this.translations,
    this.galleries,
    this.locales,
    this.shopAdsPackages,
  });

  AdModel copyWith({
    int? id,
    bool? active,
    String? type,
    String? timeType,
    int? time,
    int? price,
    DateTime? createdAt,
    DateTime? updatedAt,
    Translation? translation,
    List<Translation>? translations,
    List<Galleries>? galleries,
    List<String>? locales,
    List<ShopAdsPackage>? shopAdsPackages,
  }) =>
      AdModel(
        id: id ?? this.id,
        active: active ?? this.active,
        type: type ?? this.type,
        timeType: timeType ?? this.timeType,
        time: time ?? this.time,
        price: price ?? this.price,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        translation: translation ?? this.translation,
        translations: translations ?? this.translations,
        galleries: galleries ?? this.galleries,
        locales: locales ?? this.locales,
        shopAdsPackages: shopAdsPackages ?? this.shopAdsPackages,
      );

  factory AdModel.fromJson(Map<String, dynamic> json) => AdModel(
        id: json["id"],
        active: json["active"],
        type: json["type"],
        timeType: json["time_type"],
        time: json["time"],
        price: json["price"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        translation: json["translation"] == null
            ? null
            : Translation.fromJson(json["translation"]),
        galleries: json["galleries"] == null
            ? []
            : List<Galleries>.from(
                json["galleries"]!.map((x) => Galleries.fromJson(x))),
        locales: json["locales"] == null
            ? []
            : List<String>.from(json["locales"]!.map((x) => x)),
        shopAdsPackages: json["shop_ads_packages"] == null
            ? []
            : List<ShopAdsPackage>.from(json["shop_ads_packages"]!
                .map((x) => ShopAdsPackage.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "active": active,
        "type": type,
        "time_type": timeType,
        "time": time,
        "price": price,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "translation": translation?.toJson(),
        "translations": translations == null
            ? []
            : List<dynamic>.from(translations!.map((x) => x.toJson())),
        "galleries": galleries == null
            ? []
            : List<dynamic>.from(galleries!.map((x) => x.toJson())),
        "locales":
            locales == null ? [] : List<dynamic>.from(locales!.map((x) => x)),
        "shop_ads_packages": shopAdsPackages == null
            ? []
            : List<dynamic>.from(shopAdsPackages!.map((x) => x.toJson())),
      };
}

class ShopAdsPackage {
  int? id;
  bool? active;
  int? adsPackageId;
  int? shopId;
  String? status;
  DateTime? expiredAt;
  List<ProductData>? shopAdsProducts;

  ShopAdsPackage({
    this.id,
    this.active,
    this.adsPackageId,
    this.shopId,
    this.status,
    this.expiredAt,
    this.shopAdsProducts,
  });

  ShopAdsPackage copyWith({
    int? id,
    bool? active,
    int? adsPackageId,
    int? shopId,
    String? status,
    DateTime? expiredAt,
    List<ProductData>? shopAdsProducts,
  }) =>
      ShopAdsPackage(
        id: id ?? this.id,
        active: active ?? this.active,
        adsPackageId: adsPackageId ?? this.adsPackageId,
        shopId: shopId ?? this.shopId,
        status: status ?? this.status,
        expiredAt: expiredAt ?? this.expiredAt,
        shopAdsProducts: shopAdsProducts ?? this.shopAdsProducts,
      );

  factory ShopAdsPackage.fromJson(Map<String, dynamic> json) => ShopAdsPackage(
        id: json["id"],
        active: json["active"],
        adsPackageId: json["ads_package_id"],
        shopId: json["shop_id"],
        status: json["status"],
        expiredAt: json["expired_at"] == null
            ? null
            : DateTime.parse(json["expired_at"]),
        shopAdsProducts: json["shop_ads_products"] == null
            ? []
            : List<ProductData>.from(json["shop_ads_products"]!
                .map((x) => ProductData.fromJson(x["product"]))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "active": active,
        "ads_package_id": adsPackageId,
        "shop_id": shopId,
        "status": status,
        "expired_at": expiredAt?.toIso8601String(),
        "shop_ads_products": shopAdsProducts == null
            ? []
            : List<dynamic>.from(shopAdsProducts!.map((x) => x.toJson())),
      };
}
