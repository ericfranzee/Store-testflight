// To parse this JSON data, do
//
//     final membershipResponse = membershipResponseFromJson(jsonString);

import 'dart:convert';

import 'package:ibeauty/domain/model/model/shop_model.dart';

import '../model/translation_model.dart';

MembershipResponse membershipResponseFromJson(String str) =>
    MembershipResponse.fromJson(json.decode(str));

String membershipResponseToJson(MembershipResponse data) =>
    json.encode(data.toJson());

class MembershipResponse {
  List<MembershipModel>? data;

  MembershipResponse({
    this.data,
  });

  MembershipResponse copyWith({
    List<MembershipModel>? data,
  }) =>
      MembershipResponse(
        data: data ?? this.data,
      );

  factory MembershipResponse.fromJson(Map<String, dynamic> json) =>
      MembershipResponse(
        data: json["data"] == null
            ? []
            : List<MembershipModel>.from(
                json["data"]!.map((x) => MembershipModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class MembershipModel {
  int? id;
  int? shopId;
  String? color;
  int? price;
  String? time;
  int? sessions;
  int? sessionsCount;
  DateTime? createdAt;
  DateTime? updatedAt;
  ShopData? shop;
  Translation? translation;

  MembershipModel({
    this.id,
    this.shopId,
    this.color,
    this.price,
    this.time,
    this.sessions,
    this.sessionsCount,
    this.createdAt,
    this.updatedAt,
    this.translation,
    this.shop,
  });

  MembershipModel copyWith({
    int? id,
    int? shopId,
    String? color,
    int? price,
    String? time,
    int? sessions,
    int? sessionsCount,
    DateTime? createdAt,
    DateTime? updatedAt,
    ShopData? shop,
    Translation? translation,
  }) =>
      MembershipModel(
        id: id ?? this.id,
        shopId: shopId ?? this.shopId,
        color: color ?? this.color,
        price: price ?? this.price,
        time: time ?? this.time,
        sessions: sessions ?? this.sessions,
        sessionsCount: sessionsCount ?? this.sessionsCount,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        shop: shop ?? this.shop,
        translation: translation ?? this.translation,
      );

  factory MembershipModel.fromJson(Map<String, dynamic> json) =>
      MembershipModel(
        id: json["id"],
        shopId: json["shop_id"],
        color: json["color"],
        price: json["price"],
        time: json["time"],
        sessions: json["sessions"],
        sessionsCount: json["sessions_count"],
        shop: json["shop"] == null ? null : ShopData.fromJson(json["shop"]),
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        translation: json["translation"] == null
            ? null
            : Translation.fromJson(json["translation"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "shop_id": shopId,
        "color": color,
        "price": price,
        "time": time,
        "sessions": sessions,
        "sessions_count": sessionsCount,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "translation": translation?.toJson(),
        "shop": shop?.toJson(),
      };
}
