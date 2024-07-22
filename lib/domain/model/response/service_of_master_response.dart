
class ServiceOfMasterResponse {
  List<ServiceOfMaster>? data;

  ServiceOfMasterResponse({
    this.data,
  });

  ServiceOfMasterResponse copyWith({
    List<ServiceOfMaster>? data,

  }) =>
      ServiceOfMasterResponse(
        data: data ?? this.data,
      );

  factory ServiceOfMasterResponse.fromJson(Map<String, dynamic> json) => ServiceOfMasterResponse(
    data: json["data"] == null ? [] : List<ServiceOfMaster>.from(json["data"]!.map((x) => ServiceOfMaster.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class ServiceOfMaster {
  int? id;
  int? serviceId;
  int? masterId;
  String? type;

  ServiceOfMaster({
    this.id,
    this.serviceId,
    this.masterId,
    this.type,
  });

  ServiceOfMaster copyWith({
    int? id,
    int? serviceId,
    int? masterId,
    String? type,
  }) =>
      ServiceOfMaster(
        id: id ?? this.id,
        serviceId: serviceId ?? this.serviceId,
        masterId: masterId ?? this.masterId,
        type: type ?? this.type,
      );

  factory ServiceOfMaster.fromJson(Map<String, dynamic> json) => ServiceOfMaster(
    id: json["id"],
    serviceId: json["service_id"],
    masterId: json["master_id"],
    type: json["type"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "service_id": serviceId,
    "master_id": masterId,
    "type": type,
  };
}

