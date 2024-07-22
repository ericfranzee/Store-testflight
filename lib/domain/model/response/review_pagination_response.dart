import 'package:ibeauty/domain/model/model/review_data.dart';

class ReviewResponseModel {
  List<ReviewModel>? data;
  Links? links;
  Meta? meta;

  ReviewResponseModel({
    this.data,
    this.links,
    this.meta,
  });

  ReviewResponseModel copyWith({
    List<ReviewModel>? data,
    Links? links,
    Meta? meta,
  }) =>
      ReviewResponseModel(
        data: data ?? this.data,
        links: links ?? this.links,
        meta: meta ?? this.meta,
      );

  factory ReviewResponseModel.fromJson(Map<String, dynamic> json) =>
      ReviewResponseModel(
        data: json["data"] == null
            ? []
            : List<ReviewModel>.from(
                json["data"]!.map((x) => ReviewModel.fromJson(x))),
        links: json["links"] == null ? null : Links.fromJson(json["links"]),
        meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
        "links": links?.toJson(),
        "meta": meta?.toJson(),
      };
}

class ReviewModel {
  int? id;
  int? reviewableId;
  String? reviewableType;
  int? assignableId;
  String? assignableType;
  num? rating;
  String? comment;
  List<Galleries>? galleries;
  DateTime? createdAt;
  DateTime? updatedAt;
  User? user;
  Order? order;
  bool? cleanliness;
  bool? masters;
  bool? location;
  bool? price;
  bool? interior;
  bool? service;
  bool? communication;
  bool? equipment;

  ReviewModel({
    this.id,
    this.reviewableId,
    this.reviewableType,
    this.assignableId,
    this.assignableType,
    this.rating,
    this.comment,
    this.galleries,
    this.createdAt,
    this.updatedAt,
    this.user,
    this.order,
    this.cleanliness,
    this.masters,
    this.location,
    this.price,
    this.interior,
    this.service,
    this.communication,
    this.equipment,
  });

  ReviewModel copyWith({
    int? id,
    int? reviewableId,
    String? reviewableType,
    int? assignableId,
    String? assignableType,
    num? rating,
    String? comment,
    List<Galleries>? galleries,
    DateTime? createdAt,
    DateTime? updatedAt,
    User? user,
    Order? order,
    bool? cleanliness,
    bool? masters,
    bool? location,
    bool? price,
    bool? interior,
    bool? service,
    bool? communication,
    bool? equipment,
  }) =>
      ReviewModel(
        id: id ?? this.id,
        reviewableId: reviewableId ?? this.reviewableId,
        reviewableType: reviewableType ?? this.reviewableType,
        assignableId: assignableId ?? this.assignableId,
        assignableType: assignableType ?? this.assignableType,
        rating: rating ?? this.rating,
        comment: comment ?? this.comment,
        galleries: galleries ?? this.galleries,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        user: user ?? this.user,
        order: order ?? this.order,
        cleanliness: cleanliness ?? this.cleanliness,
        masters: masters ?? this.masters,
        location: location ?? this.location,
        price: price ?? this.price,
        interior: interior ?? this.interior,
        service: service ?? this.service,
        communication: communication ?? this.communication,
        equipment: equipment ?? this.equipment,
      );

  factory ReviewModel.fromJson(Map<String, dynamic> json) => ReviewModel(
        id: json["id"],
        reviewableId: json["reviewable_id"],
        reviewableType: json["reviewable_type"],
        assignableId: json["assignable_id"],
        assignableType: json["assignable_type"],
        rating: json["rating"],
        comment: json["comment"],
        galleries: json["galleries"] == null
            ? []
            : List<Galleries>.from(
                json["galleries"]!.map((x) => Galleries.fromJson(x))),
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        user: json["user"] == null ? null : User.fromJson(json["user"]),
        order: json["order"] == null ? null : Order.fromJson(json["order"]),
        cleanliness: json["cleanliness"],
        masters: json["masters"],
        location: json["location"],
        price: json["price"],
        interior: json["interior"],
        service: json["service"],
        communication: json["communication"],
        equipment: json["equipment"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "reviewable_id": reviewableId,
        "reviewable_type": reviewableType,
        "assignable_id": assignableId,
        "assignable_type": assignableType,
        "rating": rating,
        "comment": comment,
        "img": galleries == null
            ? []
            : List<dynamic>.from(galleries!.map((x) => x.toJson())),
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "user": user?.toJson(),
        "order": order?.toJson(),
        "cleanliness": cleanliness,
        "masters": masters,
        "location": location,
        "price": price,
        "interior": interior,
        "service": service,
        "communication": communication,
        "equipment": equipment,
      };
}

class Order {
  int? id;
  Address? address;
  bool? current;

  Order({
    this.id,
    this.address,
    this.current,
  });

  Order copyWith({
    int? id,
    Address? address,
    bool? current,
  }) =>
      Order(
        id: id ?? this.id,
        address: address ?? this.address,
        current: current ?? this.current,
      );

