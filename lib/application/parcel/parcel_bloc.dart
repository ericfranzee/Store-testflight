// ignore_for_file: depend_on_referenced_packages, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ibeauty/domain/interface/parcel.dart';
import 'package:ibeauty/domain/interface/payments.dart';
import 'package:ibeauty/domain/model/model/location_model.dart';
import 'package:ibeauty/domain/model/model/parcel_order_model.dart';
import 'package:ibeauty/domain/model/response/parcel_calculate_response.dart';
import 'package:ibeauty/domain/model/response/parcel_response.dart';
import 'package:ibeauty/domain/model/response/payments_response.dart';
import 'package:ibeauty/domain/service/helper.dart';
import 'package:ibeauty/presentation/route/app_route.dart';
import 'package:ibeauty/presentation/route/app_route_parcel.dart';

part 'parcel_event.dart';

part 'parcel_state.dart';

part 'parcel_bloc.freezed.dart';

class ParcelBloc extends Bloc<ParcelEvent, ParcelState> {
  final ParcelInterface _parcelRepository;
  final PaymentsInterface _paymentsRepo;

  ParcelBloc(this._parcelRepository, this._paymentsRepo)
      : super(const ParcelState()) {
    on<AddReview>((event, emit) async {
      emit(state.copyWith(isButtonLoading: true));
      final response = await _parcelRepository.addReview(state.parcel?.id ?? 0,
          rating: event.rating, comment: event.comment);
      response.fold((l) {
        emit(state.copyWith(isButtonLoading: false));
        Navigator.pop(event.context);
      }, (r) {
        emit(state.copyWith(isButtonLoading: false));
        AppHelper.errorSnackBar(
          context: event.context,
          message: r,
        );
      });
    });

    on<ChangeExpand>((event, emit) {
      emit(state.copyWith(expand: !state.expand));
    });

    on<ChangeAnonymous>((event, emit) {
      emit(state.copyWith(anonymous: !state.anonymous));
    });

    on<FetchTypes>((event, emit) async {
      emit(state.copyWith(isLoading: true));
      final response = await _parcelRepository.getTypes();
      response.fold(
          (l) => emit(state.copyWith(isLoading: false, types: l.data ?? [])),
          (r) {
        emit(state.copyWith(isLoading: false));
        AppHelper.errorSnackBar(
          context: event.context,
          message: AppHelper.getTrn(r),
        );
      });
    });

    on<GetCalculate>((event, emit) async {
      emit(state.copyWith(isLoading: true, error: false));
      final response = await _parcelRepository.getCalculate(
          typeId: state.types[state.selectType]?.id ?? 0,
          from: state.locationFrom ?? LocationModel(),
          to: state.locationTo ?? LocationModel());

      response.fold((l) => emit(state.copyWith(isLoading: false, calculate: l)),
          (r) {
        emit(state.copyWith(isLoading: false, error: true));
        AppHelper.errorSnackBar(
          context: event.context,
          message: r,
        );
      });
    });

    on<OrderParcel>((event, emit) async {
      emit(state.copyWith(isLoading: true));
      final response = await _parcelRepository.orderParcel(
          typeId: state.types[state.selectType]?.id ?? 0,
          from: state.locationFrom ?? LocationModel(),
          to: state.locationTo ?? LocationModel(),
          fromTitle: state.addressFrom ?? "",
          toTitle: state.addressTo ?? "",
          time:
              "${(state.time ?? TimeOfDay.now()).hour}:${(state.time ?? TimeOfDay.now()).minute}",
          note: event.note,
          phoneFrom: event.phoneFrom,
          phoneTo: event.phoneTo,
          usernameTo: event.usernameTo,
          usernameFrom: event.usernameFrom,
          notify: state.anonymous,
          floorTo: event.floorTo,
          floorFrom: event.floorFrom,
          houseFrom: event.houseFrom,
          houseTo: event.houseTo,
          comment: event.comment,
          value: event.value,
          instruction: event.instruction,
          paymentId: (event.paymentData.tag == "cash" ||
                  event.paymentData.tag == "wallet")
              ? event.paymentData.id
              : null);
      response.fold((l) async {
        emit(state.copyWith(isLoading: false));
        if (event.paymentData.tag != "cash" &&
            event.paymentData.tag != "wallet") {
          final res = await _paymentsRepo.paymentWebView(
              parcel: true, name: event.paymentData.tag ?? "", parcelId: l);
          res.fold((l) async {
            AppRoute.goWebView(url: l, context: event.context);
          }, (r) {
            AppHelper.errorSnackBar(context: event.context, message: r);
          });
        }
        AppRouteParcel.goParcelList(context: event.context);
      }, (r) {
        emit(state.copyWith(isLoading: false));
        AppHelper.errorSnackBar(
          context: event.context,
          message: r,
        );
      });
    });

    on<SelectType>((event, emit) async {
      emit(state.copyWith(selectType: event.index));
      if (state.types.isNotEmpty &&
          state.addressFrom != null &&
          state.addressTo != null) {
        event.context
            .read<ParcelBloc>()
            .add(ParcelEvent.getCalculate(event.context));
      }
    });

    on<SetToAddress>((event, emit) async {
      emit(state.copyWith(addressTo: event.title, locationTo: event.location));
      if (state.types.isNotEmpty &&
          state.addressFrom != null &&
          state.addressTo != null) {
        event.context
            .read<ParcelBloc>()
            .add(ParcelEvent.getCalculate(event.context));
      }
    });

    on<SetFromAddress>((event, emit) async {
      emit(state.copyWith(
          addressFrom: event.title, locationFrom: event.location));
      if (state.types.isNotEmpty &&
          state.addressFrom != null &&
          state.addressTo != null) {
        event.context
            .read<ParcelBloc>()
            .add(ParcelEvent.getCalculate(event.context));
      }
    });

    on<SwitchAddress>((event, emit) async {
      emit(state.copyWith(
          addressFrom: state.addressTo,
          locationFrom: state.locationTo,
          addressTo: state.addressFrom,
          locationTo: state.locationFrom));
      if (state.types.isNotEmpty &&
          state.addressFrom != null &&
          state.addressTo != null) {
        event.context
            .read<ParcelBloc>()
            .add(ParcelEvent.getCalculate(event.context));
      }
    });

    on<SetTime>((event, emit) async {
      emit(state.copyWith(time: event.time));
    });

    on<ShowParcel>((event, emit) async {
      emit(state.copyWith(
          isLoading: event.parcel == null, parcel: event.parcel));
      final response = await _parcelRepository.getSingleParcel(event.orderId);
      response.fold((l) async {
        emit(state.copyWith(parcel: l, isLoading: false));
      }, (r) {
        emit(state.copyWith(isLoading: false));
        AppHelper.errorSnackBar(
          context: event.context,
          message: r,
        );
      });
    });
  }
}
