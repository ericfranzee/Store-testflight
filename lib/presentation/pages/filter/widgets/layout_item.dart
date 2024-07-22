import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibeauty/app_constants.dart';
import 'package:ibeauty/domain/service/helper.dart';
import 'package:ibeauty/domain/service/tr_keys.dart';
import 'package:ibeauty/presentation/pages/filter/widgets/layout_box.dart';
import 'package:ibeauty/presentation/style/style.dart';
import 'package:ibeauty/presentation/style/theme/theme.dart';
import 'package:rotated_corner_decoration/rotated_corner_decoration.dart';

class LayoutItem extends StatelessWidget {
  final CustomColorSet colors;
  final LayoutType type;
  final LayoutType selectType;

  const LayoutItem(
      {Key? key,
      required this.colors,
      required this.type,
      required this.selectType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      foregroundDecoration: type == LayoutType.newUi
          ? RotatedCornerDecoration.withColor(
              color: CustomStyle.red,
              badgeSize: Size(24.r, 24.r),
              textSpan: TextSpan(
                text: AppHelper.getTrn(TrKeys.newKey),
                style:
                    CustomStyle.interNormal(color: CustomStyle.white, size: 8),
              ),
            )
          : null,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(color: colors.white),
          color: CustomStyle.transparent),
      padding: EdgeInsets.all(10.r),
      child: type == LayoutType.twoH
          ? Row(
              children: [
                LayoutBox(
                  active: selectType == LayoutType.twoH,
                  width: 16,
                ),
                4.horizontalSpace,
                LayoutBox(
                  active: selectType == LayoutType.twoH,
                  width: 16,
                ),
              ],
            )
          : type == LayoutType.three
              ? Column(
                  children: [
                    Row(
                      children: [
                        LayoutBox(
                          active: selectType == LayoutType.three,
                          height: 18,
                          width: 8,
                          radius: 2,
                        ),
                        4.horizontalSpace,
                        LayoutBox(
                          active: selectType == LayoutType.three,
                          height: 18,
                          width: 8,
                          radius: 2,
                        ),
                        4.horizontalSpace,
                        LayoutBox(
                          active: selectType == LayoutType.three,
                          height: 18,
                          width: 8,
                          radius: 2,
                        ),
                      ],
                    ),
                    4.verticalSpace,
                    Row(
                      children: [
                        LayoutBox(
                          active: selectType == LayoutType.three,
                          height: 18,
                          width: 8,
                          radius: 2,
                        ),
                        4.horizontalSpace,
                        LayoutBox(
                          active: selectType == LayoutType.three,
                          height: 18,
                          width: 8,
                          radius: 2,
                        ),
                        4.horizontalSpace,
                        LayoutBox(
                          active: selectType == LayoutType.three,
                          height: 18,
                          width: 8,
                          radius: 2,
                        ),
                      ],
                    ),
                  ],
                )
              : type == LayoutType.twoV
                  ? Column(
                      children: [
                        LayoutBox(
                          active: selectType == LayoutType.twoV,
                          height: 18,
                          width: 38,
                        ),
                        4.verticalSpace,
                        LayoutBox(
                          active: selectType == LayoutType.twoV,
                          height: 18,
                          width: 38,
                        ),
                      ],
                    )
                  : type == LayoutType.one
                      ? LayoutBox(
                          active: selectType == LayoutType.one,
                          height: 40,
                          width: 36,
                        )
                      : Icon(
                          FlutterRemix.collage_fill,
                          size: 40.r,
                          color: selectType == LayoutType.newUi
                              ? CustomStyle.primary
                              : CustomStyle.unselectLayout,
                        ),
    );
  }
}
