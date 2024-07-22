import 'package:ibeauty/domain/model/model/shop_model.dart';

import 'currency_model.dart';
import 'notification_data.dart';

class UserModel {
  UserModel({
    int? id,
    String? uuid,
    String? firstname,
    String? lastname,
    String? email,
    String? phone,
    String? birthday,
    String? gender,
    String? emailVerifiedAt,
    String? registeredAt,
    bool? active,
    String? img,
    String? role,
    ShopData? shop,
    String? password,
    String? refreshToken,
    String? referral,
    num? referralFromPrice,
    num? referralFromWithdrawPrice,
    num? referralFromWithdrawCount,
    num? referralFromCount,
    num? rate,
    Wallet? wallet,
    List<NotificationsModel>? notifications,
  }) {
    _id = id;
    _uuid = uuid;
    _firstname = firstname;
    _lastname = lastname;
    _email = email;
    _phone = phone;
    _birthday = birthday;
    _gender = gender;
    _emailVerifiedAt = emailVerifiedAt;
    _registeredAt = registeredAt;
    _active = active;
    _shop = shop;
    _img = img;
    _role = role;
    _rate = rate;
    _password = password;
    _wallet = wallet;
    _refreshToken = refreshToken;
    _notifications = notifications;
    _referralFromPrice = referralFromPrice;
    _referralFromCount = referralFromCount;
    _referralFromWithdrawPrice = referralFromWithdrawPrice;
    _referralFromWithdrawCount = referralFromWithdrawCount;
    _referral = referral;
  }

  UserModel.fromJson(dynamic json) {
    _id = json['id'];
    _uuid = json['uuid'];
    _firstname = json['firstname'];
    _lastname = json['lastname'];
    _email = json['email'];
    _shop = json?['shop'] != null ? ShopData.fromJson(json['shop']) : null;
    _phone = json['phone'];
    _birthday = json['birthday'];
    _gender = json['gender'];
    _referral = json["my_referral"];
    _referralFromPrice = json["referral_from_topup_price"];
    _referralFromCount = json["referral_from_topup_count"];
    _referralFromWithdrawCount = json["referral_from_withdraw_count"];
    _referralFromWithdrawPrice = json["referral_from_withdraw_price"];
    _emailVerifiedAt = json['email_verified_at'];
    _registeredAt = json['registered_at'];
    _active = json['active'];
    _img = json['img'];
    _role = json['role'];
    _password = json['password'];
    _refreshToken = json['refresh_token'];
    _rate = double.tryParse(json['r_avg'].toString());
    _wallet = json['wallet'] != null ? Wallet.fromJson(json['wallet']) : null;
    if (json['notifications'] != null) {
      _notifications = [];
      json['notifications'].forEach((v) {
        _notifications?.add(NotificationsModel.fromJson(v));
      });
    }
  }

  int? _id;
  String? _uuid;
  String? _firstname;
  String? _lastname;
  String? _email;
  String? _phone;
  String? _birthday;
  String? _gender;
  String? _emailVerifiedAt;
  String? _registeredAt;
  String? _password;
  bool? _active;
  String? _img;
  ShopData? _shop;
  String? _role;
  String? _refreshToken;
  List<NotificationsModel>? _notifications;
  num? _rate;
  Wallet? _wallet;
  num? _referralFromPrice;
  num? _referralFromCount;
  num? _referralFromWithdrawCount;
  num? _referralFromWithdrawPrice;
  String? _referral;

  UserModel copyWith({
    int? id,
    String? uuid,
    String? firstname,
    String? lastname,
    String? email,
    String? phone,
    String? birthday,
    String? gender,
    String? emailVerifiedAt,
    String? registeredAt,
    String? referral,
    bool? active,
    String? img,
    String? role,
    ShopData? shop,
    String? password,
    String? refreshToken,
    List<NotificationsModel>? notification,
    num? rate,
    Wallet? wallet,
  }) =>
      UserModel(
          id: id ?? _id,
          uuid: uuid ?? _uuid,
          firstname: firstname ?? _firstname,
          lastname: lastname ?? _lastname,
          email: email ?? _email,
          phone: phone ?? _phone,
          birthday: birthday ?? _birthday,
          gender: gender ?? _gender,
          emailVerifiedAt: emailVerifiedAt ?? _emailVerifiedAt,
          registeredAt: registeredAt ?? _registeredAt,
          active: active ?? _active,
          img: img ?? _img,
          referral: referral ?? _referral,
          shop: shop ?? _shop,
          role: role ?? _role,
          rate: rate ?? _rate,
          refreshToken: refreshToken ?? _refreshToken,
          password: password ?? _password,
          wallet: wallet ?? _wallet,
          notifications: notification ?? _notifications);

  int? get id => _id;

  String? get uuid => _uuid;

  String? get firstname => _firstname;

  String? get lastname => _lastname;

  String? get email => _email;

  String? get phone => _phone;

  ShopData? get shop => _shop;

  num? get referralFromCount => _referralFromCount;

  num? get referralFromPrice => _referralFromPrice;

  num? get referralFromWithdrawCount => _referralFromWithdrawCount;

