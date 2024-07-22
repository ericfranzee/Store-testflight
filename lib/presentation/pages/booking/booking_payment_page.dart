import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibeauty/application/booking/booking_bloc.dart';
import 'package:ibeauty/domain/model/model/master_model.dart';
import 'package:ibeauty/domain/service/helper.dart';
import 'package:ibeauty/domain/service/tr_keys.dart';
import 'package:ibeauty/infrastructure/local_storage/local_storage.dart';
import 'package:ibeauty/presentation/components/button/custom_button.dart';
import 'package:ibeauty/presentation/components/keyboard_dismisser.dart';
import 'package:ibeauty/presentation/components/loading.dart';
import 'package:ibeauty/presentation/route/app_route_service.dart';
import 'package:ibeauty/presentation/style/style.dart';
import 'package:ibeauty/presentation/style/theme/theme.dart';

class BookingPaymentBottomSheet extends StatelessWidget {
  final CustomColorSet colors;
  final List<MasterModel>? serviceMasters;
  final num? totalPrice;
  final ScrollController controller;
  final DateTime startTime;

  const BookingPaymentBottomSheet(
      {super.key,
      required this.colors,
      required this.controller,
      this.serviceMasters,
      required this.startTime,
      required this.totalPrice});

  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
      isLtr: LocalStorage.getLangLtr(),
      child: Container(
        width: MediaQuery.sizeOf(context).width,
        height: 400,
        decoration: BoxDecoration(
          color: colors.newBoxColor,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(24.r),
            topLeft: Radius.circular(24.r),
          ),
        ),
        padding: EdgeInsets.only(
          left: 16.r,
          right: 16.r,
        ),
        child: ListView(
          controller: controller,
          children: [
            8.verticalSpace,
            Container(
              height: 4.r,
              margin: EdgeInsets.symmetric(
                  horizontal: MediaQuery.sizeOf(context).width / 2 - 48.r),
              decoration: BoxDecoration(
                  color: colors.icon,
                  borderRadius: BorderRadius.circular(100.r)),
            ),
            16.verticalSpace,
            Text(
              AppHelper.getTrn(TrKeys.payment),
              style: CustomStyle.interNoSemi(color: colors.textBlack, size: 22),
            ),
            16.verticalSpace,
            Text(
              AppHelper.getTrn(TrKeys.ifYouNeed),
              style:
                  CustomStyle.interRegular(color: colors.textBlack, size: 14),
            ),
            16.verticalSpace,
            BlocBuilder<BookingBloc, BookingState>(
              builder: (context, state) {
                return state.isPaymentLoading
                    ? const Loading()
                    : ListView.builder(
                        reverse: true,
                        padding: EdgeInsets.zero,
                        itemCount: state.list?.length ?? 0,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              context.read<BookingBloc>().add(
                                  BookingEvent.selectPaymentId(
                                      id: state.list?[index].id ?? -1));
                            },
                            child: Column(
                              children: [
                                8.verticalSpace,
                                Row(
                                  children: [
                                    Icon(
                                      state.list?[index].id ==
                                              state.selectPayment
                                          ? FlutterRemix.checkbox_circle_fill
                                          : FlutterRemix
                                              .checkbox_blank_circle_line,
                                      color: state.list?[index].id ==
                                              state.selectPayment
                                          ? colors.primary
                                          : CustomStyle.black,
                                    ),
                                    10.horizontalSpace,
                                    Text(
                                      AppHelper.getTrn(
                                          state.list?[index].tag ?? ""),
                                      style: CustomStyle.interNormal(
                                        size: 14,
                                        color: colors.textBlack,
                                      ),
                                    )
                                  ],
                                ),
                                Divider(
                                  color: colors.newBoxColor,
                                ),
                                8.verticalSpace
                              ],
                            ),
                          );
                        });
              },
            ),
            16.verticalSpace,
            BlocBuilder<BookingBloc, BookingState>(
              buildWhen: (p, n) {
                return p.isButtonLoading != n.isButtonLoading;
              },
              builder: (context, state) {
                return CustomButton(
                    isLoading: state.isButtonLoading,
                    title: AppHelper.getTrn(TrKeys.confirm),
                    bgColor: colors.primary,
                    titleColor: colors.textWhite,
                    onTap: () {
                      context
                          .read<BookingBloc>()
                          .add(BookingEvent.bookingService(
                            context: context,
                            startTime: startTime,
                            totalPrice: totalPrice ?? 0,
                            onSuccess: (id) {
                              if (id == -1) {
                                AppRouteService.goConfirmPage(context);
                                return;
                              }
                              context.read<BookingBloc>().add(
                                  BookingEvent.fetchWebView(
                                      context: context, id: id));
                            },
                          ));
                    });
              },
            ),
            16.verticalSpace,
          ],
        ),
      ),
    );
  }
}
