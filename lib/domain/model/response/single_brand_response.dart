

import 'package:ibeauty/domain/model/model/brand_data.dart';

class SingleBrandResponse {
  SingleBrandResponse({
    BrandData? data,
  }) {
    _data = data;
  }

  SingleBrandResponse.fromJson(dynamic json) {
    _data = json['data'] != null ? BrandData.fromJson(json['data']) : null;
  }


  BrandData? _data;

  SingleBrandResponse copyWith({
    BrandData? data,
  }) =>
      SingleBrandResponse(

        data: data ?? _data,
      );


  BrandData? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }
}
