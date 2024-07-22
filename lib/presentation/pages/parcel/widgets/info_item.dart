import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibeauty/app_constants.dart';
import 'package:ibeauty/domain/service/helper.dart';
import 'package:ibeauty/presentation/route/app_route_parcel.dart';
import 'package:ibeauty/presentation/style/style.dart';
import 'package:ibeauty/presentation/style/theme/theme.dart';

class InfoItem extends StatelessWidget {
  final int index;
  final CustomColorSet colors;
  final bool isLarge;

  const InfoItem(
      {super.key,
      required this.index,
      this.isLarge = false,
      required this.colors});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        AppRouteParcel.goInfoScreen(context: context, index: index, colors: colors);
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 10.r),
        width: MediaQuery.sizeOf(context).width / 2 - 24.r,
        height: isLarge ? 230.r : 168.r,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            image: DecorationImage(
                image: AssetImage(AppConstants.infoImage[index]),
                fit: BoxFit.cover)),
        child: Align(
          alignment: Alignment.bottomLeft,
          child: Padding(
            padding: EdgeInsets.only(left: 18.r, bottom: 12.r, right: 24.r),
            child: Text(
              AppHelper.getTrn(AppConstants.infoTitle[index]),
              style: CustomStyle.interNoSemi(size: 16, color: colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
