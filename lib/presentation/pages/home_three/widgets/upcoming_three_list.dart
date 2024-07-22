import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibeauty/app_constants.dart';
import 'package:ibeauty/application/booking/booking_bloc.dart';
import 'package:ibeauty/domain/service/helper.dart';
import 'package:ibeauty/domain/service/time_service.dart';
import 'package:ibeauty/domain/service/tr_keys.dart';
import 'package:ibeauty/presentation/components/button/animation_button_effect.dart';
import 'package:ibeauty/presentation/components/custom_network_image.dart';
import 'package:ibeauty/presentation/components/title.dart';
import 'package:ibeauty/presentation/route/app_route_service.dart';
import 'package:ibeauty/presentation/style/style.dart';
import 'package:ibeauty/presentation/style/theme/theme.dart';

class UpComingThreeList extends StatelessWidget {
  final CustomColorSet colors;

  const UpComingThreeList({super.key, required this.colors});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookingBloc, BookingState>(
      builder: (context, state) {
        return state.upcoming.isNotEmpty
            ? Column(
                children: [
                  TitleWidget(
                    title: AppHelper.getTrn(TrKeys.upcomingAppointments),
                    titleColor: colors.textBlack,
                  ),
                  16.verticalSpace,
                  SizedBox(
                    height: 144.r,
                    child: PageView.builder(
                        itemCount: state.upcoming.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return _bookingItem(index, state, context);
                        }),
                  ),
                ],
              )
            : const SizedBox.shrink();
      },
    );
  }

  Widget _bookingItem(int index, BookingState state, BuildContext context) {
    return ButtonEffectAnimation(
      onTap: () {
        AppRouteService.goBookingPage(
            context: context,
            shop: state.upcoming[index].shop,
            id: state.upcoming[index].id ?? 0);
      },
      child: Container(
        padding: EdgeInsets.all(16.r),
        margin: EdgeInsets.symmetric(horizontal: 16.r),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r), color: colors.textWhite),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CustomNetworkImage(
                  url: state.upcoming[index].shop?.logoImg,
                  height: 60,
                  width: 60,
                  radius: 30,
                ),
                14.horizontalSpace,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      state.upcoming[index].shop?.translation?.title ?? "",
                      style: CustomStyle.interNormal(
                          color: colors.textBlack, size: 20),
                    ),
                    Text(
                      AppHelper.numberFormat(
                          number: state.upcoming[index].totalPriceByParent),
                      style: CustomStyle.interNormal(
                          color: colors.textBlack, size: 14),
                    )
                  ],
                )
              ],
            ),
            const Spacer(),
            Container(
              padding: EdgeInsets.symmetric(vertical: 8.r, horizontal: 10.r),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6.r),
                  color: AppConstants.serviceColors[11 - index % 11]),
              child: Text(
                "${TimeService.dateFormatWDM(state.upcoming[index].startDate)} | ${TimeService.dateFormatHM(state.upcoming[index].startDate)} - ${TimeService.dateFormatHM(state.upcoming[index].endDate)}",
                style: CustomStyle.interNormal(
                    color: colors.textBlack, size: 14),
              ),
            )
          ],
        ),
      ),
    );
  }
}
