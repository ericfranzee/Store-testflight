import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibeauty/application/booking/booking_bloc.dart';
import 'package:ibeauty/domain/service/helper.dart';
import 'package:ibeauty/domain/service/tr_keys.dart';
import 'package:ibeauty/presentation/components/button/custom_button.dart';
import 'package:ibeauty/presentation/style/style.dart';
import 'package:ibeauty/presentation/style/theme/theme.dart';

class CancelBookingScreen extends StatelessWidget {
  final CustomColorSet colors;
  final int bookId;
  final bool bookScreen;

  const CancelBookingScreen(
      {super.key,
      required this.colors,
      required this.bookId,
      this.bookScreen = true});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 16.r),
      decoration: BoxDecoration(
        color: colors.backgroundColor,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(16.r),
          topLeft: Radius.circular(16.r),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.r),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 4.r,
              width: 48.r,
              decoration: BoxDecoration(
                color: colors.icon,
                borderRadius: BorderRadius.circular(10.r),
              ),
            ),
            28.verticalSpace,
            Text(
              AppHelper.getTrn(TrKeys.areYouSureYouWantToCancel),
              style: CustomStyle.interNoSemi(color: colors.textBlack, size: 22),
            ),
            24.verticalSpace,
            Row(
              children: [
                Expanded(
                  child: CustomButton(
                      title: AppHelper.getTrn(TrKeys.close),
                      bgColor: colors.transparent,
                      titleColor: colors.textBlack,
                      borderColor: colors.textBlack,
                      onTap: () {
                        Navigator.pop(context);
                      }),
                ),
                10.horizontalSpace,
                Expanded(
                  child: BlocBuilder<BookingBloc, BookingState>(
                    buildWhen: (p, n) {
                      return p.isButtonLoading != n.isButtonLoading;
                    },
                    builder: (context, state) {
                      return CustomButton(
                          isLoading: state.isButtonLoading,
                          title: AppHelper.getTrn(TrKeys.cancel),
                          bgColor: colors.error,
                          titleColor: colors.white,
                          onTap: () {
                            context
                                .read<BookingBloc>()
                                .add(BookingEvent.cancelBook(
                                    context: context,
                                    id: bookId,
                                    onSuccess: () {
                                      Navigator.pop(context);
                                      if (bookScreen) {
                                        Navigator.pop(context);
                                      }
                                    }));
                          });
                    },
                  ),
                ),
              ],
            ),
            32.verticalSpace,
          ],
        ),
      ),
    );
  }
}
