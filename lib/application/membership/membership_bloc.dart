// ignore_for_file: depend_on_referenced_packages, use_build_context_synchronously

import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:bloc/bloc.dart';
import 'package:ibeauty/domain/interface/payments.dart';
import 'package:ibeauty/domain/interface/shop.dart';
import 'package:ibeauty/domain/model/response/membership_response.dart';
import 'package:ibeauty/domain/model/response/my_membership_response.dart';
import 'package:ibeauty/domain/model/response/payments_response.dart';
import 'package:ibeauty/domain/service/helper.dart';
import 'package:ibeauty/presentation/route/app_route.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

part 'membership_event.dart';

part 'membership_state.dart';

part 'membership_bloc.freezed.dart';

class MembershipBloc extends Bloc<MembershipEvent, MembershipState> {
  final ShopsInterface _shopsInterface;
  final PaymentsInterface _paymentsRepo;

  MembershipBloc(this._shopsInterface, this._paymentsRepo)
      : super(const MembershipState()) {
    int page = 0;

    on<FetchMembership>((event, emit) async {
      if (event.isRefresh ?? false) {
        event.controller?.resetNoData();
        page = 0;
        emit(state.copyWith(memberships: [], isLoading: true));
      }
      final res = await _shopsInterface.getMembership(
          page: ++page, id: event.shopId ?? 0);
      res.fold((l) {
        List<MembershipModel> list = List.from(state.memberships);
        list.addAll(l);
        emit(state.copyWith(isLoading: false, memberships: list));
        if (event.isRefresh ?? false) {
          event.controller?.refreshCompleted();
          return;
        } else if (l.isEmpty) {
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

    on<FetchPayments>((event, emit) async {
      emit(state.copyWith(isPaymentLoading: true));
      final res = await _paymentsRepo.getPayments();
      res.fold((l) {
        for (int i = 0; i < (l.data?.length ?? 0); i++) {
          if (l.data?[i].tag == "cash") {
            l.data?.removeAt(i);
          }
        }
        emit(state.copyWith(
            list: l.data,
            selectPayment:
                (l.data?.isNotEmpty ?? false) ? (l.data?.first.id ?? 0) : -1,
            isPaymentLoading: false));
      }, (r) {
        emit(state.copyWith(isPaymentLoading: false));
        AppHelper.errorSnackBar(context: event.context, message: r);
      });
    });

    on<FetchWebView>((event, emit) async {
      emit(state.copyWith(isButtonLoading: true));
      final payment = state.list?.firstWhere(
          (element) => element.id == state.selectPayment,
          orElse: () => PaymentData());
      final res = await _paymentsRepo.paymentMembershipWebView(
          name: payment?.tag ?? "", memberShip: event.membershipId);
      res.fold((l) async {
        emit(state.copyWith(isButtonLoading: false));
        final result = await AppRoute.goWebView(url: l, context: event.context);
        if (result) {
          event.onSuccess?.call();
        }
      }, (r) {
        emit(state.copyWith(isButtonLoading: false));
        AppHelper.errorSnackBar(context: event.context, message: r);
      });
    });

    on<SelectPaymentId>((event, emit) {
      emit(state.copyWith(selectPayment: event.id));
    });

    on<CreateTransaction>((event, emit) async {
      emit(state.copyWith(isButtonLoading: true));
      final res = await _paymentsRepo.createMembershipTransaction(
          membershipId: event.membershipId, paymentId: state.selectPayment);
      res.fold((l) {
        emit(state.copyWith(isButtonLoading: false));
        event.onSuccess?.call();
      }, (r) {
        emit(state.copyWith(isButtonLoading: false));
        AppHelper.errorSnackBar(context: event.context, message: r);
      });
    });

    on<MyMemberships>((event, emit) async {
      if (event.isRefresh ?? false) {
        event.controller?.resetNoData();
        page = 0;
        emit(state.copyWith(myMemberships: [], isLoading: true));
      }
      final res = await _shopsInterface.myMemberships(
          page: ++page, shopId: event.shopId, serviceId: event.serviceId);
      res.fold((l) {
        List<MyMembershipModel> list = List.from(state.myMemberships);
        list.addAll(l);
        emit(state.copyWith(isLoading: false, myMemberships: list));
        if (event.isRefresh ?? false) {
          event.controller?.refreshCompleted();
          return;
        } else if (l.isEmpty) {
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
  }
}
