// To parse this JSON data, do
//
//     final myMembershipResponse = myMembershipResponseFromJson(jsonString);

import 'dart:convert';

import 'package:ibeauty/domain/model/response/membership_response.dart';

MyMembershipResponse myMembershipResponseFromJson(String str) => MyMembershipResponse.fromJson(json.decode(str));

String myMembershipResponseToJson(MyMembershipResponse data) => json.encode(data.toJson());

class MyMembershipResponse {
  List<MyMembershipModel>? data;

  MyMembershipResponse({
    this.data,

  });

  MyMembershipResponse copyWith({
    List<MyMembershipModel>? data,
  }) =>
      MyMembershipResponse(
        data: data ?? this.data,

      );

  factory MyMembershipResponse.fromJson(Map<String, dynamic> json) => MyMembershipResponse(
    data: json["data"] == null ? [] : List<MyMembershipModel>.from(json["data"]!.map((x) => MyMembershipModel.fromJson(x))),

  );

  Map<String, dynamic> toJson() => {
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),

  };
}

class MyMembershipModel {
  int? id;
  int? memberShipId;
  int? userId;
  String? color;
  int? price;
  DateTime? expiredAt;
  int? sessions;
  int? sessionsCount;
  int? remainder;
  DateTime? createdAt;
  DateTime? updatedAt;
  MembershipModel? memberShip;

  MyMembershipModel({
    this.id,
    this.memberShipId,
    this.userId,
    this.color,
    this.price,
    this.expiredAt,
    this.sessions,
    this.sessionsCount,
    this.remainder,
    this.createdAt,
    this.updatedAt,
    this.memberShip,
  });

  MyMembershipModel copyWith({
    int? id,
    int? memberShipId,
    int? userId,
    String? color,
    int? price,
    DateTime? expiredAt,
    int? sessions,
    int? sessionsCount,
    int? remainder,
    DateTime? createdAt,
    DateTime? updatedAt,
    MembershipModel? memberShip,
  }) =>
      MyMembershipModel(
        id: id ?? this.id,
        memberShipId: memberShipId ?? this.memberShipId,
        userId: userId ?? this.userId,
        color: color ?? this.color,
        price: price ?? this.price,
        expiredAt: expiredAt ?? this.expiredAt,
        sessions: sessions ?? this.sessions,
        sessionsCount: sessionsCount ?? this.sessionsCount,
        remainder: remainder ?? this.remainder,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        memberShip: memberShip ?? this.memberShip,
      );

  factory MyMembershipModel.fromJson(Map<String, dynamic> json) {

    return MyMembershipModel(
    id: json["id"],
    memberShipId: json["member_ship_id"],
    userId: json["user_id"],
    color: json["color"],
    price: json["price"],
    expiredAt: json["expired_at"] == null ? null : DateTime.parse(json["expired_at"]).toLocal(),
    sessions: json["sessions"],
    sessionsCount: json["sessions_count"],
    remainder: json["remainder"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]).toLocal(),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]).toLocal(),
    memberShip: json["member_ship"] == null ? null : MembershipModel.fromJson(json["member_ship"]),
  );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "member_ship_id": memberShipId,
    "user_id": userId,
    "color": color,
    "price": price,
    "expired_at": expiredAt?.toIso8601String(),
    "sessions": sessions,
    "sessions_count": sessionsCount,
    "remainder": remainder,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "member_ship": memberShip?.toJson(),
  };
}







