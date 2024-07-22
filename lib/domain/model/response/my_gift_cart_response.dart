
import 'package:ibeauty/domain/model/response/gift_cart_response.dart';

class MyGiftCartResponse {
  List<MyGiftCartModel>? data;

  MyGiftCartResponse({
    this.data,
  });

  MyGiftCartResponse copyWith({
    List<MyGiftCartModel>? data,
  }) =>
      MyGiftCartResponse(
        data: data ?? this.data,

      );

  factory MyGiftCartResponse.fromJson(Map<String, dynamic> json) => MyGiftCartResponse(
    data: json["data"] == null ? [] : List<MyGiftCartModel>.from(json["data"]!.map((x) => MyGiftCartModel.fromJson(x))),

  );

  Map<String, dynamic> toJson() => {
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class MyGiftCartModel {
  int? id;
  int? giftCartId;
  int? userId;
  num? price;
  DateTime? expiredAt;
  GiftCartModel? giftCart;

  MyGiftCartModel({
    this.id,
    this.giftCartId,
    this.userId,
    this.price,
    this.expiredAt,
    this.giftCart,
  });

  MyGiftCartModel copyWith({
    int? id,
    int? giftCartId,
    int? userId,
    num? price,
    DateTime? expiredAt,
    GiftCartModel? giftCart,
  }) =>
      MyGiftCartModel(
        id: id ?? this.id,
        giftCartId: giftCartId ?? this.giftCartId,
        userId: userId ?? this.userId,
        price: price ?? this.price,
        expiredAt: expiredAt ?? this.expiredAt,
        giftCart: giftCart ?? this.giftCart,
      );

  factory MyGiftCartModel.fromJson(Map<String, dynamic> json) => MyGiftCartModel(
    id: json["id"],
    giftCartId: json["gift_cart_id"],
    userId: json["user_id"],
    price: json["price"],
    expiredAt: json["expired_at"] == null ? null : DateTime.parse(json["expired_at"]).toLocal(),
    giftCart: json["giftCart"] == null ? null : GiftCartModel.fromJson(json["giftCart"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "gift_cart_id": giftCartId,
    "user_id": userId,
    "price": price,
    "expired_at": expiredAt?.toIso8601String(),
    "giftCart": giftCart?.toJson(),
  };
}

