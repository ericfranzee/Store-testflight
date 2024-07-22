

class CityResponseModel {
  List<CityModel>? data;
  Links? links;
  Meta? meta;

  CityResponseModel({
    this.data,
    this.links,
    this.meta,
  });

  CityResponseModel copyWith({
    List<CityModel>? data,
    Links? links,
    Meta? meta,
  }) =>
      CityResponseModel(
        data: data ?? this.data,
        links: links ?? this.links,
        meta: meta ?? this.meta,
      );

  factory CityResponseModel.fromJson(Map<String, dynamic> json) => CityResponseModel(
    data: json["data"] == null ? [] : List<CityModel>.from(json["data"]!.map((x) => CityModel.fromJson(x))),
    links: json["links"] == null ? null : Links.fromJson(json["links"]),
    meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    "links": links?.toJson(),
    "meta": meta?.toJson(),
  };
}

class CityModel {
  int? id;
  bool? active;
  int? regionId;
  int? countryId;
  AreaModel? areaModel;
  Translation? translation;

  CityModel({
    this.id,
    this.active,
    this.regionId,
    this.countryId,
    this.translation,
    this.areaModel,
  });

  CityModel copyWith({
    int? id,
    bool? active,
    int? regionId,
    int? countryId,
    AreaModel? areaModel,
    Translation? translation,
  }) =>
      CityModel(
        id: id ?? this.id,
        active: active ?? this.active,
        regionId: regionId ?? this.regionId,
        countryId: countryId ?? this.countryId,
        areaModel: areaModel ?? this.areaModel,
        translation: translation ?? this.translation,
      );

  factory CityModel.fromJson(Map<String, dynamic> json) => CityModel(
    id: json["id"],
    active: json["active"],
    regionId: json["region_id"],
    countryId: json["country_id"],
    translation: json["translation"] == null ? null : Translation.fromJson(json["translation"]),
    areaModel: json["area"] == null ? null : AreaModel.fromJson(json["area"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "active": active,
    "region_id": regionId,
    "country_id": countryId,
    "area": areaModel?.toJson(),
    "translation": translation?.toJson(),
  };
}

class Translation {
  int? id;
  String? locale;
  String? title;

  Translation({
    this.id,
    this.locale,
    this.title,
  });

  Translation copyWith({
    int? id,
    String? locale,
    String? title,
  }) =>
      Translation(
        id: id ?? this.id,
        locale: locale ?? this.locale,
        title: title ?? this.title,
      );

  factory Translation.fromJson(Map<String, dynamic> json) => Translation(
    id: json["id"],
    locale: json["locale"],
    title: json["title"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "locale": locale,
    "title": title,
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
  String? perPage;
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
    String? perPage,
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
    links: json["links"] == null ? [] : List<Link>.from(json["links"]!.map((x) => Link.fromJson(x))),
    path: json["path"],
    perPage: json["per_page"],
    to: json["to"],
    total: json["total"],
  );

  Map<String, dynamic> toJson() => {
    "current_page": currentPage,
    "from": from,
    "last_page": lastPage,
    "links": links == null ? [] : List<dynamic>.from(links!.map((x) => x.toJson())),
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


class AreaModel {
  int? id;
  bool? active;
  int? regionId;
  int? countryId;
  int? cityId;
  Translation? translation;

  AreaModel({
    this.id,
    this.active,
    this.regionId,
    this.countryId,
    this.cityId,
    this.translation,
  });

  AreaModel copyWith({
    int? id,
    bool? active,
    int? regionId,
    int? countryId,
    int? cityId,
    Translation? translation,
  }) =>
      AreaModel(
        id: id ?? this.id,
        active: active ?? this.active,
        regionId: regionId ?? this.regionId,
        countryId: countryId ?? this.countryId,
        cityId: cityId ?? this.cityId,
        translation: translation ?? this.translation,
      );

  factory AreaModel.fromJson(Map<String, dynamic> json) => AreaModel(
    id: json["id"],
    active: json["active"],
    regionId: json["region_id"],
    countryId: json["country_id"],
    cityId: json["city_id"],
    translation: json["translation"] == null ? null : Translation.fromJson(json["translation"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "active": active,
    "region_id": regionId,
    "country_id": countryId,
    "city_id": cityId,
    "translation": translation?.toJson(),
  };
}