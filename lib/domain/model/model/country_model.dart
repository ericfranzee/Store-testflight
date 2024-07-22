import 'translation_model.dart';

class CountryModel {
  int? id;
  bool? active;
  String? img;
  int? regionId;
  int? citiesCount;
  String? code;
  Translation? translation;

  CountryModel({
    this.id,
    this.active,
    this.img,
    this.regionId,
    this.citiesCount,
    this.code,
    this.translation,
  });

  CountryModel copyWith({
    int? id,
    bool? active,
    String? img,
    String? code,
    int? regionId,
    int? citiesCount,
    Translation? translation,
  }) =>
      CountryModel(
        id: id ?? this.id,
        active: active ?? this.active,
        img: img ?? this.img,
        code: code ?? this.code,
        regionId: regionId ?? this.regionId,
        citiesCount: citiesCount ?? this.citiesCount,
        translation: translation ?? this.translation,
      );

  factory CountryModel.fromJson(Map<String, dynamic> json) => CountryModel(
        id: json["id"],
        active: json["active"],
        img: json["img"],
    code: json["code"],
        regionId: json["region_id"],
        citiesCount: json["cities_count"],
        translation: json["translation"] == null
            ? null
            : Translation.fromJson(json["translation"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "active": active,
        "img": img,
        "code": code,
        "cities_count": citiesCount,
        "region_id": regionId,
        "translation": translation?.toJson(),
      };
}
