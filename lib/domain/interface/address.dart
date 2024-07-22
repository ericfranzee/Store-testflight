import 'package:dartz/dartz.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ibeauty/domain/model/model/location_model.dart';
import 'package:ibeauty/domain/model/response/city_pagination_response.dart';
import 'package:ibeauty/domain/model/response/country_paginate_response.dart';
import 'package:ibeauty/domain/model/response/delivery_point_response.dart';
import 'package:ibeauty/domain/model/response/draw_routing_response.dart';
import 'package:ibeauty/domain/model/response/user_address_response.dart';

abstract class AddressInterface {

  Future<Either<DeliveryPointResponse, dynamic>> showWareHouse();


  Future<Either<CountryPaginationResponse, dynamic>> getCountry(
      {required int page});

  Future<Either<CountryPaginationResponse, dynamic>> searchCountry(
      {required String search});

  Future<Either<CityResponseModel, dynamic>> getCity(
      {required int page, required int countyId});

  Future<Either<CityResponseModel, dynamic>> searchCity(
      {required String search, required int countyId});

  Future<Either<DeliveryPointResponse, dynamic>> getDeliveryPoint(
      {required int page});

  Future<Either<DeliveryPointResponse, dynamic>> getDeliveryPrice();

  Future<Either<DrawRouting, dynamic>> getRouting({
    required LatLng start,
    required LatLng end,
  });

  Future<Either<UserAddress, dynamic>> addUserAddress({
    required String firstName,
    required String lastName,
    required String phone,
    required String zipcode,
    required String city,
    required String detail,
    required String homeNumber,
    required LocationModel? locationModel,
  });

  Future<Either<bool, dynamic>> editUserAddress({
    required String firstName,
    required String lastName,
    required String phone,
    required int addressId,
    required String zipcode,
    required String city,
    required String detail,
    required String homeNumber,
    required LocationModel? locationModel,
  });

  Future<Either<UserAddressResponse, dynamic>> getUserAddress(
      {required int page});

  Future<Either<bool, dynamic>> deleteAddress(
      {required int addressId});
}
