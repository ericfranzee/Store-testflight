// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibeauty/application/booking/booking_bloc.dart';
import 'package:ibeauty/application/gift_cart/gift_cart_bloc.dart';
import 'package:ibeauty/application/map/map_bloc.dart';
import 'package:ibeauty/application/membership/membership_bloc.dart';
import 'package:ibeauty/domain/model/model/location_model.dart';
import 'package:ibeauty/domain/model/model/master_model.dart';
import 'package:ibeauty/domain/model/response/booking_calculate_response.dart';
import 'package:ibeauty/domain/service/helper.dart';
import 'package:ibeauty/domain/service/tr_keys.dart';
import 'package:ibeauty/infrastructure/local_storage/local_storage.dart';
import 'package:ibeauty/presentation/components/button/animation_button_effect.dart';
import 'package:ibeauty/presentation/components/button/custom_button.dart';
import 'package:ibeauty/presentation/components/button/pop_button.dart';
import 'package:ibeauty/presentation/components/custom_scaffold.dart';
import 'package:ibeauty/presentation/components/custom_textformfield.dart';
import 'package:ibeauty/presentation/components/keyboard_dismisser.dart';
import 'package:ibeauty/presentation/components/price_item.dart';
import 'package:ibeauty/presentation/pages/map/map_page.dart';
import 'package:ibeauty/presentation/route/app_route_service.dart';
import 'package:ibeauty/presentation/style/style.dart';

import '../../components/loading.dart';
import 'package:ibeauty/presentation/style/theme/theme.dart';

class AddNotePage extends StatelessWidget {
  final DateTime startTime;

