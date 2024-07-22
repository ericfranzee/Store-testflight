import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:ibeauty/app_constants.dart';
import 'package:ibeauty/domain/di/dependency_manager.dart';
import 'package:ibeauty/domain/interface/gallery.dart';
import 'package:ibeauty/domain/model/response/gallary_list_response.dart';
import 'package:ibeauty/domain/model/response/gallery_upload_response.dart';

class GalleryRepository implements GalleryInterface {
  @override
  Future<Either<GalleryUploadResponse, dynamic>> uploadImage(
    String file,
    UploadType uploadType,
  ) async {
    String type = '';
    switch (uploadType) {
      case UploadType.shopsLogo:
        type = 'shops/logo';
        break;
      case UploadType.shopsBack:
        type = 'shops/background';
        break;
      case UploadType.products:
        type = 'products';
        break;
      case UploadType.reviews:
        type = 'reviews';
        break;
      case UploadType.users:
        type = 'users';
        break;
      case UploadType.chats:
        type = 'chats';
        break;
      default:
        type = '';
        break;
    }
    final data = FormData.fromMap(
      {
        'image': await MultipartFile.fromFile(file),
        'type': type,
      },
    );
    try {
      final client = dioHttp.client(requireAuth: true);
      final response = await client.post(
        '/api/v1/dashboard/galleries',
        data: data,
      );
      return left(GalleryUploadResponse.fromJson(response.data));
    } catch (e) {
      debugPrint('==> upload image failure: $e');
      return right(e);
    }
  }

  @override
  Future<Either<GalleryListUploadResponse, dynamic>> uploadMultipleImage(
      List files, UploadType uploadType) async {
    String type = '';
    switch (uploadType) {
      case UploadType.shopsLogo:
        type = 'shops/logo';
        break;
      case UploadType.shopsBack:
        type = 'shops/background';
        break;
      case UploadType.products:
        type = 'products';
        break;
      case UploadType.reviews:
        type = 'reviews';
        break;
      case UploadType.users:
        type = 'users';
        break;
      case UploadType.chats:
        type = 'chats';
        break;
      default:
        type = '';
        break;
    }
    final data = FormData.fromMap(
      {
        for (int i = 0; i < files.length; i++)
          'images[$i]': await MultipartFile.fromFile(files[i]),
        'type': type,
      },
    );
    try {
      final client = dioHttp.client(requireAuth: true);
      final response = await client.post(
        '/api/v1/dashboard/galleries/store-many',
        data: data,
      );
      return left(GalleryListUploadResponse.fromJson(response.data));
    } catch (e) {
      debugPrint('==> upload image list failure: $e');
      return right(e);
    }
  }
}
