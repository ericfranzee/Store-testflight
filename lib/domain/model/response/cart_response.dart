// To parse this JSON data, do
//
//     final cartModel = cartModelFromJson(jsonString);

import 'package:ibeauty/domain/model/model/product_model.dart';
import 'package:ibeauty/domain/model/model/review_data.dart';
import 'package:ibeauty/domain/model/model/shop_model.dart';

class CartModel {
  DateTime? timestamp;
  bool? status;
  String? message;
  Cart? cart;

  CartModel({
    this.timestamp,
    this.status,
    this.message,
    this.cart,
  });

  CartModel copyWith({
    DateTime? timestamp,
    bool? status,
    String? message,
    Cart? cart,
  }) =>
      CartModel(
        timestamp: timestamp ?? this.timestamp,
        status: status ?? this.status,
        message: message ?? this.message,
        cart: cart ?? this.cart,
      );

  factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
    timestamp: json["timestamp"] == null
        ? null
        : DateTime.parse(json["timestamp"]),
    status: json["status"],
    message: json["message"],
    cart: json["data"] == null ? null : Cart.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "timestamp": timestamp?.toIso8601String(),
    "status": status,
    "message": message,
    "data": cart?.toJson(),
  };
}

class Cart {
  int? id;
  int? ownerId;
  bool? status;
  num? totalPrice;
  int? currencyId;
  num? rate;
  bool? group;
  DateTime? createdAt;
  DateTime? updatedAt;
  List<UserCart>? userCarts;

  Cart({
    this.id,
    this.ownerId,
    this.status,
    this.totalPrice,
    this.currencyId,
    this.rate,
    this.group,
    this.createdAt,
    this.updatedAt,
    this.userCarts,
  });

  Cart copyWith({
    int? id,
    int? ownerId,
    bool? status,
    num? totalPrice,
    int? currencyId,
    num? rate,
    bool? group,
    DateTime? createdAt,
    DateTime? updatedAt,
    List<UserCart>? userCarts,
  }) =>
      Cart(
        id: id ?? this.id,
        ownerId: ownerId ?? this.ownerId,
        status: status ?? this.status,
        totalPrice: totalPrice ?? this.totalPrice,
        currencyId: currencyId ?? this.currencyId,
        rate: rate ?? this.rate,
        group: group ?? this.group,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        userCarts: userCarts ?? this.userCarts,
      );

