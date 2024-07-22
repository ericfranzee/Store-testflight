// To parse this JSON data, do
//
//     final userAddressResponse = userAddressResponseFromJson(jsonString);

import 'dart:convert';

import 'package:ibeauty/domain/model/model/location_model.dart';

import 'city_pagination_response.dart';

UserAddressResponse userAddressResponseFromJson(String str) =>
    UserAddressResponse.fromJson(json.decode(str));

String userAddressResponseToJson(UserAddressResponse data) =>
    json.encode(data.toJson());

class UserAddressResponse {
  List<UserAddress>? data;

  UserAddressResponse({
    this.data,
  });

  UserAddressResponse copyWith({
    List<UserAddress>? data,
  }) =>
      UserAddressResponse(
        data: data ?? this.data,
      );

  factory UserAddressResponse.fromJson(Map<String, dynamic> json) =>
      UserAddressResponse(
        data: json["data"] == null
            ? []
            : List<UserAddress>.from(
                json["data"]!.map((x) => UserAddress.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class UserAddress {
  int? id;
  int? userId;
  bool? active;
  String? firstname;
  String? lastname;
  String? phone;
  String? zipcode;
  String? streetHouseNumber;
  String? additionalDetails;
  LocationModel? location;
  DateTime? createdAt;
  DateTime? updatedAt;
  CityModel? cityModel;

  UserAddress(
      {this.id,
      this.userId,
      this.active,
      this.firstname,
      this.lastname,
      this.phone,
      this.zipcode,
      this.location,
      this.streetHouseNumber,
      this.additionalDetails,
      this.createdAt,
      this.updatedAt,
      this.cityModel});

  UserAddress copyWith({
    int? id,
    int? userId,
    bool? active,
    String? firstname,
    String? lastname,
    String? phone,
    String? zipcode,
    String? streetHouseNumber,
    String? additionalDetails,
    LocationModel? location,
    DateTime? createdAt,
    DateTime? updatedAt,
    CityModel? cityModel,
  }) =>
      UserAddress(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        active: active ?? this.active,
        firstname: firstname ?? this.firstname,
        lastname: lastname ?? this.lastname,
        phone: phone ?? this.phone,
        zipcode: zipcode ?? this.zipcode,
        streetHouseNumber: streetHouseNumber ?? this.streetHouseNumber,
        additionalDetails: additionalDetails ?? this.additionalDetails,
        createdAt: createdAt ?? this.createdAt,
        location: location ?? this.location,
        updatedAt: updatedAt ?? this.updatedAt,
        cityModel: cityModel ?? this.cityModel,
      );

  factory UserAddress.fromJson(Map<String, dynamic> json) => UserAddress(
        id: json["id"],
        userId: json["user_id"],
        active: json["active"],
        firstname: json["firstname"],
        lastname: json["lastname"],
        phone: json["phone"],
        zipcode: json["zipcode"],
        streetHouseNumber: json["street_house_number"],
        additionalDetails: json["additional_details"],
        cityModel: json["city"] != null ? CityModel.fromJson(json["city"]) : null,
        location: json["location"] != null
            ? LocationModel.fromJson(json["location"])
            : null,
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "active": active,
        "firstname": firstname,
        "lastname": lastname,
        "phone": phone,
        "location": location,
        "zipcode": zipcode,
        "street_house_number": streetHouseNumber,
        "additional_details": additionalDetails,
        "city": cityModel?.toJson(),
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
