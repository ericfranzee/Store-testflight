import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibeauty/application/checkout/checkout_bloc.dart';
import 'package:ibeauty/domain/model/response/user_address_response.dart';
import 'package:ibeauty/domain/service/helper.dart';
import 'package:ibeauty/domain/service/tr_keys.dart';
import 'package:ibeauty/presentation/components/button/animation_button_effect.dart';
import 'package:ibeauty/presentation/components/loading.dart';
import 'package:ibeauty/presentation/pages/checkout/widget/address_item.dart';
import 'package:ibeauty/presentation/route/app_route.dart';
import 'package:ibeauty/presentation/style/style.dart';
import 'package:ibeauty/presentation/style/theme/theme.dart';

import '../../components/button/custom_button.dart';

class DeliveredScreen extends StatelessWidget {
  final CustomColorSet colors;
  final List<UserAddress> listAddress;
  final bool isLoading;
  final int selectAddress;

  const DeliveredScreen(
      {super.key,
      required this.colors,
      required this.listAddress,
      required this.isLoading,
      required this.selectAddress});

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const Loading()
        : ListView(
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.only(right: 16.r, left: 16, bottom: 100.r),
            shrinkWrap: true,
            children: [
              24.verticalSpace,
              if (listAddress.isNotEmpty)
                Row(
                  children: [
                    Text(
                      AppHelper.getTrn(TrKeys.addressBilling),
                      style: CustomStyle.interNormal(
                        color: colors.textBlack,
                      ),
                    ),
                    const Spacer(),
                    ButtonEffectAnimation(
                      onTap: () async {
                        await AppRoute.goAddEditAddress(context: context);
                        if (context.mounted) {
                          context.read<CheckoutBloc>().add(
                              CheckoutEvent.fetchUserAddress(
                                  context: context, isRefresh: true));
                        }
                      },
                      child: Text(
                        AppHelper.getTrn(TrKeys.addAddress),
                        style: CustomStyle.interRegular(
                            color: colors.primary, size: 14),
                      ),
                    ),
                  ],
                ),
              24.verticalSpace,
              if (listAddress.isEmpty)
                Column(
                  children: [
                    Text(
                      AppHelper.getTrn(TrKeys.thereAreNoYourDelivery),
                      style: CustomStyle.interNoSemi(
                          color: colors.textBlack, size: 16),
                      textAlign: TextAlign.center,
                    ),
                    16.verticalSpace,
                    CustomButton(
                        title: AppHelper.getTrn(TrKeys.addAddress),
                        bgColor: colors.primary,
                        titleColor: colors.white,
                        onTap: () async {
                          await AppRoute.goAddEditAddress(context: context);
                          if (context.mounted) {
                            context.read<CheckoutBloc>().add(
                                CheckoutEvent.fetchUserAddress(
                                    context: context, isRefresh: true));
                          }
                        })
                  ],
                ),
              ListView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: listAddress.length,
                  itemBuilder: (context, index) {
                    return AddressItem(
                      colors: colors,
                      address: listAddress[index],
                      active: selectAddress == index,
                      onTap: () {
                        context
                            .read<CheckoutBloc>()
                            .add(CheckoutEvent.selectAddress(index: index));
                      },
                      delete: () {
                        context.read<CheckoutBloc>().add(
                            CheckoutEvent.deleteAddress(
                                index: index,
                                context: context,
                                addressId: listAddress[index].id ?? 0));
                      },
                      edit: () async {
                        await AppRoute.goAddEditAddress(
                            context: context, address: listAddress[index]);
                        if (context.mounted) {
                          context.read<CheckoutBloc>().add(
                              CheckoutEvent.fetchUserAddress(
                                  context: context, isRefresh: true));
                        }
                      },
                    );
                  })
            ],
          );
  }
}
