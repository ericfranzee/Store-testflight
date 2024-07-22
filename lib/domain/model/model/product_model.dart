import 'review_data.dart';
import 'shop_model.dart';
import 'translation_model.dart';

class ProductData {
  ProductData({
    int? id,
    String? uuid,
    int? shopId,
    int? categoryId,
    String? keywords,
    int? brandId,
    num? tax,
    int? minQty,
    int? maxQty,
    bool? active,
    bool? digital,
    String? img,
    String? createdAt,
    String? updatedAt,
    num? ratingAvg,
    num? ordersCount,
    num? ratingCount,
    num? interval,
    Translation? translation,
    List<Properties>? properties,
    List<Stocks>? stocks,
    ShopData? shop,
    Category? category,
    Brand? brand,
    Unit? unit,
    List<ReviewData>? reviews,
    List<Galleries>? galleries,
    int? count,
  }) {
    _id = id;
    _uuid = uuid;
    _shopId = shopId;
    _categoryId = categoryId;
    _keywords = keywords;
    _brandId = brandId;
    _tax = tax;
    _minQty = minQty;
    _maxQty = maxQty;
    _interval = interval;
    _active = active;
    _digital = digital;
    _ratingCount = ratingCount;
    _img = img;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _ratingAvg = ratingAvg;
    _ordersCount = ordersCount;
    _translation = translation;
    _properties = properties;
    _stocks = stocks;
    _shop = shop;
    _category = category;
    _brand = brand;
    _unit = unit;
    _reviews = reviews;
    _galleries = galleries;
    _count = count;
  }

  ProductData.fromJson(dynamic json) {
    _id = json?['id'];
    _uuid = json?['uuid'];
    _shopId = json?['shop_id'];
    _categoryId = json?['category_id'];
    _category =
    json?['category'] != null ? Category.fromJson(json['category']) : null;
    _keywords = json?['keywords'];
    _brandId = json?['brand_id'];
    _digital = json?['digital'];
    _interval = json?['interval'];
    _tax = json?['tax'];
    _minQty = json?['min_qty'];
    _maxQty = json?['max_qty'];
    _ratingCount = json?["r_count"];
    _img = json?['img'];
    _createdAt = json?['created_at'];
    _updatedAt = json?['updated_at'];
    _ratingAvg = json?['r_avg'];
    _ordersCount = json?['o_count'];
    _count = 0;
    _translation = json?['translation'] != null
        ? Translation.fromJson(json['translation'])
        : null;
    _brand = json?['brand'] != null ? Brand.fromJson(json['brand']) : null;
    _shop = json?['shop'] != null ? ShopData.fromJson(json['shop']) : null;
    _unit = json?['unit'] != null ? Unit.fromJson(json['unit']) : null;
    if (json?['properties'] != null) {
      _properties = [];
      json?['properties'].forEach((v) {
        _properties?.add(Properties.fromJson(v));
      });
    }
    if (json?['stocks'] != null) {
      _stocks = [];

      json?['stocks'].forEach((v) {
        _stocks?.add(Stocks.fromJson(v));
      });
      if (_stocks?.isNotEmpty ?? false) {
        if (_stocks?.first.extras?.isNotEmpty ?? false) {
          _stocks?.forEach((element) {
            element.extras?.sort(
                    (p, n) => ((p.group?.id ?? 0) > (n.group?.id ?? 0) ? 1 : 0));
          });
        }
      }
    }
    if (json?['reviews'] != null) {
      _reviews = [];
      json?['reviews'].forEach((v) {
        _reviews?.add(ReviewData.fromJson(v));
      });
    }
    if (json?['galleries'] != null) {
      _galleries = [];
      json?['galleries'].forEach((v) {
        _galleries?.add(Galleries.fromJson(v));
      });
    }
  }

  int? _id;
  String? _uuid;
  int? _shopId;
  int? _categoryId;
  String? _keywords;
  int? _brandId;
  num? _tax;
  int? _minQty;
  int? _maxQty;
  bool? _active;
  bool? _digital;
  String? _img;
  String? _createdAt;
  String? _updatedAt;
  num? _ratingAvg;
  num? _interval;
  num? _ordersCount;
  num? _ratingCount;
  Translation? _translation;
  List<Properties>? _properties;
  List<Stocks>? _stocks;
  ShopData? _shop;
  Category? _category;
  Brand? _brand;
  Unit? _unit;
  List<ReviewData>? _reviews;
  List<Galleries>? _galleries;

  int? _count;