  num? get referralFromWithdrawPrice => _referralFromWithdrawPrice;

  String? get referral => _referral;

  String? get birthday => _birthday;

  String? get gender => _gender;

  String? get password => _password;

  String? get refreshToken => _refreshToken;

  String? get emailVerifiedAt => _emailVerifiedAt;

  String? get registeredAt => _registeredAt;

  bool? get active => _active;

  String? get img => _img;

  String? get role => _role;

  num? get rate => _rate;

  List<NotificationsModel>? get notification => _notifications;

  Wallet? get wallet => _wallet;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_id != null) map['id'] = _id;
    if (_uuid != null) map['uuid'] = _uuid;
    if (_firstname != null) map['firstname'] = _firstname;
    if (_lastname != null) map['lastname'] = _lastname;
    if (_email != null) map['email'] = _email;
    if (_phone != null) {
      map['phone'] =
          _phone?.replaceAll("+", "").replaceAll(" ", "").replaceAll("-", "");
    }
    if (_referral != null && (_referral?.isNotEmpty ?? false)) map['my_referral'] = _referral;
    if (_referralFromWithdrawPrice != null) map['referral_from_withdraw_price'] = _referralFromWithdrawPrice;
    if (_referralFromWithdrawCount != null) map['referral_from_withdraw_count'] = _referralFromWithdrawCount;
    if (_referralFromCount != null) map['referral_from_topup_count'] = _referralFromCount;
    if (_referralFromPrice != null) map['referral_from_topup_price'] = _referralFromPrice;
    if (_birthday != null) map['birthday'] = _birthday;
    if (_gender != null) map['gender'] = _gender;
    if (_emailVerifiedAt != null) map['email_verified_at'] = _emailVerifiedAt;
    if (_registeredAt != null) map['registered_at'] = _registeredAt;
    if (_active != null) map['active'] = _active;
    if (_img != null) map['img'] = _img;
    if (_shop != null) map['shop'] = _shop?.toJson();
    if (_role != null) map['role'] = _role;
    if (_password != null) map['password'] = _password;
    if (_wallet != null) map['wallet'] = _wallet?.toJson();
    map['type'] = "firebase";
    if (_refreshToken != null) map['id'] = _refreshToken;
    if (_notifications != null) {
      map['notifications'] = _notifications?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Wallet {
  Wallet({
    String? uuid,
    int? userId,
    int? id,
    int? currencyId,
    num? price,
    String? createdAt,
    String? updatedAt,
    CurrencyData? currency,
  }) {
    _uuid = uuid;
    _id = id;
    _userId = userId;
    _currencyId = currencyId;
    _price = price;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _currency = currency;
  }

  Wallet.fromJson(dynamic json) {
    _uuid = json['uuid'];
    _id = json['id'];
    _userId = json['user_id'];
    _currencyId = json['currency_id'];
    _price = json['price'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _currency = json['currency'] != null
        ? CurrencyData.fromJson(json['currency'])
        : null;
  }

  String? _uuid;
  int? _userId;
  int? _id;
  int? _currencyId;
  num? _price;
  String? _createdAt;
  String? _updatedAt;
  CurrencyData? _currency;

  Wallet copyWith({
    String? uuid,
    int? userId,
    int? id,
    int? currencyId,
    num? price,
    String? createdAt,
    String? updatedAt,
    CurrencyData? currency,
  }) =>
      Wallet(
        uuid: uuid ?? _uuid,
        userId: userId ?? _userId,
        id: id ?? _id,
        currencyId: currencyId ?? _currencyId,
        price: price ?? _price,
        createdAt: createdAt ?? _createdAt,
        updatedAt: updatedAt ?? _updatedAt,
        currency: currency ?? _currency,
      );

  String? get uuid => _uuid;

  int? get userId => _userId;

  int? get id => _id;

  int? get currencyId => _currencyId;

  num? get price => _price;

  String? get createdAt => _createdAt;

  String? get updatedAt => _updatedAt;

  CurrencyData? get currency => _currency;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['uuid'] = _uuid;
    map['id'] = _id;
    map['user_id'] = _userId;
    map['currency_id'] = _currencyId;
    map['price'] = _price;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    if (_currency != null) {
      map['currency'] = _currency?.toJson();
    }
    return map;
  }
}

class DownloadModel {
  DownloadModel({
    String? taskId,
    int? index,
    int? progress,
  }) {
    _taskId = taskId;
    _index = index;
    _progress = progress;
  }

  DownloadModel.fromJson(dynamic json) {
    _taskId = json['task_id'];
    _index = json['index'];
    _progress = json['progress'];
  }

  String? _taskId;
  int? _index;
  int? _progress;

  DownloadModel copyWith({
    int? progress,
    String? taskId,
    int? index,
  }) =>
      DownloadModel(
        progress: progress ?? _progress,
        taskId: taskId ?? _taskId,
        index: index ?? _index,
      );

  String? get taskId => _taskId;

  int? get progress => _progress;

  int? get index => _index;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['task_id'] = _taskId;
    map['index'] = _index;
    map['progress'] = _progress;

    return map;
  }
}
