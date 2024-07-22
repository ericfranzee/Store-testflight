// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:bloc/bloc.dart';
import 'package:ibeauty/domain/interface/booking.dart';
import 'package:ibeauty/domain/interface/payments.dart';
import 'package:ibeauty/domain/model/model/master_model.dart';
import 'package:ibeauty/domain/model/model/service_model.dart';
import 'package:ibeauty/domain/model/response/booking_calculate_response.dart';
import 'package:ibeauty/domain/model/response/booking_response.dart';
import 'package:ibeauty/domain/model/response/check_time_response.dart';
import 'package:ibeauty/domain/model/response/form_options_response.dart';
import 'package:ibeauty/domain/model/response/my_gift_cart_response.dart';
import 'package:ibeauty/domain/model/response/payments_response.dart';
import 'package:ibeauty/domain/model/response/service_of_master_response.dart';
import 'package:ibeauty/domain/service/helper.dart';
import 'package:ibeauty/domain/service/tr_keys.dart';
import 'package:ibeauty/infrastructure/local_storage/local_storage.dart';
import 'package:ibeauty/presentation/route/app_route.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

part 'booking_event.dart';

part 'booking_state.dart';

part 'booking_bloc.freezed.dart';

class BookingBloc extends Bloc<BookingEvent, BookingState> {
  final BookingInterface _bookingRepo;
  final PaymentsInterface _paymentsRepo;