  ProductData copyWith({
    int? id,
    String? uuid,
    int? shopId,
    int? categoryId,
    String? keywords,
    int? brandId,
    num? tax,
    int? minQty,
    int? maxQty,
    bool? active,
    bool? digital,
    String? img,
    String? createdAt,
    String? updatedAt,
    num? ratingAvg,
    num? interval,
    num? ordersCount,
    num? ratingCount,
    Translation? translation,
    List<Properties>? properties,
    List<Stocks>? stocks,
    ShopData? shop,
    Category? category,
    Brand? brand,
    Unit? unit,
    List<ReviewData>? reviews,
    List<Galleries>? galleries,
  }) =>
      ProductData(
        id: id ?? _id,
        uuid: uuid ?? _uuid,
        shopId: shopId ?? _shopId,
        categoryId: categoryId ?? _categoryId,
        keywords: keywords ?? _keywords,
        brandId: brandId ?? _brandId,
        tax: tax ?? _tax,
        minQty: minQty ?? _minQty,
        maxQty: maxQty ?? _maxQty,
        active: active ?? _active,
        digital: digital ?? _digital,
        interval: interval ?? _interval,
        img: img ?? _img,
        createdAt: createdAt ?? _createdAt,
        updatedAt: updatedAt ?? _updatedAt,
        ratingAvg: ratingAvg ?? _ratingAvg,
        ratingCount: ratingCount ?? _ratingCount,
        ordersCount: ordersCount ?? _ordersCount,
        translation: translation ?? _translation,
        properties: properties ?? _properties,
        stocks: stocks ?? _stocks,
        shop: shop ?? _shop,
        category: category ?? _category,
        brand: brand ?? _brand,
        unit: unit ?? _unit,
        reviews: reviews ?? _reviews,
        galleries: galleries ?? _galleries,
      );

  int? get id => _id;

  String? get uuid => _uuid;

  int? get shopId => _shopId;

  int? get categoryId => _categoryId;

  String? get keywords => _keywords;

  int? get brandId => _brandId;

  num? get tax => _tax;

  num? get interval => _interval;

  int? get minQty => _minQty;

  int? get maxQty => _maxQty;

  bool? get active => _active;

  bool? get digital => _digital;

  String? get img => _img;

  String? get createdAt => _createdAt;

  String? get updatedAt => _updatedAt;

  num? get ratingAvg => _ratingAvg;

  num? get ordersCount => _ordersCount;

  num? get ratingCount => _ratingCount;

  Translation? get translation => _translation;

  List<Properties>? get properties => _properties;

  List<Stocks>? get stocks => _stocks;

  ShopData? get shop => _shop;

  Category? get category => _category;

  Brand? get brand => _brand;

  Unit? get unit => _unit;

  int? get count => _count;

  List<ReviewData>? get reviews => _reviews;

