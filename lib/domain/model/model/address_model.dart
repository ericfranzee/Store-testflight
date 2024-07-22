class AddressModel {
  AddressModel({
    int? countryId,
    int? cityId,
    int? regionId,
    String? city,
    String? country,
    String? countryCode,
  }) {
    _countryId = countryId;
    _regionId = regionId;
    _cityId = cityId;
    _city = city;
    _country = country;
    _countryCode = countryCode;
  }

  AddressModel.fromJson(dynamic json) {
    _countryId = json['country_id'];
    _regionId = json['region_id'];
    _cityId = json['city_id'];
    _city = json['city'];
    _country = json['country'];
    _countryCode = json['country_code'];
  }

  int? _countryId;
  int? _regionId;
  int? _cityId;
  String? _city;
  String? _country;
  String? _countryCode;

  AddressModel copyWith(
          {int? countryId,
          int? regionId,
          int? cityId,
          String? city,
          String? countryCode,
          String? country}) =>
      AddressModel(
        countryId: countryId ?? _countryId,
        regionId: regionId ?? _regionId,
        cityId: cityId ?? _cityId,
        city: city ?? _city,
        countryCode: countryCode ?? _countryCode,
        country: country ?? _country,
      );

  int? get countryId => _countryId;

  int? get regionId => _regionId;

  int? get cityId => _cityId;

  String? get city => _city;

  String? get country => _country;
  String? get countryCode => _countryCode;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['country_id'] = _countryId;
    map['region_id'] = _regionId;
    map['city_id'] = _cityId;
    map['city'] = _city;
    map['country'] = _country;
    map['country_code'] = _countryCode;
    return map;
  }
}