  BookingBloc(this._bookingRepo, this._paymentsRepo)
      : super(const BookingState()) {
    int pagePast = 0;
    int pageUpcoming = 0;

    on<FetchBookPast>((event, emit) async {
      if (event.isRefresh ?? false) {
        event.controller?.resetNoData();
        pagePast = 0;
        emit(state.copyWith(past: [], isLoading: true));
      }
      final res =
          await _bookingRepo.getBooks(page: ++pagePast, type: TrKeys.past);
      res.fold((l) {
        List<BookingModel> list = List.from(state.past);
        list.addAll(l.data ?? []);
        emit(state.copyWith(isLoading: false, past: list));
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

    on<FetchBookUpcoming>((event, emit) async {
      if (event.isRefresh ?? false) {
        event.controller?.resetNoData();
        pageUpcoming = 0;
        emit(state.copyWith(upcoming: [], isLoading: true));
      }
      final res = await _bookingRepo.getBooks(
          page: ++pageUpcoming, type: TrKeys.upcoming);
      res.fold((l) {
        List<BookingModel> list = List.from(state.upcoming);
        list.addAll(l.data ?? []);
        emit(state.copyWith(isLoading: false, upcoming: list));
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

    on<FetchBookingById>((event, emit) async {
      emit(state.copyWith(upcoming: [], isLoading: true));
      final res = await _bookingRepo.getBookingById(id: event.id);
      res.fold((l) {
        emit(state.copyWith(isLoading: false, upcoming: l.data ?? []));
      }, (r) {
        emit(state.copyWith(isLoading: false));
        AppHelper.errorSnackBar(context: event.context, message: r);
      });
    });

    on<BookingService>((event, emit) async {
      emit(state.copyWith(isButtonLoading: true));
      final payment = state.list?.firstWhere(
          (element) => element.id == state.selectPayment,
          orElse: () => PaymentData());
      final num wallet = LocalStorage.getUser().wallet?.price ?? 0;
      if (payment?.tag == "wallet" && wallet < event.totalPrice) {
        AppHelper.errorSnackBar(
          context: event.context,
          message: AppHelper.getTrn(TrKeys.notEnoughMoney),
        );
        emit(state.copyWith(isButtonLoading: false));
        return;
      }

      final res = await _bookingRepo.bookingService(
          serviceMasters: state.selectMasters.values.toList(),
          dateTime: event.startTime,
          giftCartId: state.giftCart?.giftCartId,
          paymentId: state.selectPayment);
      res.fold((id) {
        if (payment?.tag != "cash" && payment?.tag != "wallet") {
          event.onSuccess.call(id);
          return;
        }
        event.onSuccess.call(-1);
        emit(state.copyWith(isButtonLoading: false));
      }, (r) {
        emit(state.copyWith(isButtonLoading: false));
        AppHelper.errorSnackBar(context: event.context, message: r);
      });
    });

    on<FetchPayments>((event, emit) async {
      emit(state.copyWith(isPaymentLoading: true));
      final res = await _paymentsRepo.getPayments();
      res.fold((l) {
        int index = 0;
        for (int i = 0; i < (l.data?.length ?? 0); i++) {
          if (l.data?[i].tag == "cash") {
            index = i;
          }
        }
        emit(state.copyWith(
            list: l.data,
            selectPayment: l.data?[index].id ?? -1,
            isPaymentLoading: false));
      }, (r) {
        emit(state.copyWith(isPaymentLoading: false));
        AppHelper.errorSnackBar(context: event.context, message: r);
      });
    });

    on<FetchWebView>((event, emit) async {
      final payment = state.list?.firstWhere(
          (element) => element.id == state.selectPayment,
          orElse: () => PaymentData());
      final res = await _paymentsRepo.paymentBookWebView(
          name: payment?.tag ?? "", bookId: event.id);
      res.fold((l) async {
        emit(state.copyWith(isButtonLoading: false));
        await AppRoute.goWebView(url: l, context: event.context);
      }, (r) {
        emit(state.copyWith(isButtonLoading: false));
        AppHelper.errorSnackBar(context: event.context, message: r);
      });
    });

    on<CancelBook>((event, emit) async {
      emit(state.copyWith(isButtonLoading: true));
      final res = await _bookingRepo.cancelBook(event.id);
      res.fold((l) async {
        List<BookingModel> list = List.from(state.upcoming);
        list.removeWhere((element) => element.id == event.id);
        emit(state.copyWith(isButtonLoading: false, upcoming: list));
        event.onSuccess?.call();
      }, (r) {
        emit(state.copyWith(isButtonLoading: false));
        AppHelper.errorSnackBar(context: event.context, message: r);
      });
    });

    on<CalculateBooking>((event, emit) async {
      emit(state.copyWith(isLoading: true));

      final res = await _bookingRepo.calculateBooking(
        selectMasters: state.selectMasters,
        giftCartId: state.giftCart?.giftCartId,
        startTime: event.startTime,
      );
      res.fold((l) async {
        emit(state.copyWith(isLoading: false, calculate: l));
      }, (r) {
        emit(state.copyWith(isLoading: false));
        AppHelper.errorSnackBar(context: event.context, message: r);
      });
    });

    on<CheckTime>((event, emit) async {
      emit(state.copyWith(isLoading: true));

      final res = await _bookingRepo.checkTime(
        serviceId: state.selectMasters.values
            .map((e) => e.serviceMaster?.id ?? 0)
            .toList(),
        start: event.startTime,
      );
      res.fold((l) async {
        emit(
          state.copyWith(
              isLoading: false,
              listDate: l.data ?? [],
              selectDateTime: DateTime.now()),
        );
      }, (r) {
        emit(state.copyWith(isLoading: false));
        AppHelper.errorSnackBar(context: event.context, message: r);
      });
    });

    on<SelectPaymentId>((event, emit) {
      emit(state.copyWith(selectPayment: event.id));
    });

    on<SelectBookingTime>((event, emit) {
      emit(state.copyWith(selectBookTime: event.time));
    });

    on<SelectDateTime>((event, emit) {
      emit(state.copyWith(selectDateTime: event.selectDateTime));
    });

    on<SetServices>((event, emit) async {
      emit(state.copyWith(selectServices: event.services));
      if (event.master != null) {
        final res =
            await _bookingRepo.getServiceOfMasters(masterId: event.master?.id);

        res.fold((l) {
          Map<int, MasterModel> selectMasters = {};
          for (var element in event.services) {
            final serviceOfMaster = l.data?.firstWhere(
                (e) => e.serviceId == element.id,
                orElse: () => ServiceOfMaster());
            if (serviceOfMaster != null) {
              final service = event.master?.serviceMaster?.service
                  ?.copyWith(type: serviceOfMaster.type);

              final serviceMaster = event.master?.serviceMaster
                  ?.copyWith(id: serviceOfMaster.id, service: service);

              selectMasters[element.id ?? 0] =
                  event.master?.copyWith(serviceMaster: serviceMaster) ??
                      MasterModel();
            }
          }
          emit(state.copyWith(selectMasters: selectMasters));
        }, (r) {});
      }
    });

    on<SelectMaster>((event, emit) {
      Map<int, MasterModel> maps = Map.from(state.selectMasters);

      maps.addAll({event.serviceId ?? 0: event.master ?? MasterModel()});
      emit(state.copyWith(selectMasters: maps));
    });

    on<SetGiftCart>((event, emit) {
      emit(state.copyWith(giftCart: event.giftCart));
    });

    on<SaveForm>((event, emit) async {
      emit(state.copyWith(isButtonLoading: true));
      List<FormOptionsData?> forms = List.from(state.upcoming.map((e) => e.address?.forms));
      List<int> ids = forms.map((e) => e?.id ?? 0).toList();
      ids.sort();
      int index = AppHelper.searchIndex(ids, event.form?.id ?? 0);
      if(index != -1) {
        forms.removeAt(index);
        forms.insert(index, event.form);
      }else{
        forms.add(event.form);
      }

      final res = await _bookingRepo.saveForm(form: forms, id: state.upcoming.first.id ?? 0);
      res.fold((l)  {
        emit(state.copyWith(isButtonLoading: false));
        event.onSuccess?.call();
      }, (r) {
        emit(state.copyWith(isButtonLoading: false));
        AppHelper.errorSnackBar(context: event.context, message: r);
      });
    });

  }
}
