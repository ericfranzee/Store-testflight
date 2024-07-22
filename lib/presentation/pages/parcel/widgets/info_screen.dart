import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibeauty/app_constants.dart';
import 'package:ibeauty/domain/service/helper.dart';
import 'package:ibeauty/domain/service/tr_keys.dart';
import 'package:ibeauty/presentation/components/button/custom_button.dart';
import 'package:ibeauty/presentation/route/app_route_parcel.dart';
import 'package:ibeauty/presentation/style/style.dart';
import 'package:ibeauty/presentation/style/theme/theme.dart';

class InfoPage extends StatelessWidget {
  final int index;
  final CustomColorSet colors;

  const InfoPage({
    super.key,
    required this.index,
    required this.colors,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(AppConstants.infoImage[index]),
                  fit: BoxFit.cover),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.r),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppHelper.getTrn(AppConstants.infoTitle[index]),
                    style:
                        CustomStyle.interNoSemi(size: 40, color: colors.white),
                  ),
                  40.verticalSpace,
                  CustomButton(
                    title: index == 3
                        ? AppHelper.getTrn(TrKeys.back)
                        : AppHelper.getTrn(TrKeys.next),
                    bgColor: colors.primary,
                    titleColor: colors.white,
                    onTap: () {
                      if (index == 3) {
                        Navigator.pop(context);
                        return;
                      }
                      AppRouteParcel.goInfoScreen(
                          replace: true,
                          context: context,
                          index: index + 1,
                          colors: colors);
                    },
                  ),
                  32.verticalSpace
                ],
              ),
            ),
          ),
          Positioned(
            top: 32.r,
            right: 8.r,
            child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  FlutterRemix.close_line,
                  color: colors.textBlack,
                  size: 32.r,
                )),
          )
        ],
      ),
    );
  }
}
