import 'package:ibeauty/domain/model/model/shop_model.dart';

class ShopsPaginateResponse {
  ShopsPaginateResponse({
    List<ShopData>? data,
  }) {
    _data = data;
  }

  ShopsPaginateResponse.fromJson(dynamic json) {
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(ShopData.fromJson(v));
      });
    }
  }

  List<ShopData>? _data;

  ShopsPaginateResponse copyWith({
    List<ShopData>? data,
  }) =>
      ShopsPaginateResponse(
        data: data ?? _data,
      );

  List<ShopData>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