  factory Cart.fromJson(Map<String, dynamic> json) => Cart(
    id: json["id"],
    ownerId: json["owner_id"],
    status: json["status"],
    totalPrice: json["total_price"],
    currencyId: json["currency_id"],
    rate: json["rate"],
    group: json["group"],
    createdAt: json["created_at"] == null
        ? null
        : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null
        ? null
        : DateTime.parse(json["updated_at"]),
    userCarts: json["user_carts"] == null
        ? []
        : List<UserCart>.from(
        json["user_carts"]!.map((x) => UserCart.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "owner_id": ownerId,
    "status": status,
    "total_price": totalPrice,
    "currency_id": currencyId,
    "rate": rate,
    "group": group,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "user_carts": userCarts == null
        ? []
        : List<dynamic>.from(userCarts!.map((x) => x.toJson())),
  };
}

class UserCart {
  int? id;
  int? cartId;
  int? userId;
  bool? status;
  dynamic name;
  String? uuid;
  List<CartDetail>? cartDetails;

  UserCart({
    this.id,
    this.cartId,
    this.userId,
    this.status,
    this.name,
    this.uuid,
    this.cartDetails,
  });

  UserCart copyWith({
    int? id,
    int? cartId,
    int? userId,
    bool? status,
    dynamic name,
    String? uuid,
    List<CartDetail>? cartDetails,
  }) =>
      UserCart(
        id: id ?? this.id,
        cartId: cartId ?? this.cartId,
        userId: userId ?? this.userId,
        status: status ?? this.status,
        name: name ?? this.name,
        uuid: uuid ?? this.uuid,
        cartDetails: cartDetails ?? this.cartDetails,
      );

  factory UserCart.fromJson(Map<String, dynamic> json) => UserCart(
    id: json["id"],
    cartId: json["cart_id"],
    userId: json["user_id"],
    status: json["status"],
    name: json["name"],
    uuid: json["uuid"],
    cartDetails: json["cartDetails"] == null
        ? []
        : List<CartDetail>.from(
        json["cartDetails"]!.map((x) => CartDetail.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "cart_id": cartId,
    "user_id": userId,
    "status": status,
    "name": name,
    "uuid": uuid,
    "cartDetails": cartDetails == null
        ? []
        : List<dynamic>.from(cartDetails!.map((x) => x.toJson())),
  };
}

class CartDetail {
  int? id;
  int? shopId;
  DateTime? updatedAt;
  num? shopTax;
  num? discount;
  num? totalPrice;
  num? couponPrice;
  ShopData? shop;
  List<CartDetailProduct>? cartDetailProducts;

  CartDetail({
    this.id,
    this.shopId,
    this.updatedAt,
    this.shopTax,
    this.discount,
    this.totalPrice,
    this.couponPrice,
    this.shop,
    this.cartDetailProducts,
  });

  CartDetail copyWith({
    int? id,
    int? shopId,
    DateTime? updatedAt,
    num? shopTax,
    num? discount,
    num? totalPrice,
    num? couponPrice,
    ShopData? shop,
    List<CartDetailProduct>? cartDetailProducts,
  }) =>
      CartDetail(
        id: id ?? this.id,
        shopId: shopId ?? this.shopId,
        updatedAt: updatedAt ?? this.updatedAt,
        shopTax: shopTax ?? this.shopTax,
        discount: discount ?? this.discount,
        totalPrice: totalPrice ?? this.totalPrice,
        couponPrice: couponPrice ?? this.couponPrice,
        shop: shop ?? this.shop,
        cartDetailProducts: cartDetailProducts ?? this.cartDetailProducts,
      );

  factory CartDetail.fromJson(Map<String, dynamic> json) => CartDetail(
    id: json["id"],
    shopId: json["shop_id"],
    updatedAt: json["updated_at"] == null
        ? null
        : DateTime.parse(json["updated_at"]),
    shopTax: json["shop_tax"],
    discount: json["discount"],
    totalPrice: json["total_price"],
    couponPrice: json["coupon_price"],
    shop: json["shop"] == null ? null : ShopData.fromJson(json["shop"]),
    cartDetailProducts: json["cartDetailProducts"] == null
        ? []
        : List<CartDetailProduct>.from(json["cartDetailProducts"]!
        .map((x) => CartDetailProduct.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "shop_id": shopId,
    "updated_at": updatedAt?.toIso8601String(),
    "shop_tax": shopTax,
    "discount": discount,
    "total_price": totalPrice,
    "coupon_price": couponPrice,
    "shop": shop?.toJson(),
    "cartDetailProducts": cartDetailProducts == null
        ? []
        : List<dynamic>.from(cartDetailProducts!.map((x) => x.toJson())),
  };
}

class CartDetailProduct {
  int? id;
  int? quantity;
  int? replaceQuantity;
  bool? bonus;
  num? price;
  num? discount;
  String? note;
  String? replaceNote;
  DateTime? updatedAt;
  Stocks? stocks;
  Stocks? replaceStock;
  List<Galleries>? galleries;

  CartDetailProduct({
    this.id,
    this.quantity,
    this.replaceQuantity,
    this.bonus,
    this.price,
    this.discount,
    this.note,
    this.replaceNote,
    this.updatedAt,
    this.stocks,
    this.replaceStock,
    this.galleries,
  });

  CartDetailProduct copyWith({
    int? id,
    int? quantity,
    int? replaceQuantity,
    bool? bonus,
    int? price,
    int? discount,
    String? note,
    String? replaceNote,
    DateTime? updatedAt,
    Stocks? stocks,
    Stocks? replaceStock,
    List<Galleries>? galleries,
  }) =>
      CartDetailProduct(
        id: id ?? this.id,
        quantity: quantity ?? this.quantity,
        replaceQuantity: replaceQuantity ?? this.replaceQuantity,
        bonus: bonus ?? this.bonus,
        price: price ?? this.price,
        note: note ?? this.note,
        replaceNote: replaceNote ?? this.replaceNote,
        discount: discount ?? this.discount,
        updatedAt: updatedAt ?? this.updatedAt,
        stocks: stocks ?? this.stocks,
        replaceStock: replaceStock ?? this.replaceStock,
        galleries: galleries ?? this.galleries,
      );

  factory CartDetailProduct.fromJson(Map<String, dynamic> json) =>
      CartDetailProduct(
        id: json["id"],
        quantity: json["quantity"],
        replaceQuantity: json["replace_quantity"],
        bonus: json["bonus"],
        price: json["price"],
        note: json["note"],
        replaceNote: json["replace_note"],
        discount: json["discount"],
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        stocks: Stocks.fromJson(json["stock"]),
        replaceStock: json["replace_stock"] != null
            ? Stocks.fromJson(json["replace_stock"])
            : null,
        galleries: json["galleries"] != null
            ? List<Galleries>.from(
            json["galleries"].map((x) => Galleries.fromJson(x)))
            : [],
      );

  Map<String, dynamic> toJson() => {
    "id": id,
    "quantity": quantity,
    "bonus": bonus,
    "price": price,
    "note": note,
    "discount": discount,
    "updated_at": updatedAt?.toIso8601String(),
    "stock": stocks?.toJson(),
  };
}

class ProductNote {
  int? stockId;
  String? comment;

  ProductNote({this.stockId, this.comment});
}
