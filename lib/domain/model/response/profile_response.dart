

import 'package:ibeauty/domain/model/model/user_model.dart';

class ProfileResponse {
  ProfileResponse({
    UserModel? data,
  }) {
    _data = data;
  }

  ProfileResponse.fromJson(dynamic json) {
    _data = json['data'] != null ? UserModel.fromJson(json['data']) : null;
  }

  UserModel? _data;

  ProfileResponse copyWith({
    UserModel? data,
  }) =>
      ProfileResponse(
        data: data ?? _data,
      );

  UserModel? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }
}
