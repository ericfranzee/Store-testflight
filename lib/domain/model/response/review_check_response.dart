
class ReviewCheckResponse {
  DateTime? timestamp;
  bool? status;
  String? message;
  ReviewCheck? data;

  ReviewCheckResponse({
    this.timestamp,
    this.status,
    this.message,
    this.data,
  });

  ReviewCheckResponse copyWith({
    DateTime? timestamp,
    bool? status,
    String? message,
    ReviewCheck? data,
  }) =>
      ReviewCheckResponse(
        timestamp: timestamp ?? this.timestamp,
        status: status ?? this.status,
        message: message ?? this.message,
        data: data ?? this.data,
      );

  factory ReviewCheckResponse.fromJson(Map<String, dynamic> json) => ReviewCheckResponse(
    timestamp: json["timestamp"] == null ? null : DateTime.parse(json["timestamp"]),
    status: json["status"],
    message: json["message"],
    data: json["data"] == null ? null : ReviewCheck.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "timestamp": timestamp?.toIso8601String(),
    "status": status,
    "message": message,
    "data": data?.toJson(),
  };
}

class ReviewCheck {
  bool? ordered;
  bool? addedReview;

  ReviewCheck({
    this.ordered,
    this.addedReview,
  });

  ReviewCheck copyWith({
    bool? ordered,
    bool? addedReview,
  }) =>
      ReviewCheck(
        ordered: ordered ?? this.ordered,
        addedReview: addedReview ?? this.addedReview,
      );

  factory ReviewCheck.fromJson(Map<String, dynamic> json) => ReviewCheck(
    ordered: json["ordered"],
    addedReview: json["added_review"],
  );

  Map<String, dynamic> toJson() => {
    "ordered": ordered,
    "added_review": addedReview,
  };
}
