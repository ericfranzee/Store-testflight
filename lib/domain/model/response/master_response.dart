import 'package:ibeauty/domain/model/model/master_model.dart';

class MasterPaginationResponse {
  List<MasterModel>? data;

  MasterPaginationResponse({
    this.data,
  });

  MasterPaginationResponse copyWith({
    List<MasterModel>? data,
  }) =>
      MasterPaginationResponse(
        data: data ?? this.data,
      );

  factory MasterPaginationResponse.fromJson(Map<String, dynamic> json) =>
      MasterPaginationResponse(
        data: json["data"] == null
            ? []
            : List<MasterModel>.from(
                json["data"]!.map((x) => MasterModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}
