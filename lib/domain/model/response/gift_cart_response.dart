// To parse this JSON data, do
//
//     final giftCartResponse = giftCartResponseFromJson(jsonString);

import 'dart:convert';

import '../model/translation_model.dart';

GiftCartResponse giftCartResponseFromJson(String str) =>
    GiftCartResponse.fromJson(json.decode(str));

String giftCartResponseToJson(GiftCartResponse data) =>
    json.encode(data.toJson());

class GiftCartResponse {
  List<GiftCartModel>? data;

  GiftCartResponse({
    this.data,
  });

  GiftCartResponse copyWith({
    List<GiftCartModel>? data,
  }) =>
      GiftCartResponse(
        data: data ?? this.data,
      );

  factory GiftCartResponse.fromJson(Map<String, dynamic> json) =>
      GiftCartResponse(
        data: json["data"] == null
            ? []
            : List<GiftCartModel>.from(
                json["data"]!.map((x) => GiftCartModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class GiftCartModel {
  int? id;
  int? shopId;
  int? active;
  int? price;
  String? time;
  Translation? translation;

  GiftCartModel({
    this.id,
    this.shopId,
    this.active,
    this.price,
    this.time,
    this.translation,
  });

  GiftCartModel copyWith({
    int? id,
    int? shopId,
    int? active,
    int? price,
    String? time,
    Translation? translation,
  }) =>
      GiftCartModel(
        id: id ?? this.id,
        shopId: shopId ?? this.shopId,
        active: active ?? this.active,
        price: price ?? this.price,
        time: time ?? this.time,
        translation: translation ?? this.translation,
      );

  factory GiftCartModel.fromJson(Map<String, dynamic> json) => GiftCartModel(
        id: json["id"],
        shopId: json["shop_id"],
        active: json["active"],
        price: json["price"],
        time: json["time"],
        translation: json["translation"] == null
            ? null
            : Translation.fromJson(json["translation"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "shop_id": shopId,
        "active": active,
        "price": price,
        "time": time,
        "translation": translation?.toJson(),
      };
}
