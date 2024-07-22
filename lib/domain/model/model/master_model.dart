import 'package:ibeauty/domain/model/model/service_model.dart';
import 'package:ibeauty/domain/model/model/translation_model.dart';
import 'package:ibeauty/domain/model/response/my_membership_response.dart';

import 'shop_model.dart';

class MasterModel {
  int? id;
  String? firstname;
  String? lastname;
  bool? emptyP;
  bool? active;
  String? img;
  String? note;
  String? address;
  double? long;
  double? lat;
  MyMembershipModel? membership;
  num? serviceMinPrice;
  num? rate;
  Invite? invite;
  DateTime? time;
  ServiceMaster? serviceMaster;
  Translation? translation;

  MasterModel({
    this.id,
    this.firstname,
    this.lastname,
    this.emptyP,
    this.active,
    this.img,
    this.long,
    this.lat,
    this.note,
    this.membership,
    this.address,
    this.serviceMinPrice,
    this.rate,
    this.invite,
    this.time,
    this.serviceMaster,
    this.translation,
  });

  MasterModel copyWith({
    int? id,
    String? firstname,
    String? lastname,
    bool? emptyP,
    bool? active,
    double? lat,
    double? long,
    String? img,
    String? note,
    MyMembershipModel? membership,
    String? address,
    num? serviceMinPrice,
    num? rate,
    Invite? invite,
    DateTime? time,
    ServiceMaster? serviceMaster,
    Translation? translation,
  }) =>
      MasterModel(
        id: id ?? this.id,
        firstname: firstname ?? this.firstname,
        lastname: lastname ?? this.lastname,
        emptyP: emptyP ?? this.emptyP,
        active: active ?? this.active,
        img: img ?? this.img,
        lat: lat ?? this.lat,
        long: long ?? this.long,
        note: note ?? this.note,
        membership: membership ?? this.membership,
        address: address ?? this.address,
        serviceMinPrice: serviceMinPrice ?? this.serviceMinPrice,
        rate: rate ?? this.rate,
        invite: invite ?? this.invite,
        time: time ?? this.time,
        serviceMaster: serviceMaster ?? this.serviceMaster,
        translation: translation ?? this.translation,
      );

  factory MasterModel.fromJson(Map<String, dynamic> json) => MasterModel(
        id: json["id"],
        firstname: json["firstname"],
        lastname: json["lastname"],
        emptyP: json["empty_p"],
        active: json["active"],
        img: json["img"],
        long: json["long"],
        lat: json["lat"],
        note: json["note"],
        address: json["address"],
        serviceMinPrice: json["service_min_price"],
        rate: json["r_avg"],
        time: json["time"] == null ? null : DateTime.parse(json["time"]),
        invite: json["invite"] == null ? null : Invite.fromJson(json["invite"]),
        serviceMaster: json["service_master"] == null
            ? null
            : ServiceMaster.fromJson(json["service_master"]),
        membership: json["membership"] == null
            ? null
            : MyMembershipModel.fromJson(json["membership"]),
        translation: json["translation"] == null
            ? null
            : Translation.fromJson(json["translation"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "firstname": firstname,
        "lastname": lastname,
        "empty_p": emptyP,
        "active": active,
        "img": img,
        "lat": lat,
        "long": long,
        "note": note,
        "address": address,
        "service_min_price": serviceMinPrice,
        "r_avg": rate,
        "invite": invite?.toJson(),
        "membership": membership?.toJson(),
        "time": time?.toIso8601String(),
        "service_master": serviceMaster?.toJson(),
        "translation": translation?.toJson(),
      };
}

class Invite {
  int? id;
  int? shopId;
  int? userId;
  String? status;
  Translation? translation;
  ShopData? shop;

  Invite({
    this.id,
    this.shopId,
    this.userId,
    this.status,
    this.translation,
    this.shop,
  });

  Invite copyWith({
    int? id,
    int? shopId,
    int? userId,
    Translation? translation,
    String? status,
    ShopData? shop,
  }) =>
      Invite(
        id: id ?? this.id,
        shopId: shopId ?? this.shopId,
        userId: userId ?? this.userId,
        status: status ?? this.status,
        shop: shop ?? this.shop,
        translation: translation ?? this.translation,
      );

  factory Invite.fromJson(Map<String, dynamic> json) => Invite(
        id: json["id"],
        shopId: json["shop_id"],
        userId: json["user_id"],
        status: json["status"],
        translation: Translation.fromJson(json["translation"]),
        shop: json["shop"] == null ? null : ShopData.fromJson(json["shop"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "shop_id": shopId,
        "user_id": userId,
        "status": status,
        "shop": shop?.toJson(),
        "translation": translation?.toJson(),
      };
}

class ServiceMaster {
  int? id;
  int? serviceId;
  int? masterId;
  int? shopId;
  num? totalPrice;
  num? interval;
  String? type;
  ShopData? shop;
  ServiceModel? service;

  ServiceMaster({
    this.id,
    this.shopId,
    this.serviceId,
    this.masterId,
    this.totalPrice,
    this.interval,
    this.type,
    this.shop,
    this.service,
  });

  ServiceMaster copyWith({
    int? id,
    int? shopId,
    int? serviceId,
    int? masterId,
    num? totalPrice,
    num? interval,
    String? type,
    ShopData? shop,
    ServiceModel? service,
  }) =>
      ServiceMaster(
        id: id ?? this.id,
        shopId: shopId ?? this.shopId,
        serviceId: serviceId ?? this.serviceId,
        masterId: masterId ?? this.masterId,
        totalPrice: totalPrice ?? this.totalPrice,
        interval: interval ?? this.interval,
        shop: shop ?? this.shop,
        type: type ?? this.type,
        service: service ?? this.service,
      );

  factory ServiceMaster.fromJson(Map<String, dynamic> json) => ServiceMaster(
        id: json["id"],
        shopId: json["shop_id"],
        serviceId: json["service_id"],
        masterId: json["master_id"],
        totalPrice: json["total_price"],
        interval: json["interval"],
        type: json["type"],
        shop: json["shop"] != null ? ShopData.fromJson(json["shop"]) : null,
        service: json["service"] != null
            ? ServiceModel.fromJson(json["service"])
            : null,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "shop_id": shopId,
        "service_id": serviceId,
        "master_id": masterId,
        "total_price": totalPrice,
        "interval": interval,
        "type": type,
        "shop": shop?.toJson(),
        "service": service?.toJson(),
      };
}
