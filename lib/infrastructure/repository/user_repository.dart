import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:ibeauty/app_constants.dart';
import 'package:ibeauty/domain/model/model/notification_data.dart';
import 'package:ibeauty/domain/model/model/referral_model.dart';
import 'package:ibeauty/domain/model/model/user_model.dart';
import 'package:ibeauty/domain/model/response/search_user_response.dart';
import 'package:ibeauty/domain/di/dependency_manager.dart';
import 'package:ibeauty/domain/interface/user.dart';
import 'package:ibeauty/domain/model/response/count_of_notifications_data.dart';
import 'package:ibeauty/domain/model/response/notification_response.dart';
import 'package:ibeauty/domain/model/response/profile_response.dart';
import 'package:ibeauty/domain/model/response/transaction_histories_response.dart';
import 'package:ibeauty/domain/service/helper.dart';
import 'package:ibeauty/infrastructure/local_storage/local_storage.dart';
import 'package:ibeauty/presentation/route/app_route.dart';
import 'package:path_provider/path_provider.dart';

import '../../domain/model/response/digital_list_response.dart';

class UserRepository implements UserInterface {
  @override
  Future<Either<ProfileResponse, dynamic>> getProfileDetails(
      BuildContext context) async {
    try {
      final data = {
        if (LocalStorage.getSelectedCurrency()?.id != null)
          'currency_id': LocalStorage.getSelectedCurrency()?.id,
        "lang": LocalStorage.getLanguage()?.locale ?? "en"
      };
      final client = dioHttp.client(requireAuth: true);
      final response = await client.get('/api/v1/dashboard/user/profile/show',
          queryParameters: data);
      LocalStorage.setUser(ProfileResponse.fromJson(response.data).data);

      return left(ProfileResponse.fromJson(response.data));
    } catch (e) {
      debugPrint('==> get user details failure: $e');
      if ((e as DioException).type == DioExceptionType.badResponse &&
          e.response?.statusCode == 401) {
        if (context.mounted) {
          LocalStorage.clear();
          AppRoute.goLogin(context);
        }

        return right("");
      }
      return right(AppHelper.errorHandler(e));
    }
  }

  @override
  Future<Either<ProfileResponse, dynamic>> updateProfile({
    required String firstName,
    required String lastName,
    required String phone,
    required String email,
    String? imageUrl,
  }) async {
    final data = {
      'firstname': firstName,
      'lastname': lastName,
     if(phone.isNotEmpty) 'phone': phone,
      if(email.isNotEmpty)   'email': email,
      if (imageUrl != null) 'images': [imageUrl],
    };
    try {
      final client = dioHttp.client(requireAuth: true);
      final response = await client.put(
        '/api/v1/dashboard/user/profile/update',
        data: data,
      );
      return left(ProfileResponse.fromJson(response.data));
    } catch (e) {
      debugPrint('==> update profile image failure: $e');
      return right(AppHelper.errorHandler(e));
    }
  }

  @override
  Future<Either<ProfileResponse, dynamic>> updatePassword({
    required String password,
    required String passwordConfirmation,
  }) async {
    final data = {
      'password': password,
      'password_confirmation': passwordConfirmation,
    };
    try {
      final client = dioHttp.client(requireAuth: true);
      final response = await client.post(
        '/api/v1/dashboard/user/profile/password/update',
        data: data,
      );
      return left(ProfileResponse.fromJson(response.data));
    } catch (e) {
      debugPrint('==> update password failure: $e');
      return right(AppHelper.errorHandler(e));
    }
  }

  @override
  Future updateFirebaseToken(String? token) async {
    final data = {if (token != null) 'firebase_token': token};
    try {
      final client = dioHttp.client(requireAuth: true);
      await client.post(
        '/api/v1/dashboard/user/profile/firebase/token/update',
        data: data,
      );
    } catch (e) {
      debugPrint('==> update firebase token failure: $e');
    }
  }

  @override
  Future deleteAccount() async {
    try {
      final client = dioHttp.client(requireAuth: true);
      await client.delete(
        '/api/v1/dashboard/user/profile/delete',
      );
    } catch (e) {
      debugPrint('==> delete account failure: $e');
    }
  }

  @override
  Future setLikeProductList({required List<int> ids}) async {
    try {
      final data = {
        "types": [
          for (int i = 0; i < ids.length; i++)
            {"type": "product", "type_id": ids[i]},
        ]
      };
      final client = dioHttp.client(requireAuth: true);
      await client.post('/api/v1/dashboard/like/store-many', data: data);
    } catch (e) {
      debugPrint('==> set like product list failure: $e');
    }
  }

