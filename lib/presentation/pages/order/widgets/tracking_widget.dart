import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibeauty/domain/service/helper.dart';
import 'package:ibeauty/domain/service/tr_keys.dart';
import 'package:ibeauty/presentation/components/button/animation_button_effect.dart';
import 'package:ibeauty/presentation/style/style.dart';
import 'package:ibeauty/presentation/style/theme/theme.dart';
import 'package:url_launcher/url_launcher.dart';

class TrackingWidget extends StatelessWidget {
  final CustomColorSet colors;
  final String trackName;
  final String trackId;
  final String trackUrl;

  const TrackingWidget(
      {super.key,
      required this.colors,
      required this.trackName,
      required this.trackId,
      required this.trackUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 8.r),
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 20.r, vertical: 18.r),
      decoration: BoxDecoration(
          color: colors.backgroundColor,
          borderRadius: BorderRadius.circular(16.r)),
      child: Row(
        children: [
          Icon(
            FlutterRemix.truck_fill,
            color: colors.textBlack,
            size: 32,
          ),
          const Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: MediaQuery.sizeOf(context).width / 2 - 56.r,
                child: Text(
                  trackName,
                  style:
                      CustomStyle.interSemi(color: colors.textBlack, size: 16),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Text(
                "${AppHelper.getTrn(TrKeys.trackingId)} : $trackId",
                style:
                    CustomStyle.interRegular(color: colors.textHint, size: 14),
              ),
            ],
          ),
          const Spacer(),
          ButtonEffectAnimation(
            onTap: () async {
              final Uri launchUri = Uri.parse(trackUrl);
              await launchUrl(launchUri);
            },
            child: Container(
              width: 50.r,
              height: 50.r,
              decoration: BoxDecoration(
                  color: colors.textBlack, shape: BoxShape.circle),
              child: Icon(
                FlutterRemix.direction_line,
                color: colors.textWhite,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
