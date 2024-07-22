// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:bloc/bloc.dart';
import 'package:ibeauty/app_constants.dart';
import 'package:ibeauty/domain/di/dependency_manager.dart';
import 'package:ibeauty/domain/interface/gallery.dart';
import 'package:ibeauty/domain/interface/shop.dart';
import 'package:ibeauty/domain/model/model/location_model.dart';
import 'package:ibeauty/domain/service/helper.dart';
import 'package:ibeauty/domain/service/tr_keys.dart';

part 'become_seller_event.dart';

part 'become_seller_state.dart';

part 'become_seller_bloc.freezed.dart';

class BecomeSellerBloc extends Bloc<BecomeSellerEvent, BecomeSellerState> {
  final ShopsInterface _shopsRepo;
  final GalleryInterface _galleryRepository;

  BecomeSellerBloc(this._shopsRepo, this._galleryRepository)
      : super(const BecomeSellerState()) {
    on<CreateShop>((event, emit) async {
      String? logo;
      String? bgImage;
      emit(state.copyWith(isLoading: true, isSuccess: false));

      final logoRes = await _galleryRepository.uploadImage(
          state.logoPath ?? "", UploadType.shopsLogo);

      logoRes.fold((l) => logo = l.imageData?.title, (r) {
        emit(state.copyWith(isLoading: false));
        AppHelper.errorSnackBar(context: event.context, message: r);
      });

      final bgRes = await _galleryRepository.uploadImage(
          state.bgPath ?? "", UploadType.shopsBack);

      bgRes.fold((l) => bgImage = l.imageData?.title, (r) {
        emit(state.copyWith(isLoading: false));
        AppHelper.errorSnackBar(context: event.context, message: r);
      });

      final res = await _shopsRepo.createShop(
          logo: logo ?? "",
          bgImage: bgImage ?? "",
          shopName: event.shopName,
          description: event.description,
          deliveryType: state.type,
          phone: event.phone,
          deliveryTo: event.deliveryTo,
          deliveryFrom: event.deliveryFrom,
          minAmount: event.minAmount,
          tax: event.tax,
          location: event.location);
      res.fold((l) {
        emit(state.copyWith(isLoading: false, isSuccess: true));
        userRepository.getProfileDetails(event.context);
      }, (r) {
        emit(state.copyWith(isLoading: false));
        AppHelper.errorSnackBar(context: event.context, message: r);
      });
    });

    on<SetDeliveryType>((event, emit) {
      emit(state.copyWith(type: event.type ?? ""));
    });

    on<UpdateLogoPath>((event, emit) {
      emit(state.copyWith(logoPath: event.imagePath));
    });

    on<UpdateBgPath>((event, emit) {
      emit(state.copyWith(bgPath: event.imagePath));
    });
  }
}
