class LocationModel {
  LocationModel({String? latitude, String? longitude, String? address}) {
    _address = address;
    _latitude = latitude;
    _longitude = longitude;
  }

  LocationModel.fromJson(dynamic json) {
    if (json["address"] != null) _address = json["address"];
    _latitude = json['latitude'].toString();
    _longitude = json['longitude'].toString();
  }

  String? _latitude;
  String? _longitude;
  String? _address;

  LocationModel copyWith({String? latitude, String? longitude, String? address}) =>
      LocationModel(
        latitude: latitude ?? _latitude,
        longitude: longitude ?? _longitude,
        address: address ?? _address,
      );

  String? get latitude => _latitude;

  String? get longitude => _longitude;

  String? get address => _address;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['latitude'] = _latitude;
    map['longitude'] = _longitude;
    map['address'] = _address;
    return map;
  }
}
