

import 'package:ibeauty/domain/model/model/brand_data.dart';

class BrandsPaginateResponse {
  BrandsPaginateResponse({
    List<BrandData>? data,

  }) {
    _data = data;
  }

  BrandsPaginateResponse.fromJson(dynamic json) {
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(BrandData.fromJson(v));
      });
    }
  }

  List<BrandData>? _data;



  BrandsPaginateResponse copyWith({
    List<BrandData>? data,
  }) =>
      BrandsPaginateResponse(
        data: data ?? _data,
      );

  List<BrandData>? get data => _data;


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
