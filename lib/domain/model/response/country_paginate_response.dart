import 'package:ibeauty/domain/model/model/country_model.dart';

class CountryPaginationResponse {
  List<CountryModel>? data;

  CountryPaginationResponse({
    this.data,
  });

  CountryPaginationResponse copyWith({
    List<CountryModel>? data,
  }) =>
      CountryPaginationResponse(
        data: data ?? this.data,
      );

  factory CountryPaginationResponse.fromJson(Map<String, dynamic> json) =>
      CountryPaginationResponse(
        data: json["data"] == null
            ? []
            : List<CountryModel>.from(
                json["data"]!.map((x) => CountryModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}