  factory Order.fromJson(Map<String, dynamic> json) => Order(
        id: json["id"],
        address:
            json["address"] == null ? null : Address.fromJson(json["address"]),
        current: json["current"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "address": address?.toJson(),
        "current": current,
      };
}

class Address {
  String? address;
  dynamic office;
  dynamic house;
  dynamic floor;

  Address({
    this.address,
    this.office,
    this.house,
    this.floor,
  });

  Address copyWith({
    String? address,
    dynamic office,
    dynamic house,
    dynamic floor,
  }) =>
      Address(
        address: address ?? this.address,
        office: office ?? this.office,
        house: house ?? this.house,
        floor: floor ?? this.floor,
      );

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        address: json["address"],
        office: json["office"],
        house: json["house"],
        floor: json["floor"],
      );

  Map<String, dynamic> toJson() => {
        "address": address,
        "office": office,
        "house": house,
        "floor": floor,
      };
}

class User {
  int? id;
  String? uuid;
  String? firstname;
  String? lastname;
  bool? emptyP;
  String? img;
  String? role;
  double? reviewsAvgRating;
  int? reviewsCount;

  User({
    this.id,
    this.uuid,
    this.firstname,
    this.lastname,
    this.emptyP,
    this.img,
    this.role,
    this.reviewsAvgRating,
    this.reviewsCount,
  });

  User copyWith({
    int? id,
    String? uuid,
    String? firstname,
    String? lastname,
    bool? emptyP,
    String? img,
    String? role,
    double? reviewsAvgRating,
    int? reviewsCount,
  }) =>
      User(
        id: id ?? this.id,
        uuid: uuid ?? this.uuid,
        firstname: firstname ?? this.firstname,
        lastname: lastname ?? this.lastname,
        emptyP: emptyP ?? this.emptyP,
        img: img ?? this.img,
        role: role ?? this.role,
        reviewsAvgRating: reviewsAvgRating ?? this.reviewsAvgRating,
        reviewsCount: reviewsCount ?? this.reviewsCount,
      );

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        uuid: json["uuid"],
        firstname: json["firstname"],
        lastname: json["lastname"],
        emptyP: json["empty_p"],
        img: json["img"],
        role: json["role"],
        reviewsAvgRating: json["reviews_avg_rating"]?.toDouble(),
        reviewsCount: json["reviews_count"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "uuid": uuid,
        "firstname": firstname,
        "lastname": lastname,
        "empty_p": emptyP,
        "img": img,
        "role": role,
        "reviews_avg_rating": reviewsAvgRating,
        "reviews_count": reviewsCount,
      };
}

class Links {
  String? first;
  String? last;
  dynamic prev;
  dynamic next;

  Links({
    this.first,
    this.last,
    this.prev,
    this.next,
  });

  Links copyWith({
    String? first,
    String? last,
    dynamic prev,
    dynamic next,
  }) =>
      Links(
        first: first ?? this.first,
        last: last ?? this.last,
        prev: prev ?? this.prev,
        next: next ?? this.next,
      );

  factory Links.fromJson(Map<String, dynamic> json) => Links(
        first: json["first"],
        last: json["last"],
        prev: json["prev"],
        next: json["next"],
      );

  Map<String, dynamic> toJson() => {
        "first": first,
        "last": last,
        "prev": prev,
        "next": next,
      };
}

class Meta {
  int? currentPage;
  int? from;
  int? lastPage;
  List<Link>? links;
  String? path;
  int? perPage;
  int? to;
  int? total;

  Meta({
    this.currentPage,
    this.from,
    this.lastPage,
    this.links,
    this.path,
    this.perPage,
    this.to,
    this.total,
  });

  Meta copyWith({
    int? currentPage,
    int? from,
    int? lastPage,
    List<Link>? links,
    String? path,
    int? perPage,
    int? to,
    int? total,
  }) =>
      Meta(
        currentPage: currentPage ?? this.currentPage,
        from: from ?? this.from,
        lastPage: lastPage ?? this.lastPage,
        links: links ?? this.links,
        path: path ?? this.path,
        perPage: perPage ?? this.perPage,
        to: to ?? this.to,
        total: total ?? this.total,
      );

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        currentPage: json["current_page"],
        from: json["from"],
        lastPage: json["last_page"],
        links: json["links"] == null
            ? []
            : List<Link>.from(json["links"]!.map((x) => Link.fromJson(x))),
        path: json["path"],
        perPage: json["per_page"],
        to: json["to"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "current_page": currentPage,
        "from": from,
        "last_page": lastPage,
        "links": links == null
            ? []
            : List<dynamic>.from(links!.map((x) => x.toJson())),
        "path": path,
        "per_page": perPage,
        "to": to,
        "total": total,
      };
}

class Link {
  String? url;
  String? label;
  bool? active;

  Link({
    this.url,
    this.label,
    this.active,
  });

  Link copyWith({
    String? url,
    String? label,
    bool? active,
  }) =>
      Link(
        url: url ?? this.url,
        label: label ?? this.label,
        active: active ?? this.active,
      );

  factory Link.fromJson(Map<String, dynamic> json) => Link(
        url: json["url"],
        label: json["label"],
        active: json["active"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "label": label,
        "active": active,
      };
}
