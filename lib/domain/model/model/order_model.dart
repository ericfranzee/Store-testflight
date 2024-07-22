import 'package:ibeauty/domain/model/model/coupon_model.dart';
import 'package:ibeauty/domain/model/model/currency_model.dart';
import 'package:ibeauty/domain/model/model/shop_model.dart';
import 'package:ibeauty/domain/model/response/cart_response.dart';
import 'package:ibeauty/domain/model/response/delivery_point_response.dart';
import 'package:ibeauty/domain/model/response/refund_pagination_response.dart';
import 'package:ibeauty/domain/model/response/transactions_response.dart';

import '../response/user_address_response.dart';
import 'location_model.dart';
import 'review_data.dart';
import 'user_model.dart';

class OrderModel {
  List<OrderShops>? orderShops;

  OrderModel({
    this.orderShops,
  });

  OrderModel copyWith({
    List<OrderShops>? orderShops,
  }) =>
      OrderModel(
        orderShops: orderShops ?? this.orderShops,
      );

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
    orderShops: json["data"] == null
        ? []
        : List<OrderShops>.from(
        json["data"]!.map((x) => OrderShops.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": orderShops == null
        ? []
        : List<dynamic>.from(orderShops!.map((x) => x.toJson())),
  };
}

class OrderShops {
  int? id;
  int? parentId;
  int? userId;
  num? totalPrice;
  num? totalPriceByParent;
  num? originPrice;
  num? totalDiscount;
  num? sellerFee;
  num? rate;
  num? tax;
  num? commissionFee;
  num? serviceFee;
  num? totalCouponPrice;
  String? status;
  String? trackName;
  String? trackId;
  String? trackUrl;
  String? idsByParent;
  LocationModel? location;
  UserAddress? address;
  String? deliveryType;
  num? deliveryFee;
  DateTime? deliveryDate;
  String? phone;
  String? username;
  bool? current;
  num? type;
  num? cartId;
  DateTime? createdAt;
  DateTime? updatedAt;
  ShopData? shop;
  CurrencyData? currency;
  UserModel? user;
  UserModel? deliveryMan;
  List<CartDetailProduct>? details;
  TransactionData? transaction;
  List<RefundModel>? refunds;
  List<dynamic>? pointHistories;
  List<dynamic>? orderRefunds;
  CouponData? coupon;
  List<Galleries>? galleries;
  dynamic myAddress;
  DeliveryPoint? deliveryPoint;
  DeliveryPoint? deliveryPrice;
  String? img;
  String? note;
  List<Notes>? notes;

  OrderShops({
    this.id,
    this.idsByParent,
    this.parentId,
    this.userId,
    this.totalPrice,
    this.totalPriceByParent,
    this.originPrice,
    this.totalDiscount,
    this.totalCouponPrice,
    this.sellerFee,
    this.rate,
    this.tax,
    this.commissionFee,
    this.serviceFee,
    this.status,
    this.trackName,
    this.trackId,
    this.trackUrl,
    this.location,
    this.address,
    this.deliveryType,
    this.deliveryFee,
    this.deliveryDate,
    this.phone,
    this.username,
    this.current,
    this.type,
    this.cartId,
    this.createdAt,
    this.updatedAt,
    this.shop,
    this.currency,
    this.user,
    this.deliveryMan,
    this.details,
    this.transaction,
    this.refunds,
    this.pointHistories,
    this.orderRefunds,
    this.coupon,
    this.galleries,
    this.myAddress,
    this.deliveryPoint,
    this.deliveryPrice,
    this.img,
    this.note,
    this.notes,
  });

