import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibeauty/domain/service/helper.dart';
import 'package:ibeauty/domain/service/tr_keys.dart';
import 'package:ibeauty/presentation/style/style.dart';
import 'package:ibeauty/presentation/style/theme/theme.dart';

class AppInfoScreen extends StatefulWidget {
  final CustomColorSet colors;

  const AppInfoScreen({super.key, required this.colors});

  @override
  State<AppInfoScreen> createState() => _AppInfoScreenState();
}

class _AppInfoScreenState extends State<AppInfoScreen> {
  List<InfoModel> list = [
    InfoModel(
      img: FlutterRemix.takeaway_line,
      title: AppHelper.getTrn(TrKeys.freeShipping),
      desc: AppHelper.getTrn(TrKeys.onAllOrdersFrom),
    ),
    InfoModel(
      img: FlutterRemix.twenty_four_hours_line,
      title: AppHelper.getTrn(TrKeys.support),
      desc: AppHelper.getTrn(TrKeys.ifYouHaveAnyProblems),
    ),
    InfoModel(
      img: FlutterRemix.luggage_cart_line,
      title: AppHelper.getTrn(TrKeys.dayReturn),
      desc: AppHelper.getTrn(TrKeys.returnPolicyIt),
    ),
    InfoModel(
      img: FlutterRemix.hand_coin_line,
      title: AppHelper.getTrn(TrKeys.lowestPrice),
      desc: AppHelper.getTrn(TrKeys.ifYouFindLower),
    ),
    InfoModel(
      img: FlutterRemix.store_2_line,
      title: AppHelper.getTrn(TrKeys.pointsOfIssue),
      desc: AppHelper.getTrn(TrKeys.weHaveBecome),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        16.verticalSpace,
        SizedBox(
          height: 90.r,
          child: ListView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.symmetric(horizontal: 16.r),
              scrollDirection: Axis.horizontal,
              itemCount: list.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.r),
                  child: Container(
                    height: 90.r,
                    width: 260.r,
                    margin: EdgeInsets.only(right: 24.r),
                    padding: EdgeInsets.all(16.r),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        color: widget.colors.backgroundColor,
                        border: Border.all(color: widget.colors.icon)),
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(12.r),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.r),
                            color: widget.colors.primary.withOpacity(0.3),
                          ),
                          child: Icon(
                            list[index].img,
                            color: widget.colors.primary,
                          ),
                        ),
                        16.horizontalSpace,
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                list[index].title,
                                style: CustomStyle.interNormal(
                                    color: widget.colors.textBlack, size: 16),
                              ),
                              4.verticalSpace,
                              Expanded(
                                child: Text(
                                  list[index].desc,
                                  style: CustomStyle.interRegular(
                                      color: widget.colors.textHint, size: 12),
                                  maxLines: 2,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              }),
        ),
        16.verticalSpace,
        Divider(
          color: CustomStyle.dividerColor,
          thickness: 16.r,
        ),
        8.verticalSpace,
      ],
    );
  }
}

class InfoModel {
  final IconData img;
  final String title;
  final String desc;

  InfoModel({
    required this.img,
    required this.title,
    required this.desc,
  });
}
