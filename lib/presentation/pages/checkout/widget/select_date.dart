import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibeauty/application/checkout/checkout_bloc.dart';
import 'package:ibeauty/domain/service/helper.dart';
import 'package:ibeauty/domain/service/time_service.dart';
import 'package:ibeauty/domain/service/tr_keys.dart';
import 'package:ibeauty/presentation/components/button/custom_button.dart';
import 'package:ibeauty/presentation/style/style.dart';
import 'package:ibeauty/presentation/style/theme/theme.dart';

class SelectDate extends StatefulWidget {
  final CustomColorSet colors;
  final DateTime? dateTime;

  const SelectDate({super.key, required this.colors, required this.dateTime});

  @override
  State<SelectDate> createState() => _SelectDateState();
}

class _SelectDateState extends State<SelectDate> {
  DateTime? date;

  @override
  void initState() {
    date = widget.dateTime;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 30.r, horizontal: 16.r),
      decoration: BoxDecoration(
        color: widget.colors.backgroundColor,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(24.r),
          topLeft: Radius.circular(24.r),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            AppHelper.getTrn(TrKeys.deliveryDate),
            style:
                CustomStyle.interSemi(color: widget.colors.textBlack, size: 22),
          ),
          Expanded(
              child: CupertinoDatePicker(
                  maximumDate: DateTime.now().add(const Duration(days: 30)),
                  minimumDate: DateTime.now(),
                  initialDateTime: date ?? DateTime.now(),
                  onDateTimeChanged: (s) {
                    date = s;
                    setState(() {});
                  })),
          CustomButton(
              title:
                  "${AppHelper.getTrn(TrKeys.deliveryDate)} - ${TimeService.dateFormatMDYHm(date)} ",
              bgColor: widget.colors.primary,
              titleColor: widget.colors.white,
              onTap: () {
                context.read<CheckoutBloc>().add(
                    CheckoutEvent.changeDate(date: date ?? DateTime.now()));
                Navigator.pop(context);
              })
        ],
      ),
    );
  }
}
