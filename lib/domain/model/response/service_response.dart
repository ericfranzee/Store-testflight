
import 'package:ibeauty/domain/model/model/service_model.dart';

class ServicePaginationResponse {
  List<ServiceModel>? data;


  ServicePaginationResponse({
    this.data,

  });

  ServicePaginationResponse copyWith({
    List<ServiceModel>? data,
  }) =>
      ServicePaginationResponse(
        data: data ?? this.data,
      );

  factory ServicePaginationResponse.fromJson(Map<String, dynamic> json) => ServicePaginationResponse(
    data: json["data"] == null ? [] : List<ServiceModel>.from(json["data"]!.map((x) => ServiceModel.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}




