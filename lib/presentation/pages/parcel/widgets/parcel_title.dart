import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibeauty/domain/model/model/parcel_order_model.dart';
import 'package:ibeauty/domain/service/helper.dart';
import 'package:ibeauty/domain/service/time_service.dart';
import 'package:ibeauty/presentation/style/theme/theme.dart';

import '../../../style/style.dart';

class ParcelTitle extends StatelessWidget {
  final ParcelOrder? parcel;
  final CustomColorSet colors;

  const ParcelTitle({super.key, required this.parcel, required this.colors});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              "#${parcel?.id ?? 0}",
              style: CustomStyle.interBold(color: colors.textBlack, size: 20),
            ),
            10.horizontalSpace,
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100.r),
                  color: colors.primary),
              padding: EdgeInsets.symmetric(vertical: 4.r, horizontal: 10.r),
              child: Text(
                parcel?.status ?? "",
                style: CustomStyle.interNormal(color: colors.white, size: 12),
              ),
            )
          ],
        ),
        16.verticalSpace,
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20.r, vertical: 18.r),
          decoration: BoxDecoration(
              color: colors.backgroundColor,
              borderRadius: BorderRadius.circular(16.r)),
          child: Row(
            children: [
              Text(
                AppHelper.numberFormat(number: parcel?.totalPrice),
                style: CustomStyle.interSemi(color: colors.textBlack, size: 14),
              ),
              const Spacer(),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 8.r),
                width: 4.r,
                height: 4.r,
                decoration: BoxDecoration(
                    color: colors.textBlack, shape: BoxShape.circle),
              ),
              const Spacer(),
              Text(
                parcel?.type?.type ?? "",
                style: CustomStyle.interSemi(color: colors.textBlack, size: 14),
              ),
              const Spacer(),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 8.r),
                width: 4.r,
                height: 4.r,
                decoration: BoxDecoration(
                    color: colors.textBlack, shape: BoxShape.circle),
              ),
              const Spacer(),
              Text(
                TimeService.dateFormatMDYHm(parcel?.deliveryDate),
                style: CustomStyle.interSemi(
                    color: colors.textBlack,
                    size: ((parcel?.totalPrice.toString().length ?? 0) +
                                (parcel?.type?.type ?? "").length) >=
                            14
                        ? 10
                        : 14),
              ),
            ],
          ),
        )
      ],
    );
  }
}
