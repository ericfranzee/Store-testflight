import 'package:ibeauty/domain/model/model/product_model.dart';

class CompareResponse {
  List<List<ProductData>>? compare;

  CompareResponse({
    this.compare,
  });

  CompareResponse copyWith({
    List<List<ProductData>>? data,
  }) =>
      CompareResponse(
        compare: data ?? compare,
      );

  factory CompareResponse.fromJson(Map<String, dynamic> json) =>
      CompareResponse(
        compare: json["data"] == null
            ? []
            : List<List<ProductData>>.from(json["data"]!.map((x) =>
                List<ProductData>.from(x.map((x) => ProductData.fromJson(x))))),
      );

  Map<String, dynamic> toJson() => {
        "data": compare == null
            ? []
            : List<dynamic>.from(compare!
                .map((x) => List<dynamic>.from(x.map((x) => x.toJson())))),
      };
}
