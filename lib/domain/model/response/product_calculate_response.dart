

import 'package:ibeauty/domain/model/model/product_model.dart';
import 'package:ibeauty/domain/model/model/shop_model.dart';

import 'cart_calculate_response.dart';

class ProductCalculateResponse {
  DateTime? timestamp;
  bool? status;
  String? message;
  ProductCalculateResponseData? data;

  ProductCalculateResponse({
    this.timestamp,
    this.status,
    this.message,
    this.data,
  });

  ProductCalculateResponse copyWith({
    DateTime? timestamp,
    bool? status,
    String? message,
    ProductCalculateResponseData? data,
  }) =>
      ProductCalculateResponse(
        timestamp: timestamp ?? this.timestamp,
        status: status ?? this.status,
        message: message ?? this.message,
        data: data ?? this.data,
      );

  factory ProductCalculateResponse.fromJson(Map<String, dynamic> json) => ProductCalculateResponse(
    timestamp: json["timestamp"] == null ? null : DateTime.parse(json["timestamp"]),
    status: json["status"],
    message: json["message"],
    data: json["data"] == null ? null : ProductCalculateResponseData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "timestamp": timestamp?.toIso8601String(),
    "status": status,
    "message": message,
    "data": data?.toJson(),
  };
}



class ProductCalculateResponseData {
  List<ShopElement>? shops;
  num? totalTax;
  num? price;
  num? totalPrice;
  num? serviceFee;
  num? totalDiscount;
  List<DeliveryFee>? deliveryFee;
  num? rate;
  List<CouponElement>? coupon;
  num? couponPrice;

  ProductCalculateResponseData({
    this.shops,
    this.totalTax,
    this.price,
    this.totalPrice,
    this.serviceFee,
    this.totalDiscount,
    this.deliveryFee,
    this.rate,
    this.coupon,
    this.couponPrice,
  });

  ProductCalculateResponseData copyWith({
    List<ShopElement>? shops,
    num? totalTax,
    num? price,
    num? totalPrice,
    num? serviceFee,
    num? totalDiscount,
    List<DeliveryFee>? deliveryFee,
    num? rate,
    List<CouponElement>? coupon,
    num? couponPrice,
  }) =>
      ProductCalculateResponseData(
        shops: shops ?? this.shops,
        totalTax: totalTax ?? this.totalTax,
        price: price ?? this.price,
        totalPrice: totalPrice ?? this.totalPrice,
        serviceFee: serviceFee ?? this.serviceFee,
        totalDiscount: totalDiscount ?? this.totalDiscount,
        deliveryFee: deliveryFee ?? this.deliveryFee,
        rate: rate ?? this.rate,
        coupon: coupon ?? this.coupon,
        couponPrice: couponPrice ?? this.couponPrice,
      );

  factory ProductCalculateResponseData.fromJson(Map<String, dynamic> json) => ProductCalculateResponseData(
    shops: json["shops"] == null ? [] : List<ShopElement>.from(json["shops"]!.map((x) => ShopElement.fromJson(x))),
    totalTax: json["total_tax"]?.toDouble(),
    price: json["price"]?.toDouble(),
    totalPrice: json["total_price"]?.toDouble(),
    serviceFee: json["service_fee"],
    totalDiscount: json["total_discount"]?.toDouble(),
    deliveryFee: json["delivery_fee"] == null ? [] : List<DeliveryFee>.from(json["delivery_fee"]!.map((x) => DeliveryFee.fromJson(x))),
    rate: json["rate"],
    coupon: json["coupon"] == null ? [] : List<CouponElement>.from(json["coupon"]!.map((x) => CouponElement.fromJson(x))),
    couponPrice: json["coupon_price"],
  );

