import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibeauty/application/become_seller/become_seller_bloc.dart';
import 'package:ibeauty/domain/service/helper.dart';
import 'package:ibeauty/domain/service/tr_keys.dart';
import 'package:ibeauty/domain/service/validators.dart';
import 'package:ibeauty/presentation/components/custom_textformfield.dart';
import 'package:ibeauty/presentation/style/style.dart';
import 'package:ibeauty/presentation/style/theme/theme.dart';

class DeliveryInfo extends StatelessWidget {
  final List<String> types;
  final CustomColorSet colors;
  final TextEditingController deliveryFrom;
  final TextEditingController deliveryTo;

  const DeliveryInfo(
      {super.key,
      required this.colors,
      required this.types,
      required this.deliveryFrom,
      required this.deliveryTo});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppHelper.getTrn(TrKeys.deliveryInfo),
          style: CustomStyle.interNormal(color: colors.textBlack),
        ),
        16.verticalSpace,
        DropdownButtonFormField<String>(
          value: types.first,
          items: types
              .map(
                (e) => DropdownMenuItem<String>(
                  value: e,
                  child: Text(
                    AppHelper.getTrn(e),
                  ),
                ),
              )
              .toList(),
          onChanged: (s) {
            if (s != null) {
              context
                  .read<BecomeSellerBloc>()
                  .add(BecomeSellerEvent.setDeliveryType(type: s));
            }
          },
          style: CustomStyle.interNormal(color: colors.textBlack),
          dropdownColor: colors.backgroundColor,
          decoration: InputDecoration(
            labelText: AppHelper.getTrn(TrKeys.deliveryTimeType),
            labelStyle: CustomStyle.interNormal(
              size: 14.sp,
              color: CustomStyle.textHint,
            ),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            fillColor: colors.transparent,
            filled: false,
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide.merge(
                    const BorderSide(color: CustomStyle.icon),
                    const BorderSide(color: CustomStyle.icon)),
                borderRadius: BorderRadius.circular(16.r)),
            errorBorder: OutlineInputBorder(
                borderSide: BorderSide.merge(
                    const BorderSide(color: CustomStyle.icon),
                    const BorderSide(color: CustomStyle.icon)),
                borderRadius: BorderRadius.circular(16.r)),
            border: OutlineInputBorder(
                borderSide: BorderSide.merge(
                    const BorderSide(color: CustomStyle.icon),
                    const BorderSide(color: CustomStyle.icon)),
                borderRadius: BorderRadius.circular(16.r)),
            focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide.merge(
                    const BorderSide(color: CustomStyle.icon),
                    const BorderSide(color: CustomStyle.icon)),
                borderRadius: BorderRadius.circular(16.r)),
            disabledBorder: OutlineInputBorder(
                borderSide: BorderSide.merge(
                    const BorderSide(color: CustomStyle.icon),
                    const BorderSide(color: CustomStyle.icon)),
                borderRadius: BorderRadius.circular(16.r)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide.merge(
                    const BorderSide(color: CustomStyle.icon),
                    const BorderSide(color: CustomStyle.icon)),
                borderRadius: BorderRadius.circular(16.r)),
          ),
        ),
        16.verticalSpace,
        Row(
          children: [
            Expanded(
              child: CustomTextFormField(
                hint: AppHelper.getTrn(TrKeys.deliveryTimeFrom),
                controller: deliveryFrom,
                validation: AppValidators.isNumberValidator,
                inputType: TextInputType.number,
              ),
            ),
            16.horizontalSpace,
            Expanded(
              child: CustomTextFormField(
                hint: AppHelper.getTrn(TrKeys.deliveryTimeTo),
                controller: deliveryTo,
                validation: AppValidators.isNumberValidator,
                inputType: TextInputType.number,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
