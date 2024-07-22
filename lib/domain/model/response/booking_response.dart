import 'package:ibeauty/domain/model/model/master_model.dart';
import 'package:ibeauty/domain/model/model/shop_model.dart';
import 'package:ibeauty/domain/model/model/user_model.dart';
import 'package:ibeauty/domain/model/response/form_options_response.dart';
import 'package:ibeauty/domain/model/response/review_pagination_response.dart';

class BookingResponse {
  List<BookingModel>? data;

  BookingResponse({
    this.data,
  });

  BookingResponse copyWith({
    List<BookingModel>? data,
  }) =>
      BookingResponse(
        data: data ?? this.data,
      );

  factory BookingResponse.fromJson(Map<String, dynamic> json) =>
      BookingResponse(
        data: json["data"] == null
            ? []
            : List<BookingModel>.from(
                json["data"]!.map((x) => BookingModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class BookingModel {
  int? id;
  int? serviceMasterId;
  int? masterId;
  int? userId;
  int? currencyId;
  ReviewModel? review;
  num? rate;
  DateTime? startDate;
  DateTime? endDate;
  num? price;
  num? commissionFee;
  String? status;
  String? note;
  DateTime? createdAt;
  DateTime? updatedAt;
  num? ratePrice;
  num? rateCommissionFee;
  num? totalPrice;
  num? totalPriceByParent;
  ServiceMaster? serviceMaster;
  MasterModel? master;
  UserModel? user;
  ShopData? shop;
  BookingAddressModel? address;

  BookingModel({
    this.id,
    this.serviceMasterId,
    this.masterId,
    this.userId,
    this.review,
    this.currencyId,
    this.rate,
    this.totalPriceByParent,
    this.startDate,
    this.endDate,
    this.price,
    this.commissionFee,
    this.status,
    this.note,
    this.address,
    this.createdAt,
    this.updatedAt,
    this.ratePrice,
    this.rateCommissionFee,
    this.totalPrice,
    this.serviceMaster,
    this.master,
    this.shop,
    this.user,
  });

  BookingModel copyWith({
    int? id,
    int? serviceMasterId,
    int? masterId,
    int? userId,
    int? currencyId,
    ReviewModel? review,
    num? rate,
    DateTime? startDate,
    DateTime? endDate,
    num? price,
    num? commissionFee,
    String? status,
    String? note,
    DateTime? createdAt,
    DateTime? updatedAt,
    num? ratePrice,
    num? rateCommissionFee,
    num? totalPrice,
    num? totalPriceByParent,
    ServiceMaster? serviceMaster,
    MasterModel? master,
    UserModel? user,
    ShopData? shop,
    BookingAddressModel? address,
  }) =>
      BookingModel(
        id: id ?? this.id,
        serviceMasterId: serviceMasterId ?? this.serviceMasterId,
        masterId: masterId ?? this.masterId,
        userId: userId ?? this.userId,
        review: review ?? this.review,
        currencyId: currencyId ?? this.currencyId,
        rate: rate ?? this.rate,
        address: address ?? this.address,
        startDate: startDate ?? this.startDate,
        endDate: endDate ?? this.endDate,
        price: price ?? this.price,
        totalPriceByParent: totalPriceByParent ?? this.totalPriceByParent,
        commissionFee: commissionFee ?? this.commissionFee,
        status: status ?? this.status,
        note: note ?? this.note,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        ratePrice: ratePrice ?? this.ratePrice,
        rateCommissionFee: rateCommissionFee ?? this.rateCommissionFee,
        totalPrice: totalPrice ?? this.totalPrice,
        serviceMaster: serviceMaster ?? this.serviceMaster,
        master: master ?? this.master,
        user: user ?? this.user,
        shop: shop ?? this.shop,
      );

  factory BookingModel.fromJson(Map<String, dynamic> json) => BookingModel(
        id: json["id"],
        serviceMasterId: json["service_master_id"],
        masterId: json["master_id"],
        userId: json["user_id"],
        review: json["review"] == null
            ? null
            : ReviewModel.fromJson(json["review"]),
        currencyId: json["currency_id"],
        rate: json["rate"],
        startDate: json["start_date"] == null
            ? null
            : DateTime.parse(json["start_date"]),
        endDate:
            json["end_date"] == null ? null : DateTime.parse(json["end_date"]),
        price: json["price"],
        totalPriceByParent: json["total_price_by_parent"],
        commissionFee: json["commission_fee"],
        status: json["status"],
        note: json["note"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]).toLocal(),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]).toLocal(),
        ratePrice: json["rate_price"],
        rateCommissionFee: json["rate_commission_fee"],
        totalPrice: json["total_price"],
        serviceMaster: json["service_master"] == null
            ? null
            : ServiceMaster.fromJson(json["service_master"]),
        address: json["data"] == null
            ? null
            : BookingAddressModel.fromJson(json["data"]),
        master: json["master"] == null
            ? null
            : MasterModel.fromJson(json["master"]),
        shop: json["shop"] == null ? null : ShopData.fromJson(json["shop"]),
        user: json["user"] == null ? null : UserModel.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "service_master_id": serviceMasterId,
        "master_id": masterId,
        "review": review?.toJson(),
        "user_id": userId,
        "currency_id": currencyId,
        "rate": rate,
        "start_date": startDate?.toIso8601String(),
        "end_date": endDate?.toIso8601String(),
        "price": price,
        "total_price_by_parent": totalPriceByParent,
        "commission_fee": commissionFee,
        "status": status,
        "note": note,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "rate_price": ratePrice,
        "rate_commission_fee": rateCommissionFee,
        "total_price": totalPrice,
        "service_master": serviceMaster?.toJson(),
        "master": master?.toJson(),
        "user": user?.toJson(),
        "shop": shop?.toJson(),
        "data": address?.toJson(),
      };
}

class BookingAddressModel {
  String? address;
  List<FormOptionsData>? forms;

  BookingAddressModel({
    this.address,
    this.forms,
  });

  BookingAddressModel copyWith({
    String? address,
    List<FormOptionsData>? forms,
  }) =>
      BookingAddressModel(
        address: address ?? this.address,
        forms: forms ?? this.forms,
      );

  factory BookingAddressModel.fromJson(Map<String, dynamic> json) =>
      BookingAddressModel(
        address: json["address"],
        forms: json["form"] == null
            ? null
            : List<FormOptionsData>.from(
                json["form"]?.map((x) => FormOptionsData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "address": address,
        "form": List<dynamic>.from(forms?.map((x) => x.toJson()) ?? []),
      };
}
