class GalleryUploadResponse {
  GalleryUploadResponse({
    ImageData? imageData,
  }) {
    _imageData = imageData;
  }

  GalleryUploadResponse.fromJson(dynamic json) {
    _imageData = json['data'] != null ? ImageData.fromJson(json['data']) : null;
  }
  ImageData? _imageData;

  GalleryUploadResponse copyWith({
    String? timestamp,
    bool? status,
    String? message,
    ImageData? imageData,
  }) =>
      GalleryUploadResponse(
        imageData: imageData ?? _imageData,
      );


  ImageData? get imageData => _imageData;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_imageData != null) {
      map['data'] = _imageData?.toJson();
    }
    return map;
  }
}

class ImageData {
  ImageData({String? title, String? type}) {
    _title = title;
    _type = type;
  }

  ImageData.fromJson(dynamic json) {
    _title = json['title'];
    _type = json['type'];
  }

  String? _title;
  String? _type;

  ImageData copyWith({String? title, String? type}) => ImageData(
    title: title ?? _title,
    type: type ?? _type,
  );

  String? get title => _title;

  String? get type => _type;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = _title;
    map['type'] = _type;
    return map;
  }
}