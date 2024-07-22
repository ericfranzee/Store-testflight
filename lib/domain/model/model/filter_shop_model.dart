import 'tag_model.dart';

class FilterShopModel {
  String? sort;
  String? serviceType;
  num? serviceMinPrice;
  num? serviceMaxPrice;
  int? intervalMin;
  int? intervalMax;
  TagModel? tag;
  int? gender;
  String? type;

  FilterShopModel({
    required this.sort,
    required this.serviceType,
    required this.serviceMinPrice,
    required this.serviceMaxPrice,
    this.intervalMin,
    this.intervalMax,
    required this.tag,
    required this.gender,
    this.type,
  });

  FilterShopModel copyWith({
    String? sort,
    String? serviceType,
    int? serviceMinPrice,
    int? serviceMaxPrice,
    int? intervalMin,
    int? intervalMax,
    TagModel? tag,
    int? gender,
  }) =>
      FilterShopModel(
        sort: sort ?? this.sort,
        serviceType: serviceType ?? this.serviceType,
        serviceMinPrice: serviceMinPrice ?? this.serviceMinPrice,
        serviceMaxPrice: serviceMaxPrice ?? this.serviceMaxPrice,
        intervalMin: intervalMin ?? this.intervalMin,
        intervalMax: intervalMax ?? this.intervalMax,
        tag: tag ?? this.tag,
        gender: gender ?? this.gender,
      );

  Map<String, dynamic> toJson() => {
        if (sort == "r_avg_asc" || sort == "r_avg_desc") "column": "r_avg",
        if (sort == "r_avg_asc") "sort": "asc",
        if (sort == "r_avg_desc") "sort": "desc",
        if (sort == "b_count_asc" || sort == "b_count_desc")
          "column": "b_count",
        if (sort == "b_count_asc") "sort": "asc",
        if (sort == "b_count_desc") "sort": "desc",
        if (sort == "distance_asc" || sort == "distance_desc")
          "column": "distance",
        if (sort == "distance_asc") "sort": "asc",
        if (sort == "distance_desc") "sort": "desc",
        if (sort == "service_min_price" || sort == "service_max_price")
          "column": "service_min_price",
        if (sort == "service_min_price") "sort": "asc",
        if (sort == "service_max_price") "sort": "desc",
        if (sort == "has_discount") "has_discount": 1,
        if (serviceMinPrice != null) "service_prices[0]": serviceMinPrice,
        if (serviceMaxPrice != null) "service_prices[1]": serviceMaxPrice,
        if (tag?.id != null) "take": tag?.id ?? 0,
        if (serviceType != null) "service_type": serviceType,
        if (intervalMin != null) "interval_min": intervalMin,
        if (intervalMax != null) "interval_max": intervalMax,
        if (gender != null) "gender": gender! + 1,
      };
}