  OrderShops copyWith({
    int? id,
    int? parentId,
    int? userId,
    num? totalPrice,
    num? totalPriceByParent,
    num? totalDiscount,
    num? originPrice,
    num? totalCouponPrice,
    num? sellerFee,
    num? rate,
    num? tax,
    num? commissionFee,
    num? serviceFee,
    String? status,
    String? idsByParent,
    String? trackName,
    String? trackId,
    String? trackUrl,
    LocationModel? location,
    UserAddress? address,
    String? deliveryType,
    num? deliveryFee,
    DateTime? deliveryDate,
    String? phone,
    String? username,
    bool? current,
    num? type,
    num? cartId,
    DateTime? createdAt,
    DateTime? updatedAt,
    ShopData? shop,
    CurrencyData? currency,
    UserModel? user,
    UserModel? deliveryMan,
    List<CartDetailProduct>? details,
    TransactionData? transaction,
    List<RefundModel>? refunds,
    List<dynamic>? pointHistories,
    List<dynamic>? orderRefunds,
    CouponData? coupon,
    List<Galleries>? galleries,
    dynamic myAddress,
    DeliveryPoint? deliveryPoint,
    DeliveryPoint? deliveryPrice,
    String? img,
    String? note,
    List<Notes>? notes,
  }) =>
      OrderShops(
        id: id ?? this.id,
        parentId: parentId ?? this.parentId,
        userId: userId ?? this.userId,
        totalPrice: totalPrice ?? this.totalPrice,
        totalPriceByParent: totalPriceByParent ?? this.totalPriceByParent,
        totalDiscount: totalDiscount ?? this.totalDiscount,
        originPrice: originPrice ?? this.originPrice,
        totalCouponPrice: originPrice ?? this.totalCouponPrice,
        sellerFee: sellerFee ?? this.sellerFee,
        idsByParent: idsByParent ?? this.idsByParent,
        rate: rate ?? this.rate,
        tax: tax ?? this.tax,
        commissionFee: commissionFee ?? this.commissionFee,
        serviceFee: serviceFee ?? this.serviceFee,
        status: status ?? this.status,
        trackName: trackName ?? this.trackName,
        trackId: trackId ?? this.trackId,
        trackUrl: trackUrl ?? this.trackUrl,
        location: location ?? this.location,
        address: address ?? this.address,
        deliveryType: deliveryType ?? this.deliveryType,
        deliveryFee: deliveryFee ?? this.deliveryFee,
        deliveryDate: deliveryDate ?? this.deliveryDate,
        phone: phone ?? this.phone,
        username: username ?? this.username,
        current: current ?? this.current,
        type: type ?? this.type,
        cartId: cartId ?? this.cartId,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        shop: shop ?? this.shop,
        currency: currency ?? this.currency,
        user: user ?? this.user,
        deliveryMan: deliveryMan ?? this.deliveryMan,
        details: details ?? this.details,
        transaction: transaction ?? this.transaction,
        refunds: refunds ?? this.refunds,
        pointHistories: pointHistories ?? this.pointHistories,
        orderRefunds: orderRefunds ?? this.orderRefunds,
        coupon: coupon ?? this.coupon,
        galleries: galleries ?? this.galleries,
        myAddress: myAddress ?? this.myAddress,
        deliveryPoint: deliveryPoint ?? this.deliveryPoint,
        deliveryPrice: deliveryPrice ?? this.deliveryPrice,
        img: img ?? this.img,
        note: note ?? this.note,
        notes: notes ?? this.notes,
      );

