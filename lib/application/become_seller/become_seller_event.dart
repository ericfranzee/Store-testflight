part of 'become_seller_bloc.dart';

@freezed
abstract class BecomeSellerEvent with _$BecomeSellerEvent {
  const factory BecomeSellerEvent.updateLogoPath({required String? imagePath}) =
      UpdateLogoPath;

  const factory BecomeSellerEvent.updateBgPath({required String? imagePath}) =
      UpdateBgPath;

  const factory BecomeSellerEvent.setDeliveryType({required String? type}) =
  SetDeliveryType;

  const factory BecomeSellerEvent.createShop({
    required BuildContext context,
    required String shopName,
    required String description,
    required String phone,
    required String deliveryTo,
    required String deliveryFrom,
    required String minAmount,
    required String tax,
    required LocationModel? location,
  }) = CreateShop;
}
