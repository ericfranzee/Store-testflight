

import 'package:ibeauty/domain/model/model/blog_model.dart';

class BlogsPaginateResponse {
  BlogsPaginateResponse({
    List<BlogData>? data,
  }) {
    _data = data;
  }

  BlogsPaginateResponse.fromJson(dynamic json) {
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(BlogData.fromJson(v));
      });
    }

  }

  List<BlogData>? _data;

  BlogsPaginateResponse copyWith({
    List<BlogData>? data,
  }) =>
      BlogsPaginateResponse(
        data: data ?? _data,
      );

  List<BlogData>? get data => _data;


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

