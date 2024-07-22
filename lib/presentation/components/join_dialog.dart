// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibeauty/domain/di/dependency_manager.dart';
import 'package:ibeauty/domain/model/model/address_model.dart';
import 'package:ibeauty/domain/service/helper.dart';
import 'package:ibeauty/domain/service/tr_keys.dart';
import 'package:ibeauty/domain/service/validators.dart';
import 'package:ibeauty/infrastructure/local_storage/local_storage.dart';
import 'package:ibeauty/presentation/components/custom_textformfield.dart';
import 'package:ibeauty/presentation/route/app_route.dart';
import 'package:ibeauty/presentation/style/style.dart';

import 'button/custom_button.dart';

class JoinDialog extends StatefulWidget {
  final String link;

  const JoinDialog({super.key, required this.link});

  @override
  State<JoinDialog> createState() => _JoinDialogState();
}

class _JoinDialogState extends State<JoinDialog> {
  late TextEditingController controller;
  final GlobalKey<FormState> form = GlobalKey();

  @override
  void initState() {
    controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        color: !LocalStorage.getMode() ? CustomStyle.bgDark : CustomStyle.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            AppHelper.getTrn(TrKeys.joinGroupOrder),
            style: CustomStyle.interNoSemi(
                color: LocalStorage.getMode()
                    ? CustomStyle.black
                    : CustomStyle.white,
                size: 24),
          ),
          8.verticalSpace,
          Text(
            AppHelper.getTrn(TrKeys.joinGroupText),
            style: CustomStyle.interNormal(
                color: LocalStorage.getMode()
                    ? CustomStyle.black
                    : CustomStyle.white),
          ),
          16.verticalSpace,
          Form(
            key: form,
            child: CustomTextFormField(
              hint: AppHelper.getTrn(TrKeys.firstName),
              controller: controller,
              validation: AppValidators.isNotEmptyValidator,
            ),
          ),
          16.verticalSpace,
          Row(
            children: [
              Expanded(
                child: CustomButton(
                    title: AppHelper.getTrn(TrKeys.cancel),
                    bgColor: LocalStorage.getMode()
                        ? CustomStyle.black
                        : CustomStyle.white,
                    titleColor: LocalStorage.getMode()
                        ? CustomStyle.white
                        : CustomStyle.black,
                    onTap: () {
                      Navigator.pop(context);
                    }),
              ),
              16.horizontalSpace,
              Expanded(
                child: CustomButton(
                    title: AppHelper.getTrn(TrKeys.join),
                    bgColor: CustomStyle.primary,
                    titleColor: CustomStyle.white,
                    onTap: () async {
                      if(form.currentState?.validate() ?? false){
                        final cartId = widget.link.substring(
                            widget.link.indexOf("cart_id") + 8,
                            widget.link.indexOf("&"));
                        String country =
                        widget.link.substring(widget.link.indexOf("&") + 1);
                        final countryId = country.substring(
                            country.indexOf("country_id") + 11,
                            country.indexOf("&"));
                        String city = country.substring(country.indexOf("&") + 1);
                        final cityId = city.substring(
                            city.indexOf("city_id") + 8, city.indexOf("&"));
                        String region = city.substring(city.indexOf("&") + 1);
                        final regionId = region.substring(
                            region.indexOf("region_id") + 10,
                            region.indexOf("&"));
                        LocalStorage.setAddress(
                          AddressModel(
                            cityId: int.tryParse(cityId),
                            countryId: int.tryParse(countryId),
                            regionId: int.tryParse(regionId),
                          ),
                        );
                       await cartRepository.joinGroupOrder(
                            cartId: int.tryParse(cartId) ?? 0, name: controller.text, context: context);
                       AppRoute.goMain(context);
                      }

                    }),
              ),
            ],
          )
        ],
      ),
    );
  }
}