  factory OrderShops.fromJson(Map<String, dynamic> json) => OrderShops(
    id: json["id"],
    parentId: json["parent_id"],
    userId: json["user_id"],
    idsByParent: json["ids_by_parent"].toString(),
    totalPrice: json["total_price"],
    totalPriceByParent: json["total_price_by_parent"],
    totalDiscount: json["total_discount"],
    originPrice: json["origin_price"],
    totalCouponPrice: json["coupon_price"],
    sellerFee: json["seller_fee"],
    rate: json["rate"],
    tax: json["tax"],
    commissionFee: json["commission_fee"],
    serviceFee: json["service_fee"],
    status: json["status"],
    trackUrl: json["track_url"],
    trackName: json["track_name"],
    trackId: json["track_id"],
    location: json["location"] == null
        ? null
        : LocationModel.fromJson(json["location"]),
    address: json["my_address"] == null
        ? null
        : UserAddress.fromJson(json["my_address"]),
    deliveryType: json["delivery_type"],
    deliveryFee: json["delivery_fee"],
    deliveryDate: json["delivery_date"] == null
        ? null
        : DateTime.parse(json["delivery_date"]).toLocal(),
    phone: json["phone"],
    username: json["username"],
    current: json["current"],
    type: json["type"],
    cartId: json["cart_id"],
    createdAt: json["created_at"] == null
        ? null
        : DateTime.parse(json["created_at"]).toLocal(),
    updatedAt: json["updated_at"] == null
        ? null
        : DateTime.parse(json["updated_at"]).toLocal(),
    shop: json["shop"] == null ? null : ShopData.fromJson(json["shop"]),
    currency: json["currency"] == null
        ? null
        : CurrencyData.fromJson(json["currency"]),
    user: json["user"] == null ? null : UserModel.fromJson(json["user"]),
    deliveryMan: json["deliveryman"] == null
        ? null
        : UserModel.fromJson(json["deliveryman"]),
    details: json["details"] == null
        ? []
        : List<CartDetailProduct>.from(
        json["details"]!.map((x) => CartDetailProduct.fromJson(x))),
    transaction: json["transaction"] == null
        ? null
        : TransactionData.fromJson(json["transaction"]),
    refunds: json["refunds"] == null
        ? []
        : List<RefundModel>.from(
        json["refunds"]!.map((x) => RefundModel.fromJson(x))),
    pointHistories: json["point_histories"] == null
        ? []
        : List<dynamic>.from(json["point_histories"]!.map((x) => x)),
    orderRefunds: json["order_refunds"] == null
        ? []
        : List<dynamic>.from(json["order_refunds"]!.map((x) => x)),
    coupon:
    json["coupon"] == null ? null : CouponData.fromJson(json["coupon"]),
    galleries: json["galleries"] == null
        ? []
        : List<Galleries>.from(
        json["galleries"]!.map((x) => Galleries.fromJson(x))),
    myAddress: json["my_address"],
    deliveryPoint: json["delivery_point"] == null
        ? null
        : DeliveryPoint.fromJson(json["delivery_point"]),
    deliveryPrice: json["delivery_price"] == null
        ? null
        : DeliveryPoint.fromJson(json["delivery_price"]),
    img: json["img"],
    note: json["note"],
    notes: json["notes"] == null
        ? []
        : List<Notes>.from(json["notes"]!.map((x) => Notes.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "parent_id": parentId,
    "user_id": userId,
    "total_price": totalPrice,
    "total_discount": totalDiscount,
    "total_price_by_parent": totalPriceByParent,
    "coupon_price": totalCouponPrice,
    "origin_price": originPrice,
    "seller_fee": sellerFee,
    "rate": rate,
    "tax": tax,
    "commission_fee": commissionFee,
    "service_fee": serviceFee,
    "status": status,
    "track_name": trackName,
    "track_id": trackId,
    "track_url": trackUrl,
    "location": location?.toJson(),
    "address": address?.toJson(),
    "delivery_type": deliveryType,
    "delivery_fee": deliveryFee,
    "delivery_date": deliveryDate?.toIso8601String(),
    "phone": phone,
    "username": username,
    "current": current,
    "type": type,
    "cart_id": cartId,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "shop": shop?.toJson(),
    "currency": currency?.toJson(),
    "user": user?.toJson(),
    "deliveryman": deliveryMan?.toJson(),
    "details": details == null
        ? []
        : List<dynamic>.from(details!.map((x) => x.toJson())),
    "transaction": transaction,
    "refunds": refunds == null
        ? []
        : List<dynamic>.from(refunds!.map((x) => x.toJson())),
    "point_histories": pointHistories == null
        ? []
        : List<dynamic>.from(pointHistories!.map((x) => x)),
    "order_refunds": orderRefunds == null
        ? []
        : List<dynamic>.from(orderRefunds!.map((x) => x)),
    "coupon": coupon,
    "galleries": galleries == null
        ? []
        : List<dynamic>.from(galleries!.map((x) => x.toJson())),
    "my_address": myAddress,
    "delivery_point": deliveryPoint,
    "delivery_price": deliveryPrice?.toJson(),
    "img": img,
    "notes": notes == null
        ? []
        : List<dynamic>.from(notes!.map((x) => x.toJson())),
  };
}

class Notes {
  int? id;
  int? orderId;
  String? status;
  List<NoteNote>? notes;
  DateTime? createdAt;
  DateTime? updatedAt;

  Notes({
    this.id,
    this.orderId,
    this.status,
    this.notes,
    this.createdAt,
    this.updatedAt,
  });

  Notes copyWith({
    int? id,
    int? orderId,
    String? status,
    List<NoteNote>? notes,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      Notes(
        id: id ?? this.id,
        orderId: orderId ?? this.orderId,
        status: status ?? this.status,
        notes: notes ?? this.notes,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory Notes.fromJson(Map<String, dynamic> json) => Notes(
    id: json["id"],
    orderId: json["order_id"],
    status: json["status"],
    notes: json["notes"] == null
        ? []
        : List<NoteNote>.from(
        json["notes"]!.map((x) => NoteNote.fromJson(x))),
    createdAt: json["created_at"] == null
        ? null
        : DateTime.parse(json["created_at"]).toLocal(),
    updatedAt: json["updated_at"] == null
        ? null
        : DateTime.parse(json["updated_at"]).toLocal(),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "order_id": orderId,
    "status": status,
    "notes": notes == null
        ? []
        : List<dynamic>.from(notes!.map((x) => x.toJson())),
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}

class NoteNote {
  Map? title;
  DateTime? createdAt;

  NoteNote({
    this.title,
    this.createdAt,
  });

  NoteNote copyWith({
    Map? title,
    DateTime? createdAt,
  }) =>
      NoteNote(
        title: title ?? this.title,
        createdAt: createdAt ?? this.createdAt,
      );

  factory NoteNote.fromJson(Map<String, dynamic> json) => NoteNote(
    title: json["title"],
    createdAt: json["created_at"] == null
        ? null
        : DateTime.parse(json["created_at"]).toLocal(),
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "created_at": createdAt?.toIso8601String(),
  };
}