  List<Galleries>? get galleries => _galleries;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['uuid'] = _uuid;
    map['shop_id'] = _shopId;
    map['category_id'] = _categoryId;
    map['keywords'] = _keywords;
    map['brand_id'] = _brandId;
    map['tax'] = _tax;
    map['interval'] = _interval;
    map['min_qty'] = _minQty;
    map['max_qty'] = _maxQty;
    map['active'] = _active;
    map['digital'] = _digital;
    map['img'] = _img;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['rating_avg'] = _ratingAvg;
    map['orders_count'] = _ordersCount;
    map['r_count'] = ratingCount;
    if (_translation != null) {
      map['translation'] = _translation?.toJson();
    }
    if (_properties != null) {
      map['properties'] = _properties?.map((v) => v.toJson()).toList();
    }
    if (_stocks != null) {
      map['stocks'] = _stocks?.map((v) => v.toJson()).toList();
    }
    if (_shop != null) {
      map['shop'] = _shop?.toJson();
    }
    if (_category != null) {
      map['category'] = _category?.toJson();
    }
    if (_brand != null) {
      map['brand'] = _brand?.toJson();
    }
    if (_unit != null) {
      map['unit'] = _unit?.toJson();
    }
    if (_reviews != null) {
      map['reviews'] = _reviews?.map((v) => v.toJson()).toList();
    }
    if (_galleries != null) {
      map['galleries'] = _galleries?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Unit {
  Unit({
    int? id,
    bool? active,
    String? position,
    String? createdAt,
    String? updatedAt,
    Translation? translation,
  }) {
    _id = id;
    _active = active;
    _position = position;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _translation = translation;
  }

  Unit.fromJson(dynamic json) {
    _id = json['id'];
    _active = json['active'];
    _position = json['position'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _translation = json['translation'] != null
        ? Translation.fromJson(json['translation'])
        : null;
  }

  int? _id;
  bool? _active;
  String? _position;
  String? _createdAt;
  String? _updatedAt;
  Translation? _translation;

  Unit copyWith({
    int? id,
    bool? active,
    String? position,
    String? createdAt,
    String? updatedAt,
    Translation? translation,
  }) =>
      Unit(
        id: id ?? _id,
        active: active ?? _active,
        position: position ?? _position,
        createdAt: createdAt ?? _createdAt,
        updatedAt: updatedAt ?? _updatedAt,
        translation: translation ?? _translation,
      );

  int? get id => _id;

  bool? get active => _active;

  String? get position => _position;

  String? get createdAt => _createdAt;

  String? get updatedAt => _updatedAt;

  Translation? get translation => _translation;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['active'] = _active;
    map['position'] = _position;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    if (_translation != null) {
      map['translation'] = _translation?.toJson();
    }
    return map;
  }
}

class Brand {
  Brand({
    int? id,
    String? uuid,
    String? img,
    String? title,
  }) {
    _id = id;
    _uuid = uuid;
    _img = img;
    _title = title;
  }

  Brand.fromJson(dynamic json) {
    _id = json['id'];
    _uuid = json['uuid'];
    _img = json['img'];
    _title = json['title'];
  }

  int? _id;
  String? _uuid;
  String? _img;
  String? _title;

  Brand copyWith({
    int? id,
    String? uuid,
    String? img,
    String? title,
  }) =>
      Brand(
        id: id ?? _id,
        uuid: uuid ?? _uuid,
        img: img ?? _img,
        title: title ?? _title,
      );

  int? get id => _id;

  String? get uuid => _uuid;

  String? get img => _img;

  String? get title => _title;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['uuid'] = _uuid;
    map['img'] = _img;
    map['title'] = _title;
    return map;
  }
}

class Category {
  Category({
    int? id,
    String? uuid,
    int? parentId,
    Translation? translation,
  }) {
    _id = id;
    _uuid = uuid;
    _parentId = parentId;
    _translation = translation;
  }

  Category.fromJson(dynamic json) {
    _id = json['id'];
    _uuid = json['uuid'];
    _parentId = json['parent_id'];
    _translation = json['translation'] != null
        ? Translation.fromJson(json['translation'])
        : null;
  }

  int? _id;
  String? _uuid;
  int? _parentId;
  Translation? _translation;

  Category copyWith({
    int? id,
    String? uuid,
    int? parentId,
    Translation? translation,
  }) =>
      Category(
        id: id ?? _id,
        uuid: uuid ?? _uuid,
        parentId: parentId ?? _parentId,
        translation: translation ?? _translation,
      );

  int? get id => _id;

  String? get uuid => _uuid;

  int? get parentId => _parentId;

  Translation? get translation => _translation;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['uuid'] = _uuid;
    map['parent_id'] = _parentId;
    if (_translation != null) {
      map['translation'] = _translation?.toJson();
    }
    return map;
  }
}

class Stocks {
  Stocks(
      {int? id,
        int? countableId,
        num? price,
        int? quantity,
        dynamic discount,
        num? tax,
        num? totalPrice,
        List<Extras>? extras,
        List<Extras>? extrasCompare,
        List<WholePriceResponse>? wholePrices,
        ProductData? product,
        List<Galleries>? galleries}) {
    _id = id;
    _countableId = countableId;
    _price = price;
    _quantity = quantity;
    _discount = discount;
    _tax = tax;
    _totalPrice = totalPrice;
    _extras = extras;
    _extrasCompare = extrasCompare;
    _product = product;
    _wholePrices = wholePrices;
    _galleries = galleries;
  }

  Stocks.fromJson(dynamic json) {
    _id = json?['id'];
    _countableId = json?['countable_id'];
    _price = json?['price'];
    _quantity = json?['quantity'];
    _discount = json?['discount'];
    _tax = json?['tax'];
    _totalPrice = json?['total_price'];
    if (json?['extras'] != null) {
      _extras = [];
      if (json?['extras'].runtimeType != bool) {
        json?['extras'].forEach((v) {
          _extras?.add(Extras.fromJson(v));
        });
      }
    }
    if (json?['whole_sale_prices'] != null) {
      _wholePrices = [];
      if (json?['whole_sale_prices'].runtimeType != bool) {
        json?['whole_sale_prices'].forEach((v) {
          _wholePrices?.add(WholePriceResponse.fromJson(v));
        });
      }
    }
    if (json?['stock_extras'] != null) {
      _extrasCompare = [];
      if (json?['stock_extras'].runtimeType != bool) {
        json?['stock_extras'].forEach((v) {
          _extrasCompare?.add(Extras.fromJson(v));
        });
      }
    }
    if (json?['galleries'] != null) {
      _galleries = [];
      json?['galleries'].forEach((v) {
        _galleries?.add(Galleries.fromJson(v));
      });
    }
    _product =
    json?['product'] != null ? ProductData.fromJson(json['product']) : null;
  }

