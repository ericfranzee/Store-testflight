import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibeauty/application/booking/booking_bloc.dart';
import 'package:ibeauty/domain/model/model/master_model.dart';
import 'package:ibeauty/domain/model/response/check_time_response.dart';
import 'package:ibeauty/domain/service/helper.dart';
import 'package:ibeauty/domain/service/tr_keys.dart';
import 'package:ibeauty/infrastructure/local_storage/local_storage.dart';
import 'package:ibeauty/presentation/components/button/animation_button_effect.dart';
import 'package:ibeauty/presentation/components/button/custom_button.dart';
import 'package:ibeauty/presentation/components/button/pop_button.dart';
import 'package:ibeauty/presentation/components/custom_scaffold.dart';
import 'package:ibeauty/presentation/components/keyboard_dismisser.dart';
import 'package:ibeauty/presentation/route/app_route_service.dart';
import 'package:ibeauty/presentation/style/style.dart';
import 'package:ibeauty/presentation/style/theme/theme.dart';

class SelectBookTime extends StatelessWidget {
  final Map<int, MasterModel> selectMasters;

  const SelectBookTime({super.key, required this.selectMasters});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: (colors) => KeyboardDismisser(
        isLtr: LocalStorage.getLangLtr(),
        child: SafeArea(
          bottom: false,
          child: Column(
            children: [
              Text(
                AppHelper.getTrn(TrKeys.selectDateTime),
                style:
                    CustomStyle.interNoSemi(color: colors.textBlack, size: 18),
              ),
              24.verticalSpace,
              BlocBuilder<BookingBloc, BookingState>(
                builder: (context, state) {
                  List times = state.listDate
                          ?.firstWhere(
                              (element) =>
                                  element.date?.day ==
                                  state.selectDateTime?.day,
                              orElse: () => EnableDate(day: "Jamshid"))
                          .times ??
                      [];
                  return Expanded(
                    child: Column(
                      children: [
                        _days(context, state, colors),
                        16.verticalSpace,
                        times.isEmpty
                            ? Padding(
                                padding: EdgeInsets.only(top: 24.r),
                                child: Text(
                                  AppHelper.getTrn(TrKeys.noAvailable),
                                  style: CustomStyle.interNormal(
                                      color: colors.textBlack),
                                ),
                              )
                            : _enableTimes(times, context, state, colors),
                      ],
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
      floatingButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingButton: (colors) => Align(
        alignment: Alignment.bottomLeft,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.r),
          child: Row(
            children: [
              PopButton(colors: colors),
              10.horizontalSpace,
              BlocBuilder<BookingBloc, BookingState>(
                builder: (context, state) {
                  return state.selectBookTime != null
                      ? Expanded(
                          child: SizedBox(
                            height: 56.r,
                            child: CustomButton(
                                title: AppHelper.getTrn(TrKeys.next),
                                bgColor: colors.primary,
                                titleColor: colors.textWhite,
                                onTap: () {
                                  int hour = int.parse(state.selectBookTime
                                          ?.substring(
                                              0,
                                              state.selectBookTime
                                                  ?.indexOf(":")) ??
                                      "0");
                                  int minute = int.parse(state.selectBookTime
                                          ?.substring((state.selectBookTime
                                                      ?.indexOf(":") ??
                                                  0) +
                                              1) ??
                                      "0");

                                  AppRouteService.goAddNotePage(
                                      context: context,
                                      shopId: state.selectMasters.values.first.serviceMaster?.shopId ?? 0,
                                      startTime: DateTime(
                                        state.selectDateTime?.year ?? 0,
                                        state.selectDateTime?.month ?? 0,
                                        state.selectDateTime?.day ?? 0,
                                        hour,
                                        minute,
                                      ));
                                }),
                          ),
                        )
                      : const SizedBox.shrink();
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Padding _days(
      BuildContext context, BookingState state, CustomColorSet colors) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.r),
      child: EasyDateTimeLine(
        locale: LocalStorage.getLanguage()?.locale ?? "en_US",
        initialDate: DateTime.now(),
        onDateChange: (selectedDate) {
          context
              .read<BookingBloc>()
              .add(BookingEvent.selectDateTime(selectDateTime: selectedDate));
        },
        disabledDates: [
          ...List.generate(30,
              (index) => DateTime.now().subtract(Duration(days: index + 1))),
          ...(state.listDate?.map((e) {
                if (e.closed ?? false) {
                  return e.date ??
                      DateTime.now().subtract(const Duration(days: 1));
                }
                return DateTime.now().subtract(const Duration(days: 1));
              }).toList() ??
              [])
        ],
        headerProps: const EasyHeaderProps(
          monthPickerType: MonthPickerType.switcher,
          selectedDateFormat: SelectedDateFormat.fullDateDMY,
        ),
        dayProps: EasyDayProps(
          dayStructure: DayStructure.dayStrDayNum,
          todayHighlightColor: colors.textBlack,
          activeDayStyle: DayStyle(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              color: colors.primary,
            ),
          ),
        ),
      ),
    );
  }

  Expanded _enableTimes(List<dynamic> times, BuildContext context,
      BookingState state, CustomColorSet colors) {
    return Expanded(
      child: SingleChildScrollView(
        padding: EdgeInsets.only(bottom: 100.r),
        child: Wrap(
          children: times.map((time) {
            bool check = true;
            if (state.selectDateTime?.day == DateTime.now().day) {
              int hour =
                  int.parse(time?.substring(0, time.indexOf(":")) ?? "0");
              int minute = int.parse(
                  time.substring((time.indexOf(":") ?? 0) + 1) ?? "0");
              if (hour < TimeOfDay.now().hour) {
                check = false;
              }
              if (hour == TimeOfDay.now().hour &&
                  minute < TimeOfDay.now().minute) {
                check = false;
              }
            }

            return check
                ? ButtonEffectAnimation(
                    onTap: () {
                      context
                          .read<BookingBloc>()
                          .add(BookingEvent.selectBookingTime(time: time));
                    },
                    child: Container(
                      margin: EdgeInsets.all(8.r),
                      decoration: BoxDecoration(
                          color: state.selectBookTime == time
                              ? colors.primary
                              : colors.transparent,
                          borderRadius: BorderRadius.circular(10.r),
                          border: Border.all(
                              color: state.selectBookTime == time
                                  ? colors.primary
                                  : colors.textBlack)),
                      padding: EdgeInsets.symmetric(
                          vertical: 10.r, horizontal: 20.r),
                      child: Text(
                        time,
                        style: CustomStyle.interNormal(
                            color: state.selectBookTime == time
                                ? colors.white
                                : colors.textBlack),
                      ),
                    ),
                  )
                : const SizedBox.shrink();
          }).toList(),
        ),
      ),
    );
  }
}
