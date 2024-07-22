import 'package:add_2_calendar/add_2_calendar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibeauty/application/booking/booking_bloc.dart';
import 'package:ibeauty/domain/model/response/booking_response.dart';
import 'package:ibeauty/domain/service/helper.dart';
import 'package:ibeauty/domain/service/time_service.dart';
import 'package:ibeauty/domain/service/tr_keys.dart';
import 'package:ibeauty/presentation/components/custom_network_image.dart';
import 'package:ibeauty/presentation/pages/booking/widget/cancel_screen.dart';
import 'package:ibeauty/presentation/route/app_route_service.dart';
import 'package:ibeauty/presentation/style/style.dart';
import 'package:ibeauty/presentation/style/theme/theme.dart';

class BookingItem extends StatelessWidget {
  final BookingModel book;
  final CustomColorSet colors;
  final bool past;

  const BookingItem(
      {super.key, required this.book, required this.colors, this.past = false});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        AppRouteService.goBookingPage(
            context: context, shop: book.shop, id: book.id ?? 0);
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 10.r),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            border: Border.all(color: colors.icon)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 24.r, bottom: 24.r, left: 16.r),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: colors.icon),
                        shape: BoxShape.circle),
                    child: CustomNetworkImage(
                      url: book.shop?.logoImg ?? "",
                      height: 60,
                      width: 60,
                      radius: 30,
                    ),
                  ),
                  10.horizontalSpace,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: MediaQuery.sizeOf(context).width - 200.r,
                        child: Text(
                          book.shop?.translation?.title ?? "",
                          style: CustomStyle.interNoSemi(
                              color: colors.textBlack, size: 20),
                        ),
                      ),
                      10.verticalSpace,
                      Text(
                        TimeService.dateFormatMDYHm(book.startDate),
                        style: CustomStyle.interNormal(
                            color: colors.textHint, size: 14),
                      ),
                    ],
                  )
                ],
              ),
            ),
            const Spacer(),
            _popupMenu(),
          ],
        ),
      ),
    );
  }

  PopupMenuButton<dynamic> _popupMenu() {
    return PopupMenuButton(
      offset: const Offset(0, 32),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10.r),
        ),
      ),
      itemBuilder: (context) {
        return [
          PopupMenuItem(
            child: Row(
              children: [
                Icon(
                  FlutterRemix.calendar_event_line,
                  color: colors.textBlack,
                ),
                16.horizontalSpace,
                Text(
                  AppHelper.getTrn(TrKeys.addToCalendar),
                  style: CustomStyle.interNormal(
                      color: colors.textBlack, size: 12),
                ),
              ],
            ),
            onTap: () {
              final Event event = Event(
                title: book.serviceMaster?.shop?.translation?.title ?? "Shop",
                description:
                    book.serviceMaster?.shop?.translation?.description ??
                        "description",
                location:
                    book.serviceMaster?.shop?.translation?.address ?? "address",
                startDate: book.startDate ?? DateTime.now(),
                endDate: book.endDate ?? DateTime.now(),
                iosParams: const IOSParams(
                  reminder: Duration(hours: 1),
                ),
              );
              Add2Calendar.addEvent2Cal(event);
            },
          ),
          if (!past)
            PopupMenuItem(
              value: 'cancel',
              child: Row(
                children: [
                  Icon(
                    FlutterRemix.close_circle_line,
                    color: colors.textBlack,
                  ),
                  16.horizontalSpace,
                  Text(
                    AppHelper.getTrn(TrKeys.cancelAppointment),
                    style: CustomStyle.interNormal(
                        color: colors.textBlack, size: 12),
                  ),
                ],
              ),
              onTap: () {
                AppHelper.showCustomModalBottomSheet(
                    context: context,
                    modal: BlocProvider.value(
                      value: context.read<BookingBloc>(),
                      child: CancelBookingScreen(
                          bookScreen: false,
                          colors: colors,
                          bookId: book.id ?? 0),
                    ));
              },
            )
        ];
      },
    );
  }
}
