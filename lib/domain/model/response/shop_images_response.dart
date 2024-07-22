// To parse this JSON data, do
//
//     final shopImagesResponse = shopImagesResponseFromJson(jsonString);

import 'dart:convert';

import 'package:ibeauty/domain/model/model/review_data.dart';

ShopImagesResponse shopImagesResponseFromJson(String str) =>
    ShopImagesResponse.fromJson(json.decode(str));

String shopImagesResponseToJson(ShopImagesResponse data) =>
    json.encode(data.toJson());

class ShopImagesResponse {
  ShopImages? data;

  ShopImagesResponse({
    this.data,
  });

  ShopImagesResponse copyWith({
    ShopImages? data,
  }) =>
      ShopImagesResponse(
        data: data ?? this.data,
      );

  factory ShopImagesResponse.fromJson(Map<String, dynamic> json) =>
      ShopImagesResponse(
        data: json["data"] == null ? null : ShopImages.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
      };
}

class ShopImages {
  int? id;
  bool? active;
  int? shopId;
  List<Galleries>? galleries;

  ShopImages({
    this.id,
    this.active,
    this.shopId,
    this.galleries,
  });

  ShopImages copyWith({
    int? id,
    bool? active,
    int? shopId,
    List<Galleries>? galleries,
  }) =>
      ShopImages(
        id: id ?? this.id,
        active: active ?? this.active,
        shopId: shopId ?? this.shopId,
        galleries: galleries ?? this.galleries,
      );

  factory ShopImages.fromJson(Map<String, dynamic> json) => ShopImages(
        id: json["id"],
        active: json["active"],
        shopId: json["shop_id"],
        galleries: json["galleries"] == null
            ? []
            : List<Galleries>.from(
                json["galleries"]!.map((x) => Galleries.fromJson(x))),
      );

  factory ShopImages.fromJsonMaster(Map<String, dynamic> json) => ShopImages(
        galleries: json["data"] == null
            ? []
            : List<Galleries>.from(
                json["data"]!.map((x) => Galleries.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "active": active,
        "shop_id": shopId,
        "galleries": galleries == null
            ? []
            : List<dynamic>.from(galleries!.map((x) => x.toJson())),
      };
}