  int? _id;
  int? _countableId;
  num? _price;
  int? _quantity;
  dynamic _discount;
  num? _tax;
  num? _totalPrice;
  List<Extras>? _extras;
  List<Extras>? _extrasCompare;
  List<WholePriceResponse>? _wholePrices;
  List<Galleries>? _galleries;
  ProductData? _product;

  Stocks copyWith({
    int? id,
    int? countableId,
    num? price,
    int? quantity,
    dynamic discount,
    num? tax,
    num? totalPrice,
    List<Extras>? extras,
    List<Extras>? extrasCompare,
    List<WholePriceResponse>? wholePrices,
    ProductData? product,
    List<Galleries>? galleries,
  }) =>
      Stocks(
          id: id ?? _id,
          countableId: countableId ?? _countableId,
          price: price ?? _price,
          quantity: quantity ?? _quantity,
          discount: discount ?? _discount,
          tax: tax ?? _tax,
          totalPrice: totalPrice ?? _totalPrice,
          extras: extras ?? _extras,
          extrasCompare: extrasCompare ?? _extrasCompare,
          product: product ?? _product,
          wholePrices: wholePrices ?? _wholePrices,
          galleries: galleries ?? _galleries);

  int? get id => _id;

  int? get countableId => _countableId;

  num? get price => _price;

  int? get quantity => _quantity;

  dynamic get discount => _discount;

  num? get tax => _tax;

  num? get totalPrice => _totalPrice;

  List<Extras>? get extras => _extras;

  List<Extras>? get extrasCompare => _extrasCompare;

  List<WholePriceResponse>? get wholePrices => _wholePrices;

  List<Galleries>? get galleries => _galleries;

  ProductData? get product => _product;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['countable_id'] = _countableId;
    map['price'] = _price;
    map['quantity'] = _quantity;
    map['discount'] = _discount;
    map['tax'] = _tax;
    map['total_price'] = _totalPrice;
    if (_extras != null) {
      map['whole_sale_prices'] = _wholePrices?.map((v) => v.toJson()).toList();
    }
    if (_extras != null) {
      map['extras'] = _extras?.map((v) => v.toJson()).toList();
    }
    if (_extrasCompare != null) {
      map['stock_extras'] = _extrasCompare?.map((v) => v.toJson()).toList();
    }
    if (_product != null) {
      map['product'] = _product?.toJson();
    }
    if (_galleries != null) {
      map['galleries'] = _galleries?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Extras {
  Extras({
    int? id,
    int? extraGroupId,
    String? value,
    GroupProperties? group,
  }) {
    _id = id;
    _extraGroupId = extraGroupId;
    _value = value;
    _active = active;
    _group = group;
  }

  Extras.fromJson(dynamic json) {
    _id = json['id'];
    _extraGroupId = json['extra_group_id'];
    _value = json['value']?['value'] ?? "";
    _group =
    json['group'] != null ? GroupProperties.fromJson(json['group']) : null;
  }

  int? _id;
  int? _extraGroupId;
  String? _value;
  bool? _active;
  GroupProperties? _group;

  Extras copyWith({
    int? id,
    int? extraGroupId,
    String? value,
    bool? active,
    GroupProperties? group,
  }) =>
      Extras(
        id: id ?? _id,
        extraGroupId: extraGroupId ?? _extraGroupId,
        value: value ?? _value,
        group: group ?? _group,
      );

  int? get id => _id;

  int? get extraGroupId => _extraGroupId;

  String? get value => _value;

  bool? get active => _active;

  GroupProperties? get group => _group;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['extra_group_id'] = _extraGroupId;
    map['value'] = _value;
    map['active'] = _active;
    if (_group != null) {
      map['group'] = _group?.toJson();
    }
    return map;
  }
}

class WholePriceResponse {
  int? id;
  int? minQuantity;
  int? maxQuantity;
  num? price;

  WholePriceResponse({
    this.id,
    this.minQuantity,
    this.maxQuantity,
    this.price,
  });

