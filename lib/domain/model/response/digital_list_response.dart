import 'package:ibeauty/domain/model/model/product_model.dart';

class DigitalListResponse {
  List<DigitalProduct>? data;

  DigitalListResponse({
    this.data,
  });

  DigitalListResponse copyWith({
    List<DigitalProduct>? data,
  }) =>
      DigitalListResponse(
        data: data ?? this.data,
      );

  factory DigitalListResponse.fromJson(Map<String, dynamic> json) =>
      DigitalListResponse(
        data: json["data"] == null
            ? []
            : List<DigitalProduct>.from(
                json["data"]!.map((x) => DigitalProduct.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class DigitalProduct {
  int? id;
  bool? active;
  bool? downloaded;
  int? digitalFileId;
  int? userId;
  DigitalFile? digitalFile;

  DigitalProduct({
    this.id,
    this.active,
    this.downloaded,
    this.digitalFileId,
    this.userId,
    this.digitalFile,
  });

  DigitalProduct copyWith({
    int? id,
    bool? active,
    bool? downloaded,
    int? digitalFileId,
    int? userId,
    DigitalFile? digitalFile,
  }) =>
      DigitalProduct(
        id: id ?? this.id,
        active: active ?? this.active,
        downloaded: downloaded ?? this.downloaded,
        digitalFileId: digitalFileId ?? this.digitalFileId,
        userId: userId ?? this.userId,
        digitalFile: digitalFile ?? this.digitalFile,
      );

  factory DigitalProduct.fromJson(Map<String, dynamic> json) => DigitalProduct(
        id: json["id"],
        active: json["active"],
        downloaded: json["downloaded"],
        digitalFileId: json["digital_file_id"],
        userId: json["user_id"],
        digitalFile: json["digital_file"] == null
            ? null
            : DigitalFile.fromJson(json["digital_file"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "active": active,
        "downloaded": downloaded,
        "digital_file_id": digitalFileId,
        "user_id": userId,
        "digital_file": digitalFile?.toJson(),
      };
}

class DigitalFile {
  int? id;
  bool? active;
  int? productId;
  ProductData? product;

  DigitalFile({
    this.id,
    this.active,
    this.productId,
    this.product,
  });

  DigitalFile copyWith({
    int? id,
    bool? active,
    int? productId,
    ProductData? product,
  }) =>
      DigitalFile(
        id: id ?? this.id,
        active: active ?? this.active,
        productId: productId ?? this.productId,
        product: product ?? this.product,
      );

  factory DigitalFile.fromJson(Map<String, dynamic> json) => DigitalFile(
        id: json["id"],
        active: json["active"],
        productId: json["product_id"],
        product: json["product"] == null
            ? null
            : ProductData.fromJson(json["product"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "active": active,
        "product_id": productId,
        "product": product?.toJson(),
      };
}
