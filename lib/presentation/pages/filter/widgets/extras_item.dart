import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibeauty/domain/model/response/filter_response.dart';
import 'package:ibeauty/domain/service/helper.dart';
import 'package:ibeauty/presentation/style/style.dart';
import 'package:ibeauty/presentation/style/theme/theme.dart';

class ExtrasItem extends StatelessWidget {
  final CustomColorSet colors;
  final String type;
  final Extra extra;
  final List<int> list;

  const ExtrasItem(
      {super.key,
      required this.type,
      required this.extra,
      required this.colors,
      required this.list});

  @override
  Widget build(BuildContext context) {
    return type == "color"
        ? AppHelper.checkIfHex(extra.value)
            ? Container(
                margin: EdgeInsets.all(4.r),
                width: 50.r,
                height: 50.r,
                decoration: BoxDecoration(
                    color:
                        Color(int.parse('0xFF${extra.value?.substring(1, 7)}')),
                    borderRadius: BorderRadius.circular(16.r)),
                child: list.contains(extra.id)
                    ? Container(
                        width: 42.r,
                        height: 42.r,
                        alignment: Alignment.center,
                        child: Icon(
                          FlutterRemix.check_double_line,
                          color: extra.value?.substring(1, 7) == "ffffff"
                              ? CustomStyle.black
                              : CustomStyle.white,
                        ),
                      )
                    : SizedBox(width: 42.r, height: 42.r),
              )
            : Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                ),
                padding: REdgeInsets.all(12),
                child: Text(
                  extra.value ?? "",
                  style: CustomStyle.interNormal(
                    size: 14,
                    color: colors.textBlack,
                  ),
                ),
              )
        : Column(
            children: [
              Row(
                children: [
                  Icon(
                    list.contains(extra.id)
                        ? FlutterRemix.checkbox_circle_fill
                        : FlutterRemix.checkbox_blank_circle_line,
                    color: list.contains(extra.id)
                        ? colors.primary
                        : CustomStyle.black,
                  ),
                  10.horizontalSpace,
                  Text(
                    extra.value ?? "",
                    style: CustomStyle.interNormal(
                      size: 14,
                      color: colors.textBlack,
                    ),
                  )
                ],
              ),
              Divider(
                color: colors.backgroundColor,
              )
            ],
          );
  }
}