  WholePriceResponse copyWith({
    int? id,
    int? minQuantity,
    int? maxQuantity,
    num? price,
  }) =>
      WholePriceResponse(
        id: id ?? this.id,
        minQuantity: minQuantity ?? this.minQuantity,
        maxQuantity: maxQuantity ?? this.maxQuantity,
        price: price ?? this.price,
      );

  factory WholePriceResponse.fromJson(Map<String, dynamic> json) => WholePriceResponse(
    id: json["id"],
    minQuantity: json["min_quantity"],
    maxQuantity: json["max_quantity"],
    price: json["price"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "min_quantity": minQuantity,
    "max_quantity": maxQuantity,
    "price": price,
  };
}


class GroupProperties {
  GroupProperties(
      {int? id,
        String? type,
        bool? active,
        Translation? translation,
        List<Map>? values}) {
    _id = id;
    _type = type;
    _active = active;
    _values = values;
    _translation = translation;
  }

  GroupProperties.fromJson(dynamic json) {
    _id = json['id'];
    _type = json['type'];
    _translation = json['translation'] != null
        ? Translation.fromJson(json['translation'])
        : null;
  }

  int? _id;
  String? _type;
  bool? _active;
  List<Map>? _values;
  Translation? _translation;

  GroupProperties copyWith({
    int? id,
    String? type,
    bool? active,
    List<Map>? values,
    Translation? translation,
  }) =>
      GroupProperties(
        id: id ?? _id,
        type: type ?? _type,
        values: values ?? _values,
        active: active ?? _active,
        translation: translation ?? _translation,
      );

  int? get id => _id;

  String? get type => _type;

  bool? get active => _active;

  List<Map>? get values => _values;

  Translation? get translation => _translation;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['type'] = _type;
    map['active'] = _active;
    if (_translation != null) {
      map['translation'] = _translation?.toJson();
    }
    return map;
  }
}

class Properties {
  int? id;
  int? productId;
  int? propertyGroupId;
  int? propertyValueId;
  GroupProperties? group;
  Value? value;

  Properties({
    this.id,
    this.productId,
    this.propertyGroupId,
    this.propertyValueId,
    this.group,
    this.value,
  });

  Properties copyWith({
    int? id,
    int? productId,
    int? propertyGroupId,
    int? propertyValueId,
    GroupProperties? group,
    Value? value,
  }) =>
      Properties(
        id: id ?? this.id,
        productId: productId ?? this.productId,
        propertyGroupId: propertyGroupId ?? this.propertyGroupId,
        propertyValueId: propertyValueId ?? this.propertyValueId,
        group: group ?? this.group,
        value: value ?? this.value,
      );

  factory Properties.fromJson(Map<String, dynamic> json) => Properties(
    id: json["id"],
    productId: json["product_id"],
    propertyGroupId: json["property_group_id"],
    propertyValueId: json["property_value_id"],
    group: json["group"] == null
        ? null
        : GroupProperties.fromJson(json["group"]),
    value: json["value"] == null ? null : Value.fromJson(json["value"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "product_id": productId,
    "property_group_id": propertyGroupId,
    "property_value_id": propertyValueId,
    "group": group?.toJson(),
    "value": value?.toJson(),
  };
}

class PropertiesGroup {
  int? id;
  String? type;
  bool? active;
  Translation? translation;

  PropertiesGroup({
    this.id,
    this.type,
    this.active,
    this.translation,
  });

  PropertiesGroup copyWith({
    int? id,
    String? type,
    bool? active,
    Translation? translation,
  }) =>
      PropertiesGroup(
        id: id ?? this.id,
        type: type ?? this.type,
        active: active ?? this.active,
        translation: translation ?? this.translation,
      );

  factory PropertiesGroup.fromJson(Map<String, dynamic> json) =>
      PropertiesGroup(
        id: json["id"],
        type: json["type"],
        active: json["active"],
        translation: json["translation"] == null
            ? null
            : Translation.fromJson(json["translation"]),
      );

  Map<String, dynamic> toJson() => {
    "id": id,
    "type": type,
    "active": active,
    "translation": translation?.toJson(),
  };
}

class Value {
  int? id;
  String? value;
  bool? active;

  Value({
    this.id,
    this.value,
    this.active,
  });

  Value copyWith({
    int? id,
    String? value,
    bool? active,
  }) =>
      Value(
        id: id ?? this.id,
        value: value ?? this.value,
        active: active ?? this.active,
      );

  factory Value.fromJson(Map<String, dynamic> json) => Value(
    id: json["id"],
    value: json["value"],
    active: json["active"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "value": value,
    "active": active,
  };
}