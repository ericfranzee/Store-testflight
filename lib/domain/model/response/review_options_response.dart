
class ReviewOptionsResponse {
  DateTime? timestamp;
  bool? status;
  String? message;
  ReviewOptions? data;

  ReviewOptionsResponse({
    this.timestamp,
    this.status,
    this.message,
    this.data,
  });

  ReviewOptionsResponse copyWith({
    DateTime? timestamp,
    bool? status,
    String? message,
    ReviewOptions? data,
  }) =>
      ReviewOptionsResponse(
        timestamp: timestamp ?? this.timestamp,
        status: status ?? this.status,
        message: message ?? this.message,
        data: data ?? this.data,
      );

  factory ReviewOptionsResponse.fromJson(Map<String, dynamic> json) => ReviewOptionsResponse(
    timestamp: json["timestamp"] == null ? null : DateTime.parse(json["timestamp"]),
    status: json["status"],
    message: json["message"],
    data: json["data"] == null ? null : ReviewOptions.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "timestamp": timestamp?.toIso8601String(),
    "status": status,
    "message": message,
    "data": data?.toJson(),
  };
}

class ReviewOptions {
  num? cleanliness;
  num? masters;
  num? location;
  num? price;
  num? interior;
  num? service;
  num? communication;
  num? equipment;

  ReviewOptions({
    this.cleanliness,
    this.masters,
    this.location,
    this.price,
    this.interior,
    this.service,
    this.communication,
    this.equipment,
  });

  ReviewOptions copyWith({
    num? cleanliness,
    num? masters,
    num? location,
    num? price,
    num? interior,
    num? service,
    num? communication,
    num? equipment,
  }) =>
      ReviewOptions(
        cleanliness: cleanliness ?? this.cleanliness,
        masters: masters ?? this.masters,
        location: location ?? this.location,
        price: price ?? this.price,
        interior: interior ?? this.interior,
        service: service ?? this.service,
        communication: communication ?? this.communication,
        equipment: equipment ?? this.equipment,
      );

  factory ReviewOptions.fromJson(Map<String, dynamic> json) => ReviewOptions(
    cleanliness: json["cleanliness"],
    masters: json["masters"],
    location: json["location"],
    price: json["price"],
    interior: json["interior"],
    service: json["service"],
    communication: json["communication"],
    equipment: json["equipment"],
  );

  Map<String, dynamic> toJson() => {
    "cleanliness": cleanliness,
    "masters": masters,
    "location": location,
    "price": price,
    "interior": interior,
    "service": service,
    "communication": communication,
    "equipment": equipment,
  };
}
