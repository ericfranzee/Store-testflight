// To parse this JSON data, do
//
//     final cartCalculateResponse = cartCalculateResponseFromJson(jsonString);

import 'dart:convert';

CartCalculateResponse cartCalculateResponseFromJson(String str) => CartCalculateResponse.fromJson(json.decode(str));

String cartCalculateResponseToJson(CartCalculateResponse data) => json.encode(data.toJson());

class CartCalculateResponse {
  DateTime? timestamp;
  bool? status;
  String? message;
  CartCalculate? data;

  CartCalculateResponse({
    this.timestamp,
    this.status,
    this.message,
    this.data,
  });

  CartCalculateResponse copyWith({
    DateTime? timestamp,
    bool? status,
    String? message,
    CartCalculate? data,
  }) =>
      CartCalculateResponse(
        timestamp: timestamp ?? this.timestamp,
        status: status ?? this.status,
        message: message ?? this.message,
        data: data ?? this.data,
      );

  factory CartCalculateResponse.fromJson(Map<String, dynamic> json) => CartCalculateResponse(
    timestamp: json["timestamp"] == null ? null : DateTime.parse(json["timestamp"]),
    status: json["status"],
    message: json["message"],
    data: json["data"] == null ? null : CartCalculate.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "timestamp": timestamp?.toIso8601String(),
    "status": status,
    "message": message,
    "data": data?.toJson(),
  };
}

class CartCalculate {
  num? totalTax;
  num? price;
  num? totalShopTax;
  num? totalPrice;
  List<DeliveryFee>? deliveryFee;
  num? totalDiscount;
  List<CouponElement>? coupon;
  num? rate;
  num? serviceFee;

  CartCalculate({
    this.totalTax,
    this.price,
    this.totalShopTax,
    this.totalPrice,
    this.deliveryFee,
    this.totalDiscount,
    this.coupon,
    this.rate,
    this.serviceFee,
  });

  CartCalculate copyWith({
    num? totalTax,
    num? price,
    num? totalShopTax,
    num? totalPrice,
    List<DeliveryFee>? deliveryFee,
    num? totalDiscount,
    List<CouponElement>? coupon,
    num? rate,
    num? serviceFee,
  }) =>
      CartCalculate(
        totalTax: totalTax ?? this.totalTax,
        price: price ?? this.price,
        totalShopTax: totalShopTax ?? this.totalShopTax,
        totalPrice: totalPrice ?? this.totalPrice,
        deliveryFee: deliveryFee ?? this.deliveryFee,
        totalDiscount: totalDiscount ?? this.totalDiscount,
        coupon: coupon ?? this.coupon,
        rate: rate ?? this.rate,
        serviceFee: serviceFee ?? this.serviceFee,
      );

  factory CartCalculate.fromJson(Map<String, dynamic> json) => CartCalculate(
    totalTax: json["total_tax"]?.toDouble(),
    price: json["price"]?.toDouble(),
    totalShopTax: json["total_shop_tax"]?.toDouble(),
    totalPrice: json["total_price"]?.toDouble(),
    deliveryFee: json["delivery_fee"] == null ? [] : List<DeliveryFee>.from(json["delivery_fee"]!.map((x) => DeliveryFee.fromJson(x))),
    totalDiscount: json["total_discount"],
    coupon: json["coupon"] == null ? [] : List<CouponElement>.from(json["coupon"]!.map((x) => CouponElement.fromJson(x))),
    rate: json["rate"],
    serviceFee: json["service_fee"],
  );

  Map<String, dynamic> toJson() => {
    "total_tax": totalTax,
    "price": price,
    "total_shop_tax": totalShopTax,
    "total_price": totalPrice,
    "delivery_fee": deliveryFee == null ? [] : List<dynamic>.from(deliveryFee!.map((x) => x.toJson())),
    "total_discount": totalDiscount,
    "coupon": coupon == null ? [] : List<dynamic>.from(coupon!.map((x) => x.toJson())),
    "rate": rate,
    "service_fee": serviceFee,
  };
}

class CouponElement {
  int? shopId;
  num? price;
  CouponCoupon? coupon;

  CouponElement({
    this.shopId,
    this.price,
    this.coupon,
  });

  CouponElement copyWith({
    int? shopId,
    num? price,
    CouponCoupon? coupon,
  }) =>
      CouponElement(
        shopId: shopId ?? this.shopId,
        price: price ?? this.price,
        coupon: coupon ?? this.coupon,
      );

  factory CouponElement.fromJson(Map<String, dynamic> json) => CouponElement(
    shopId: json["shop_id"],
    price: json["price"],
    coupon: json["coupon"] == null ? null : CouponCoupon.fromJson(json["coupon"]),
  );

  Map<String, dynamic> toJson() => {
    "shop_id": shopId,
    "price": price,
    "coupon": coupon?.toJson(),
  };
}

class CouponCoupon {
  int? id;
  String? name;
  String? type;
  int? qty;
  num? price;
  DateTime? expiredAt;
  String? couponFor;
  int? shopId;
  DateTime? createdAt;
  DateTime? updatedAt;

  CouponCoupon({
    this.id,
    this.name,
    this.type,
    this.qty,
    this.price,
    this.expiredAt,
    this.couponFor,
    this.shopId,
    this.createdAt,
    this.updatedAt,
  });

  CouponCoupon copyWith({
    int? id,
    String? name,
    String? type,
    int? qty,
    num? price,
    DateTime? expiredAt,
    String? couponFor,
    int? shopId,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      CouponCoupon(
        id: id ?? this.id,
        name: name ?? this.name,
        type: type ?? this.type,
        qty: qty ?? this.qty,
        price: price ?? this.price,
        expiredAt: expiredAt ?? this.expiredAt,
        couponFor: couponFor ?? this.couponFor,
        shopId: shopId ?? this.shopId,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory CouponCoupon.fromJson(Map<String, dynamic> json) => CouponCoupon(
    id: json["id"],
    name: json["name"],
    type: json["type"],
    qty: json["qty"],
    price: json["price"],
    expiredAt: json["expired_at"] == null ? null : DateTime.parse(json["expired_at"]),
    couponFor: json["for"],
    shopId: json["shop_id"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "type": type,
    "qty": qty,
    "price": price,
    "expired_at": expiredAt?.toIso8601String(),
    "for": couponFor,
    "shop_id": shopId,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}

class DeliveryFee {
  int? shopId;
  num? price;

  DeliveryFee({
    this.shopId,
    this.price,
  });

  DeliveryFee copyWith({
    int? shopId,
    num? price,
  }) =>
      DeliveryFee(
        shopId: shopId ?? this.shopId,
        price: price ?? this.price,
      );

  factory DeliveryFee.fromJson(Map<String, dynamic> json) => DeliveryFee(
    shopId: json["shop_id"],
    price: json["price"],
  );

  Map<String, dynamic> toJson() => {
    "shop_id": shopId,
    "price": price,
  };
}
