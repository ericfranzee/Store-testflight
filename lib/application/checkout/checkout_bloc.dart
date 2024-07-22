// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:bloc/bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ibeauty/domain/interface/address.dart';
import 'package:ibeauty/domain/interface/payments.dart';
import 'package:ibeauty/domain/model/response/delivery_point_response.dart';
import 'package:ibeauty/domain/model/response/payments_response.dart';
import 'package:ibeauty/domain/model/response/user_address_response.dart';
import 'package:ibeauty/domain/service/helper.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

part 'checkout_event.dart';

part 'checkout_state.dart';

part 'checkout_bloc.freezed.dart';

class CheckoutBloc extends Bloc<CheckoutEvent, CheckoutState> {
  final PaymentsInterface _paymentsRepo;
  final AddressInterface _addressRepo;

  CheckoutBloc(this._paymentsRepo, this._addressRepo)
      : super(const CheckoutState()) {
    int page = 0;
    int addressPage = 0;

    on<SelectAddress>((event, emit) async {
      emit(state.copyWith(selectAddress: event.index));
    });

    on<DeleteAddress>((event, emit) async {
      List<UserAddress> list = List.from(state.address);
      list.removeAt(event.index);
      emit(state.copyWith(address: list));
      final res = await _addressRepo.deleteAddress(addressId: event.addressId);
      res.fold((l) {}, (r) {
        emit(state.copyWith(isLoading: false));
        AppHelper.errorSnackBar(context: event.context, message: r);
      });
    });

    on<FetchUserAddress>((event, emit) async {
      if (event.isRefresh ?? false) {
        event.controller?.resetNoData();
        addressPage = 0;
        emit(state.copyWith(address: [], isLoading: true));
      }
      final res = await _addressRepo.getUserAddress(page: ++addressPage);
      res.fold((l) {
        List<UserAddress> list = List.from(state.address);
        list.addAll(l.data ?? []);
        emit(state.copyWith(isLoading: false, address: list));
        if (event.isRefresh ?? false) {
          event.controller?.refreshCompleted();
          return;
        } else if (l.data?.isEmpty ?? true) {
          event.controller?.loadNoData();
          return;
        }
        event.controller?.loadComplete();
        return;
      }, (r) {
        emit(state.copyWith(isLoading: false));
        if (event.isRefresh ?? false) {
          event.controller?.refreshFailed();
        }
        event.controller?.loadFailed();

        AppHelper.errorSnackBar(context: event.context, message: r);
      });
    });

    on<ChangeActive>((event, emit) {
      emit(state.copyWith(isActive: event.active));
    });

    on<ChangeStep>((event, emit) {
      if (event.step != null) {
        emit(state.copyWith(step: event.step ?? 1));
        return;
      }
      if (state.step == 3) {
        return;
      }
      emit(state.copyWith(step: state.step + 1));
    });

    on<SetMapController>((event, emit) {
      emit(state.copyWith(mapController: event.controller));
    });

    on<SelectPoint>((event, emit) {
      emit(state.copyWith(
        selectPointId: event.point?.id ?? 0,
      ));
    });

    on<FetchDeliveryPoint>((event, emit) async {
      if (event.isRefresh ?? false) {
        event.controller?.resetNoData();
        page = 0;
        emit(state.copyWith(deliveryPoints: [], isLoadingPoint: true));
      }
      final res = await _addressRepo.getDeliveryPoint(page: ++page);
      res.fold((l) {
        List<DeliveryPoint> list = List.from(state.deliveryPoints ?? []);
        list.addAll(l.data ?? []);
        emit(state.copyWith(
            isLoadingPoint: false,
            deliveryPoints: list,
            selectPointId: list.isNotEmpty ? (list.first.id ?? 0) : -1));
        if (event.isRefresh ?? false) {
          event.controller?.refreshCompleted();
          return;
        } else if (l.data?.isEmpty ?? true) {
          event.controller?.loadNoData();
          return;
        }
        event.controller?.loadComplete();
        return;
      }, (r) {
        emit(state.copyWith(isLoadingPoint: false));
        if (event.isRefresh ?? false) {
          event.controller?.refreshFailed();
        }
        event.controller?.loadFailed();

        AppHelper.errorSnackBar(context: event.context, message: r);
      });
    });

    on<FetchDeliveryPrice>((event, emit) async {
      emit(state.copyWith(deliveryPrice: []));
      final response = await _addressRepo.getDeliveryPrice();
      response.fold((l) {
        emit(state.copyWith(isLoadingPoint: false, deliveryPrice: l.data));
      }, (r) {
        emit(state.copyWith(isLoadingPoint: false));
        AppHelper.errorSnackBar(context: event.context, message: r);
      });
    });

    on<FetchPayments>((event, emit) async {
      final res = await _paymentsRepo.getPayments();
      res.fold((l) {
        int index = 0;
        for (int i = 0; i < (l.data?.length ?? 0); i++) {
          if (l.data?[i].tag == "cash") {
            index = i;
          }
        }
        emit(state.copyWith(list: l.data, selectId: l.data?[index].id ?? -1));
      }, (r) {
        AppHelper.errorSnackBar(context: event.context, message: r);
      });
    });

    on<ChangePayment>((event, emit) async {
      emit(state.copyWith(selectId: event.id));
    });

    on<ChangeDate>((event, emit) async {
      emit(state.copyWith(deliveryDate: event.date));
    });
  }
}