  @override
  Future setLikeProduct({required int id}) async {
    try {
      final data = {"type": "product", "type_id": id};
      final client = dioHttp.client(requireAuth: true);
      await client.post('/api/v1/dashboard/likes', data: data);
    } catch (e) {
      debugPrint('==> set like product failure: $e');
    }
  }

  @override
  Future removeLikeProduct({required int id}) async {
    try {
      final client = dioHttp.client(requireAuth: true);
      await client.delete(
        '/api/v1/dashboard/likes/$id?type=product',
      );
    } catch (e) {
      debugPrint('==> set like product failure: $e');
    }
  }

  @override
  Future setLikeMasterList({required List<int> ids}) async {
    try {
      final data = {
        "types": [
          for (int i = 0; i < ids.length; i++)
            {"type": "master", "type_id": ids[i]},
        ]
      };
      final client = dioHttp.client(requireAuth: true);
      await client.post('/api/v1/dashboard/like/store-many', data: data);
    } catch (e) {
      debugPrint('==> set like master list failure: $e');
    }
  }

  @override
  Future setLikeMaster({required int id}) async {
    try {
      final data = {"type": "master", "type_id": id};
      final client = dioHttp.client(requireAuth: true);
      await client.post('/api/v1/dashboard/likes', data: data);
    } catch (e) {
      debugPrint('==> set like master failure: $e');
    }
  }

  @override
  Future removeLikeMaster({required int id}) async {
    try {
      final client = dioHttp.client(requireAuth: true);
      await client.delete(
        '/api/v1/dashboard/likes/$id?type=master',
      );
    } catch (e) {
      debugPrint('==> set like master failure: $e');
    }
  }

  @override
  Future<Either<NotificationResponse, dynamic>> getNotifications({
    int? page,
  }) async {
    final data = {
      if (page != null) 'page': page,
      'column': 'created_at',
      'sort': 'desc',
      'perPage': 7,
      'lang': LocalStorage.getLanguage()?.locale,
    };
    try {
      final client = dioHttp.client(requireAuth: true);
      final response = await client.get(
        '/api/v1/dashboard/notifications',
        queryParameters: data,
      );
      return left(NotificationResponse.fromJson(response.data));
    } catch (e) {
      debugPrint('==> get notification failure: $e');
      return right(AppHelper.errorHandler(e));
    }
  }

  @override
  Future<Either<bool, dynamic>> readOne({int? id}) async {
    final data = {
      if (id != null) '$id': id,
      'lang': LocalStorage.getLanguage()?.locale,
    };
    try {
      final client = dioHttp.client(requireAuth: true);
      await client.post(
        '/api/v1/dashboard/notifications/$id/read-at',
        queryParameters: data,
      );
      return left(true);
    } catch (e) {
      debugPrint('==> get notification failure: $e');
      return right(AppHelper.errorHandler(e));
    }
  }

  @override
  Future<Either<NotificationResponse, dynamic>> readAll() async {
    try {
      final client = dioHttp.client(requireAuth: true);
      final response = await client.post(
        '/api/v1/dashboard/notifications/read-all',
      );
      return left(NotificationResponse.fromJson(response.data));
    } catch (e) {
      debugPrint('==> get notification failure: $e');
      return right(AppHelper.errorHandler(e));
    }
  }

  @override
  Future<Either<CountNotificationModel, dynamic>> getCount(BuildContext context) async {
    try {
      final client = dioHttp.client(requireAuth: true);
      final response = await client.get(
        '/api/v1/dashboard/user/profile/notifications-statistic',
      );
      return left(CountNotificationModel.fromJson(response.data));
    } catch (e) {
      debugPrint('==> get notification failure: $e');
      if ((e as DioException).type == DioExceptionType.badResponse &&
          e.response?.statusCode == 401) {
        if (context.mounted) {
          LocalStorage.clear();
          AppRoute.goLogin(context);
        }

        return right("");
      }
      return right(AppHelper.errorHandler(e));
    }
  }

  @override
  Future<Either<TransactionPaginationResponse, dynamic>> getTransactions(
      int page) async {
    final data = {
      'page': page,
      'perPage': 10,
      if (LocalStorage.getSelectedCurrency()?.id != null)
        'currency_id': LocalStorage.getSelectedCurrency()?.id,
      "lang": LocalStorage.getLanguage()?.locale ?? "en"
    };
    try {
      final client = dioHttp.client(requireAuth: true);
      final response = await client.get(
        '/api/v1/dashboard/user/wallet/histories',
        queryParameters: data,
      );
      return left(
        TransactionPaginationResponse.fromJson(response.data),
      );
    } catch (e) {
      debugPrint('==> get wallet histories failure: $e');
      return right(AppHelper.errorHandler(e));
    }
  }

