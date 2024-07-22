import 'package:ibeauty/domain/model/model/translation_model.dart';

class TagModel {
  int? id;
  String? img;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  Translation? translation;

  TagModel(
      {this.id,
        this.img,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
        this.translation});

  TagModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    img = json['img'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    translation = json['translation'] != null
        ? Translation.fromJson(json['translation'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['img'] = img;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    if (translation != null) {
      data['translation'] = translation!.toJson();
    }
    return data;
  }
}