  Map<String, dynamic> toJson() => {
    "shops": shops == null ? [] : List<dynamic>.from(shops!.map((x) => x.toJson())),
    "total_tax": totalTax,
    "price": price,
    "total_price": totalPrice,
    "service_fee": serviceFee,
    "total_discount": totalDiscount,
    "delivery_fee": deliveryFee == null ? [] : List<dynamic>.from(deliveryFee!.map((x) => x.toJson())),
    "rate": rate,
    "coupon": coupon == null ? [] : List<dynamic>.from(coupon!.map((x) => x.toJson())),
    "coupon_price": couponPrice,
  };
}

class ShopElement {
  num? price;
  num? totalPrice;
  num? tax;
  num? discount;
  ShopData? shop;
  List<StockElement>? stocks;

  ShopElement({
    this.price,
    this.totalPrice,
    this.tax,
    this.discount,
    this.shop,
    this.stocks,
  });

  ShopElement copyWith({
    num? price,
    num? totalPrice,
    num? tax,
    num? discount,
    ShopData? shop,
    List<StockElement>? stocks,
  }) =>
      ShopElement(
        price: price ?? this.price,
        totalPrice: totalPrice ?? this.totalPrice,
        tax: tax ?? this.tax,
        discount: discount ?? this.discount,
        stocks: stocks ?? this.stocks,
        shop: shop ?? this.shop,
      );

  factory ShopElement.fromJson(Map<String, dynamic> json) => ShopElement(
    price: json["price"]?.toDouble(),
    totalPrice: json["total_price"]?.toDouble(),
    tax: json["tax"]?.toDouble(),
    shop: json["shop"] == null ? null : ShopData.fromJson(json["shop"]),
    discount: json["discount"]?.toDouble(),
    stocks: json["stocks"] == null ? [] : List<StockElement>.from(json["stocks"]!.map((x) => StockElement.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "price": price,
    "total_price": totalPrice,
    "tax": tax,
    "shop": shop?.toJson(),
    "discount": discount,
    "stocks": stocks == null ? [] : List<dynamic>.from(stocks!.map((x) => x.toJson())),
  };
}

class StockElement {
  int? id;
  int? shopId;
  num? price;
  num? productPrice;
  int? quantity;
  num? productQuantity;
  num? tax;
  num? discount;
  num? totalPrice;
  Stocks? stock;

  StockElement({
    this.id,
    this.shopId,
    this.price,
    this.productPrice,
    this.quantity,
    this.productQuantity,
    this.tax,
    this.discount,
    this.totalPrice,
    this.stock,
  });

  StockElement copyWith({
    int? id,
    int? shopId,
    num? price,
    num? productPrice,
    int? quantity,
    num? productQuantity,
    num? tax,
    num? discount,
    num? totalPrice,
    Stocks? stock,
  }) =>
      StockElement(
        id: id ?? this.id,
        shopId: shopId ?? this.shopId,
        price: price ?? this.price,
        productPrice: productPrice ?? this.productPrice,
        quantity: quantity ?? this.quantity,
        productQuantity: productQuantity ?? this.productQuantity,
        tax: tax ?? this.tax,
        discount: discount ?? this.discount,
        totalPrice: totalPrice ?? this.totalPrice,
        stock: stock ?? this.stock,
      );

  factory StockElement.fromJson(Map<String, dynamic> json) => StockElement(
    id: json["id"],
    shopId: json["shop_id"],
    price: json["price"],
    productPrice: json["product_price"]?.toDouble(),
    quantity: json["quantity"],
    productQuantity: json["product_quantity"],
    tax: json["tax"],
    discount: json["discount"]?.toDouble(),
    totalPrice: json["total_price"]?.toDouble(),
    stock: json["stock"] == null ? null : Stocks.fromJson(json["stock"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "shop_id": shopId,
    "price": price,
    "product_price": productPrice,
    "quantity": quantity,
    "product_quantity": productQuantity,
    "tax": tax,
    "discount": discount,
    "total_price": totalPrice,
    "stock": stock?.toJson(),
  };
}


