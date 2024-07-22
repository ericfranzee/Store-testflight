
class CheckTimeResponse {
  DateTime? timestamp;
  bool? status;
  String? message;
  List<EnableDate>? data;

  CheckTimeResponse({
    this.timestamp,
    this.status,
    this.message,
    this.data,
  });

  CheckTimeResponse copyWith({
    DateTime? timestamp,
    bool? status,
    String? message,
    List<EnableDate>? data,
  }) =>
      CheckTimeResponse(
        timestamp: timestamp ?? this.timestamp,
        status: status ?? this.status,
        message: message ?? this.message,
        data: data ?? this.data,
      );

  factory CheckTimeResponse.fromJson(Map<String, dynamic> json) => CheckTimeResponse(
    timestamp: json["timestamp"] == null ? null : DateTime.parse(json["timestamp"]),
    status: json["status"],
    message: json["message"],
    data: json["data"] == null ? [] : List<EnableDate>.from(json["data"]!.map((x) => EnableDate.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "timestamp": timestamp?.toIso8601String(),
    "status": status,
    "message": message,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class EnableDate {
  DateTime? date;
  String? month;
  String? day;
  String? name;
  bool? closed;
  List<String>? times;

  EnableDate({
    this.date,
    this.month,
    this.day,
    this.name,
    this.closed,
    this.times,
  });

  EnableDate copyWith({
    DateTime? date,
    String? month,
    String? day,
    String? name,
    bool? closed,
    List<String>? times,
    dynamic disabledTimes,
  }) =>
      EnableDate(
        date: date ?? this.date,
        month: month ?? this.month,
        day: day ?? this.day,
        name: name ?? this.name,
        closed: closed ?? this.closed,
        times: times ?? this.times,
      );

  factory EnableDate.fromJson(Map<String, dynamic> json) => EnableDate(
    date: json["date"] == null ? null : DateTime.parse(json["date"]),
    month: json["month"],
    day: json["day"],
    name: json["name"],
    closed: json["closed"],
    times: json["times"] == null ? [] : List<String>.from(json["times"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "date": "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
    "month": month,
    "day": day,
    "name": name,
    "closed": closed,
    "times": times == null ? [] : List<dynamic>.from(times!.map((x) => x)),
  };
}