  @override
  Future<Either<List<UserModel>, dynamic>> searchUser(
      {required String name, required int page}) async {
    final data = {
      'page': page,
      'search': name,
    };
    try {
      final client =
          dioHttp.client(requireAuth: LocalStorage.getToken().isNotEmpty);
      final response = await client.get(
        '/api/v1/dashboard/user/search-sending',
        queryParameters: data,
      );
      return left(SearchUserResponse.fromJson(response.data).data ?? []);
    } catch (e) {
      debugPrint('==> search user failure: $e');
      return right(AppHelper.errorHandler(e));
    }
  }

  @override
  Future<Either<DigitalListResponse, dynamic>> getDigitalList(
      {int? page}) async {
    final data = {
      'page': page,
      'perPage': 10,
      if (LocalStorage.getSelectedCurrency()?.id != null)
        'currency_id': LocalStorage.getSelectedCurrency()?.id,
      "lang": LocalStorage.getLanguage()?.locale ?? "en"
    };
    try {
      final client = dioHttp.client(requireAuth: true);
      final response = await client.get(
        '/api/v1/dashboard/user/my-digital-files',
        queryParameters: data,
      );
      return left(
        DigitalListResponse.fromJson(response.data),
      );
    } catch (e) {
      debugPrint('==> get digital failure: $e');
      return right(AppHelper.errorHandler(e));
    }
  }

  @override
  Future<Either<String, dynamic>> getDigitalProduct({required int id}) async {
    try {
      final localPath = (await findLocalPath(id))!;
      final savedDir = Directory(localPath);

      if (!savedDir.existsSync()) {
        await savedDir.create();
      }
      final taskId = await FlutterDownloader.enqueue(
          url: '${AppConstants.baseUrl}api/v1/dashboard/user/digital-files/$id',
          headers: {"Authorization": "Bearer ${LocalStorage.getToken()}"},
          savedDir: localPath,
          showNotification: true,
          saveInPublicStorage: true );
      return left(taskId ?? "");
    } catch (e) {
      debugPrint('==> FlutterDownloader.enqueue failure: $e');
      return right(AppHelper.errorHandler(e));
    }
  }

  Future<String?> findLocalPath(int id) async {
    String? externalStorageDirPath;
    if (Platform.isAndroid) {
      try {
        final directory = await getExternalStorageDirectory();
        externalStorageDirPath = directory?.path;
      } catch (e) {
        final directory = await getExternalStorageDirectory();
        externalStorageDirPath = directory?.path;
      }
    } else if (Platform.isIOS) {
      externalStorageDirPath =
          (await getApplicationDocumentsDirectory()).absolute.path;
    }

    String localPath = '${externalStorageDirPath!}/digital-$id';
    final savedDir = Directory(localPath);
    bool hasExisted = await savedDir.exists();
    if (!hasExisted) {
      savedDir.create();
    }
    return externalStorageDirPath;
  }

  @override
  Future<Either<bool, dynamic>> updateNotification(
      {List<NotificationsModel>? notifications}) async {
    try {
      final client = dioHttp.client(requireAuth: true);
      final data = {
        for (int i = 0; i < notifications!.length; i++)
          "notifications[$i][notification_id]": notifications[i].id,
        for (int i = 0; i < notifications.length; i++)
          "notifications[$i][active]":
              (notifications[i].active ?? 1) == 1 ? 0 : 1,
      };
      await client.post('/api/v1/dashboard/user/update/notifications',
          queryParameters: data);
      return left(true);
    } catch (e) {
      debugPrint('==> update notification failure: $e');
      return right(AppHelper.errorHandler(e));
    }
  }

  @override
  Future<Either<bool, dynamic>> deleteNotification({int? id}) async {
    try {
      final client = dioHttp.client(requireAuth: true);

      await client.delete('api/v1/dashboard/notifications/$id');
      return left(true);
    } catch (e) {
      debugPrint('==> delete notification failure: $e');
      return right(AppHelper.errorHandler(e));
    }
  }

  @override
  Future<Either<ReferralModel, dynamic>> getReferralDetails() async {
    final data = {
      if (LocalStorage.getSelectedCurrency()?.id != null)
        'currency_id': LocalStorage.getSelectedCurrency()?.id,
      "lang": LocalStorage.getLanguage()?.locale ?? "en"
    };
    try {
      final client = dioHttp.client(requireAuth: true);
      final response = await client.get(
        '/api/v1/rest/referral',
        queryParameters: data,
      );
      return left(
        ReferralModel.fromJson(response.data["data"]),
      );
    } catch (e) {
      debugPrint('==> get referral failure: $e');
      return right(AppHelper.errorHandler(e));
    }
  }
}
