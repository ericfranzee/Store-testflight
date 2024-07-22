
import 'package:ibeauty/domain/model/model/master_model.dart';

class BookingCalculateResponse {
  DateTime? timestamp;
  bool? status;
  String? message;
  Calculate? data;

  BookingCalculateResponse({
    this.timestamp,
    this.status,
    this.message,
    this.data,
  });

  BookingCalculateResponse copyWith({
    DateTime? timestamp,
    bool? status,
    String? message,
    Calculate? data,
  }) =>
      BookingCalculateResponse(
        timestamp: timestamp ?? this.timestamp,
        status: status ?? this.status,
        message: message ?? this.message,
        data: data ?? this.data,
      );

  factory BookingCalculateResponse.fromJson(Map<String, dynamic> json) => BookingCalculateResponse(
    timestamp: json["timestamp"] == null ? null : DateTime.parse(json["timestamp"]),
    status: json["status"],
    message: json["message"],
    data: json["data"] == null ? null : Calculate.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "timestamp": timestamp?.toIso8601String(),
    "status": status,
    "message": message,
    "data": data?.toJson(),
  };
}

class Calculate {
  bool? status;
  num? price;
  num? totalPrice;
  num? totalDiscount;
  num? totalCommissionFee;
  num? totalServiceFee;
  num? totalGiftCartPrice;
  num? rate;
  List<Item>? items;

  Calculate({
    this.status,
    this.price,
    this.totalPrice,
    this.totalDiscount,
    this.totalCommissionFee,
    this.totalServiceFee,
    this.totalGiftCartPrice,
    this.rate,
    this.items,
  });

  Calculate copyWith({
    bool? status,
    num? price,
    num? totalPrice,
    num? totalDiscount,
    num? totalCommissionFee,
    num? totalServiceFee,
    num? totalGiftCartPrice,
    num? rate,
    List<Item>? items,
  }) =>
      Calculate(
        status: status ?? this.status,
        price: price ?? this.price,
        totalPrice: totalPrice ?? this.totalPrice,
        totalDiscount: totalDiscount ?? this.totalDiscount,
        totalCommissionFee: totalCommissionFee ?? this.totalCommissionFee,
        totalServiceFee: totalServiceFee ?? this.totalServiceFee,
        rate: rate ?? this.rate,
        totalGiftCartPrice: totalGiftCartPrice ?? this.totalGiftCartPrice,
        items: items ?? this.items,
      );

  factory Calculate.fromJson(Map<String, dynamic> json) => Calculate(
    status: json["status"],
    price: json["price"],
    totalPrice: json["total_price"],
    totalDiscount: json["total_discount"],
    totalCommissionFee: json["total_commission_fee"],
    totalServiceFee: json["total_service_fee"],
    totalGiftCartPrice: json["total_gift_cart_price"],
    rate: json["rate"],
    items: json["items"] == null ? [] : List<Item>.from(json["items"]!.map((x) => Item.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "price": price,
    "total_price": totalPrice,
    "total_discount": totalDiscount,
    "total_commission_fee": totalCommissionFee,
    "total_service_fee": totalServiceFee,
    "total_gift_cart_price": totalGiftCartPrice,
    "rate": rate,
    "items": items == null ? [] : List<dynamic>.from(items!.map((x) => x.toJson())),
  };
}

class Item {
  ServiceMaster? serviceMaster;
  num? serviceFee;
  num? totalPrice;
  num? giftCartPrice;
  String? startDate;
  List<String>? errors;
  DateTime? endDate;

  Item({
    this.serviceMaster,
    this.serviceFee,
    this.giftCartPrice,
    this.totalPrice,
    this.startDate,
    this.errors,
    this.endDate,
  });

  Item copyWith({
    ServiceMaster? serviceMaster,
    num? serviceFee,
    num? giftCartPrice,
    num? totalPrice,
    String? startDate,
    List<String>? errors,
    DateTime? endDate,
  }) =>
      Item(
        serviceMaster: serviceMaster ?? this.serviceMaster,
        serviceFee: serviceFee ?? this.serviceFee,
        giftCartPrice: giftCartPrice ?? this.giftCartPrice,
        totalPrice: totalPrice ?? this.totalPrice,
        startDate: startDate ?? this.startDate,
        endDate: endDate ?? this.endDate,
        errors: errors ?? this.errors,
      );

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    serviceMaster: json["service_master"] == null ? null : ServiceMaster.fromJson(json["service_master"]),
    serviceFee: json["service_fee"],
    giftCartPrice: json["gift_cart_price"],
    totalPrice: json["total_price"],
    startDate: json["start_date"],
    errors: json["errors"] == null ? [] : List<String>.from(json["errors"] ?? []),
    endDate: json["end_date"] == null ? null : DateTime.parse(json["end_date"]),
  );

  Map<String, dynamic> toJson() => {
    "service_master": serviceMaster?.toJson(),
    "service_fee": serviceFee,
    "gift_cart_price": giftCartPrice,
    "total_price": totalPrice,
    "start_date": startDate,
    "errors": errors == null ? [] : List<dynamic>.from(errors ?? []),
    "end_date": endDate?.toIso8601String(),
  };
}
