// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:bloc/bloc.dart';
import 'package:google_place/google_place.dart';
import 'package:ibeauty/domain/di/dependency_manager.dart';

// import 'package:google_place/google_place.dart';
import 'package:ibeauty/domain/interface/address.dart';
import 'package:ibeauty/domain/model/model/country_model.dart';
import 'package:ibeauty/domain/model/model/location_model.dart';
import 'package:ibeauty/domain/model/response/city_pagination_response.dart';
import 'package:ibeauty/domain/model/response/user_address_response.dart';
import 'package:ibeauty/domain/service/helper.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

part 'address_event.dart';

part 'address_state.dart';

part 'address_bloc.freezed.dart';

class AddressBloc extends Bloc<AddressEvent, AddressState> {
  final AddressInterface _addressRepo;

  AddressBloc(this._addressRepo) : super(const AddressState()) {
    int page = 0;
    int city = 0;

    on<SelectAddress>((event, emit) async {
      emit(state.copyWith(selectAddress: event.index));
    });

    on<EditAddress>((event, emit) async {
      emit(state.copyWith(isButtonLoading: true));
      final res = await _addressRepo.editUserAddress(
        firstName: event.firstName ?? "",
        lastName: event.lastName ?? "",
        phone: event.phone ?? "",
        zipcode: event.zipcode ?? "",
        city: event.city ?? "",
        detail: event.detail ?? "",
        homeNumber: event.homeNumber ?? "",
        addressId: event.addressId ?? 0,
        locationModel: event.locationModel
      );
      res.fold((l) {
        return event.onSuccess?.call();
      }, (r) => AppHelper.errorSnackBar(context: event.context, message: r));
      emit(state.copyWith(isButtonLoading: false));
    });

    on<AddAddress>((event, emit) async {
      emit(state.copyWith(isButtonLoading: true));
      final res = await _addressRepo.addUserAddress(
          firstName: event.firstName ?? "",
          lastName: event.lastName ?? "",
          phone: event.phone ?? "",
          zipcode: event.zipcode ?? "",
          city: event.city ?? "",
          detail: event.detail ?? "",
          homeNumber: event.homeNumber ?? "",
          locationModel: event.locationModel);
      res.fold((l) {
        return event.onSuccess?.call();
      }, (r) => AppHelper.errorSnackBar(context: event.context, message: r));
      emit(state.copyWith(isButtonLoading: false));
    });

    on<FetchUserAddress>((event, emit) async {
      if (event.isRefresh ?? false) {
        event.controller?.resetNoData();
        page = 0;
        emit(state.copyWith(address: [], isLoading: true));
      }
      final res = await _addressRepo.getUserAddress(page: ++page);
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

    on<SearchAddress>((event, emit) async {
      final res = await googlePlace.autocomplete
          .get(event.search ?? "", components: [Component("country", "gb")]);
      emit(state.copyWith(autoTitles: res?.predictions ?? []));
    });

    on<FetchCountry>((event, emit) async {
      if (event.isRefresh ?? false) {
        event.controller?.resetNoData();
        page = 0;
        emit(state.copyWith(countries: [], isLoading: true));
      }
      final res = await _addressRepo.getCountry(page: ++page);
      res.fold((l) {
        List<CountryModel> list = List.from(state.countries);
        list.addAll(l.data ?? []);
        emit(state.copyWith(isLoading: false, countries: list));
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
        AppHelper.errorSnackBar(context: event.context, message: r);
      });
    });

    on<SearchCountry>((event, emit) async {
      final res = await _addressRepo.searchCountry(search: event.search ?? "");
      res.fold((l) {
        emit(state.copyWith(countries: l.data ?? []));
      }, (r) {
        AppHelper.errorSnackBar(context: event.context, message: r);
      });
    });

    on<FetchCity>((event, emit) async {
      if (event.isRefresh ?? false) {
        event.controller?.resetNoData();
        city = 0;
        emit(state.copyWith(cities: [], isCityLoading: true));
      }
      final res =
          await _addressRepo.getCity(page: ++city, countyId: event.countyId);
      res.fold((l) {
        List<CityModel> list = List.from(state.cities);
        list.addAll(l.data ?? []);
        emit(state.copyWith(isCityLoading: false, cities: list));
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
        emit(state.copyWith(isCityLoading: false));
        if (event.isRefresh ?? false) {
          event.controller?.refreshFailed();

        }
        event.controller?.loadFailed();

        AppHelper.errorSnackBar(context: event.context, message: r);
      });
    });

    on<SearchCity>((event, emit) async {
      final res = await _addressRepo.searchCity(
          search: event.search ?? "", countyId: event.countyId);
      res.fold((l) {
        emit(state.copyWith(cities: l.data ?? []));
      }, (r) {
        AppHelper.errorSnackBar(context: event.context, message: r);
      });
    });
  }
}