  const AddNotePage({super.key, required this.startTime});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: (colors) => CustomScaffold(
        body: (colors) => KeyboardDismisser(
          isLtr: LocalStorage.getLangLtr(),
          child: SafeArea(
            bottom: false,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.r),
                  child: Text(
                    AppHelper.getTrn(TrKeys.optionalNotes),
                    style: CustomStyle.interNoSemi(
                        color: colors.textBlack, size: 22),
                  ),
                ),
                Expanded(
                  child: BlocBuilder<BookingBloc, BookingState>(
                    builder: (context, state) {
                      return ListView(
                        shrinkWrap: true,
                        padding: EdgeInsets.only(bottom: 116.r),
                        children: [
                          _services(
                              colors: colors,
                              selectMasters: state.selectMasters,
                              calculate: state.calculate?.data),
                          _calculate(
                            colors: colors,
                            state: state,
                          ),
                        ],
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
        floatingButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingButton: (colors) => _bottom(colors),
      ),
    );
  }

  Widget _services(
      {required CustomColorSet colors,
      required Map<int, MasterModel> selectMasters,
      required Calculate? calculate}) {
    return ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.symmetric(vertical: 24.r, horizontal: 16.r),
        shrinkWrap: true,
        itemCount: selectMasters.length,
        itemBuilder: (context, index) {
          final selectMaster = selectMasters.values.elementAt(index);
          final Item? item = calculate?.items?.firstWhere(
              (element) =>
                  element.serviceMaster?.service?.id ==
                  selectMasters.keys.elementAt(index),
              orElse: () => Item());
          return _serviceItem(
              selectMaster: selectMaster,
              colors: colors,
              context: context,
              item: item);
        });
  }

  Widget _calculate(
      {required CustomColorSet colors, required BookingState state}) {
    return state.isLoading
        ? const Loading()
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BlocBuilder<GiftCartBloc, GiftCartState>(
                builder: (context, stateGift) {
                  return stateGift.myGiftCarts.isNotEmpty
                      ? Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.r),
                          child: ButtonEffectAnimation(
                            onTap: () {
                              AppRouteService.goSelectGiftCart(
                                context: context,
                                colors: colors,
                                startTime: startTime,
                                shopId: state.selectMasters.values.first.invite
                                        ?.shopId ??
                                    0,
                              );
                            },
                            child: Container(
                              width: double.infinity,
                              padding: EdgeInsets.symmetric(
                                  vertical: 16.r, horizontal: 16.r),
                              decoration: BoxDecoration(
                                border: Border.all(color: colors.icon),
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                              child: Text(
                                state.giftCart == null
                                    ? AppHelper.getTrn(TrKeys.selectGiftCart)
                                    : (state.giftCart?.giftCart?.translation
                                            ?.title ??
                                        ""),
                                style: CustomStyle.interNormal(
                                    color: state.giftCart == null
                                        ? colors.textHint
                                        : colors.textBlack),
                              ),
                            ),
                          ),
                        )
                      : const SizedBox.shrink();
                },
              ),
              PriceItem(
                title: TrKeys.subtotal,
                price: state.calculate?.data?.price,
                colors: colors,
              ),
              PriceItem(
                title: TrKeys.commissionFee,
                price: state.calculate?.data?.totalCommissionFee,
                colors: colors,
              ),
              PriceItem(
                title: TrKeys.serviceFee,
                price: state.calculate?.data?.totalServiceFee,
                colors: colors,
              ),
              PriceItem(
                title: TrKeys.discount,
                price: state.calculate?.data?.totalDiscount,
                colors: colors,
                discount: true,
              ),
              PriceItem(
                title: TrKeys.giftCart,
                price: state.calculate?.data?.totalGiftCartPrice,
                colors: colors,
                discount: true,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  16.verticalSpace,
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.r),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          AppHelper.getTrn(TrKeys.total),
                          style: CustomStyle.interNormal(
                              color: colors.textBlack, size: 16),
                        ),
                        Text(
                          AppHelper.numberFormat(
                              number: state.calculate?.data?.totalPrice),
                          style: CustomStyle.interNormal(
                              color: colors.textBlack, size: 16),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          );
  }

  Widget _serviceItem(
      {required MasterModel selectMaster,
      required CustomColorSet colors,
      required BuildContext context,
      required Item? item}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        24.verticalSpace,
        Row(
          children: [
            Text(
              item?.serviceMaster?.service?.translation?.title ?? "",
              style: CustomStyle.interNormal(color: colors.textBlack),
            ),
            const Spacer(),
            Column(
              children: [
                if (!(item?.giftCartPrice == null || item?.giftCartPrice == 0))
                  Text(
                    AppHelper.numberFormat(
                        number: (item?.giftCartPrice ?? 0) +
                            (item?.totalPrice ?? 0)),
                    style:
                        CustomStyle.interNormal(color: colors.error, size: 12,textDecoration: TextDecoration.lineThrough),
                  ),
                Text(
                  AppHelper.numberFormat(number: item?.totalPrice),
                  style: CustomStyle.interNoSemi(
                      color: colors.textBlack, size: 18),
                ),
              ],
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(top: 4.r),
          child: Text(
            item?.errors?.toList().join(", ") ?? "",
            style: CustomStyle.interNormal(color: colors.error, size: 12),
          ),
        ),
        8.verticalSpace,
        CustomTextFormField(
          hint: AppHelper.getTrn(TrKeys.notesAndSpecial),
          onChanged: (text) {
            context.read<BookingBloc>().add(
                  BookingEvent.selectMaster(
                    serviceId: item?.serviceMaster?.service?.id,
                    master: selectMaster.copyWith(note: text),
                  ),
                );
          },
        ),
        if (selectMaster.serviceMaster?.type == TrKeys.offlineOut)
          Padding(
            padding: EdgeInsets.only(top: 8.r),
            child: ButtonEffectAnimation(
              onTap: () async {
                final data = await Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => BlocProvider(
                      create: (context) => MapBloc(),
                      child: MapPage(
                          location: LocationModel(
                              latitude: selectMaster.lat.toString(),
                              longitude: selectMaster.long.toString())),
                    ),
                  ),
                );
                context.read<BookingBloc>().add(
                      BookingEvent.selectMaster(
                        serviceId: item?.serviceMaster?.service?.id,
                        master: selectMaster.copyWith(
                          address: (data as LocationModel).address ?? "",
                          lat: double.parse(data.latitude ?? "0"),
                          long: double.parse(data.longitude ?? "0"),
                        ),
                      ),
                    );
              },
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 16.r, horizontal: 16.r),
                decoration: BoxDecoration(
                  border: Border.all(color: colors.icon),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Text(
                  selectMaster.address == null
                      ? AppHelper.getTrn(TrKeys.address)
                      : (selectMaster.address ?? ""),
                  style: CustomStyle.interNormal(
                      color: selectMaster.address == null
                          ? colors.textHint
                          : colors.textBlack),
                ),
              ),
            ),
          ),
        BlocBuilder<MembershipBloc, MembershipState>(
          builder: (context, state) {
            return state.myMemberships.isNotEmpty
                ? Padding(
                    padding: EdgeInsets.only(top: 8.r),
                    child: ButtonEffectAnimation(
                      onTap: () {
                        AppRouteService.goSelectMemberships(
                            context: context,
                            colors: colors,
                            startTime: startTime,
                            serviceId: selectMaster.serviceMaster?.service?.id,
                            shopId: selectMaster.invite?.shopId ?? 0,
                            selectMaster: selectMaster);
                      },
                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(
                            vertical: 16.r, horizontal: 16.r),
                        decoration: BoxDecoration(
                          border: Border.all(color: colors.icon),
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: Text(
                          selectMaster.membership == null
                              ? AppHelper.getTrn(TrKeys.selectMembership)
                              : (selectMaster.membership?.memberShip
                                      ?.translation?.title ??
                                  ""),
                          style: CustomStyle.interNormal(
                              color: selectMaster.membership == null
                                  ? colors.textHint
                                  : colors.textBlack),
                        ),
                      ),
                    ),
                  )
                : const SizedBox.shrink();
          },
        ),
      ],
    );
  }

  Widget _bottom(CustomColorSet colors) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.r),
      child: Row(
        children: [
          PopButton(colors: colors),
          10.horizontalSpace,
          BlocBuilder<BookingBloc, BookingState>(
            builder: (context, state) {
              bool showButton = true;
              state.calculate?.data?.items?.forEach((element) {
                if (element.errors?.isNotEmpty ?? false) {
                  showButton = false;
                }
              });
              return showButton
                  ? Expanded(
                      child: SizedBox(
                        height: 56.r,
                        child: BlocBuilder<BookingBloc, BookingState>(
                          builder: (context, state) {
                            return CustomButton(
                                title: AppHelper.getTrn(TrKeys.next),
                                bgColor: colors.primary,
                                titleColor: colors.textWhite,
                                onTap: () {
                                  for (var element
                                      in state.selectMasters.values) {
                                    if (element.address == null &&
                                        element.serviceMaster?.type ==
                                            TrKeys.offlineOut) {
                                      AppHelper.openDialog(
                                          context: context,
                                          title: AppHelper.getTrn(
                                              TrKeys.youMustEnterAddress));
                                      return;
                                    }
                                  }

                                  AppRouteService.goPaymentBottomSheet(
                                      startTime: startTime,
                                      context: context,
                                      serviceMasters:
                                          state.selectMasters.values.toList(),
                                      colors: colors,
                                      totalPrice:
                                          state.calculate?.data?.totalPrice);
                                });
                          },
                        ),
                      ),
                    )
                  : const SizedBox.shrink();
            },
          )
        ],
      ),
    );
  }
}
