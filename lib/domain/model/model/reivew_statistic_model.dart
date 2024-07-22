

class ReviewCountModel {
  Map<String, num>? group;
  int? count;
  num? avg;

  ReviewCountModel({
    this.group,
    this.count,
    this.avg,
  });

  ReviewCountModel copyWith({
    Map<String, num>? group,
    int? count,
    num? avg,
  }) =>
      ReviewCountModel(
        group: group ?? this.group,
        count: count ?? this.count,
        avg: avg ?? this.avg,
      );

  factory ReviewCountModel.fromJson(Map<String, dynamic> json) => ReviewCountModel(
    group: Map.from(json["group"]!).map((k, v) => MapEntry<String, num>(k, v)),
    count: json["count"],
    avg: json["avg"] ?? 0,
  );

  Map<String, dynamic> toJson() => {
    "group": Map.from(group!).map((k, v) => MapEntry<String, dynamic>(k, v)),
    "count": count,
    "avg": avg,
  };
}
