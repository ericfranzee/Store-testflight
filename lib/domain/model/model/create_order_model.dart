import 'package:flutter/cupertino.dart';
import 'package:ibeauty/app_constants.dart';
import 'package:ibeauty/domain/model/response/cart_response.dart';
import 'package:ibeauty/domain/service/time_service.dart';
import 'package:ibeauty/infrastructure/local_storage/local_storage.dart';

class CreateOrderModel {
  final int cartId;
  final Map<int, TextEditingController>? note;
  final DeliveryTypeEnum deliveryType;
  final Map<int, String>? coupons;
  final int pointId;
  final int? addressId;
  final int deliveryPriceId;
  final int paymentId;
  final DateTime? deliveryDate;
  final List<ProductNote>? notes;

  CreateOrderModel({
    required this.paymentId,
    required this.deliveryPriceId,
    required this.cartId,
    required this.pointId,
    required this.deliveryType,
    this.coupons,
    required this.deliveryDate,
    this.note,
    this.notes,
    this.addressId,
  });

  Map toJson({bool isPayment = true}) {
    return {
      "cart_id": cartId,
      if (LocalStorage.getSelectedCurrency()?.id != null)
        "currency_id": LocalStorage.getSelectedCurrency()?.id ?? 0,
      "rate": LocalStorage.getSelectedCurrency()?.rate ?? 1,
      if (isPayment) "payment_id": paymentId,
      "delivery_type": deliveryType == DeliveryTypeEnum.delivery
          ? "delivery"
          : deliveryType == DeliveryTypeEnum.pickup
              ? "point"
              : "digital",
      if (coupons?.isNotEmpty ?? false)
        "coupon": {
          for (int i = 0; i < (coupons?.length ?? 0); i++)
            "${coupons?.keys.elementAt(i)}": "${coupons?.values.elementAt(i)}",
        },
      if (deliveryType == DeliveryTypeEnum.pickup) "delivery_point_id": pointId,
      if (deliveryType == DeliveryTypeEnum.delivery)
        "delivery_price_id": deliveryPriceId,
      "delivery_date": TimeService.dateFormatYMDHm(deliveryDate),

      'lang': LocalStorage.getLanguage()?.locale,
      if (addressId != null) "address_id": addressId,
        "notes": {
          if (notes?.isNotEmpty ?? false)
            "product": {
              for (int i = 0; i < (notes?.length ?? 0); i++)
                if(notes?[i].comment?.isNotEmpty ?? false)
                "${notes?[i].stockId}": notes?[i].comment,
            },

          if (note != null && (note?.isNotEmpty ?? false))
            "order": {
              for (int i = 0; i < (note?.length ?? 0); i++)
                if(note?.values.elementAt(i).text.isNotEmpty ?? false)
                "${note?.keys.elementAt(i)}": "${note?.values.elementAt(i).text}"
            },

        }
    };
  }
}
