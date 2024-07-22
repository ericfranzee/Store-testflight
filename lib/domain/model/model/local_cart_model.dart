class LocalCartModel {
  final int? productId;
  final int? stockId;
  final String? image;
  final int count;

  LocalCartModel({
    required this.productId,
    required this.stockId,
    required this.count,
    this.image,
  });

  factory LocalCartModel.fromJson(Map data) {
    return LocalCartModel(
      productId: data["productId"],
      stockId: data["stockId"],
      count: data["count"],
      image: data["image"],
    );
  }

  Map toJson() {
    return {
      "productId": productId,
      "stockId": stockId,
      "count": count,
      "image": image,
    };
  }
}
