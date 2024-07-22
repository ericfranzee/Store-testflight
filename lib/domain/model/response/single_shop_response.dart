import 'package:ibeauty/domain/model/model/shop_model.dart';



class SingleShopResponse {
  SingleShopResponse({
    ShopData? data,
  }) {
    _data = data;
  }

  SingleShopResponse.fromJson(dynamic json) {

    _data = json['data'] != null ? ShopData.fromJson(json['data']) : null;
  }

  ShopData? _data;

  SingleShopResponse copyWith({
    ShopData? data,
  }) =>
      SingleShopResponse(
        data: data ?? _data,
      );


  ShopData? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }
}
