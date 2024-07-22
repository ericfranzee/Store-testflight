import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibeauty/presentation/style/style.dart';
import 'package:ibeauty/presentation/style/theme/theme.dart';
import 'package:osm_nominatim/osm_nominatim.dart';

class SearchedLocationItem extends StatelessWidget {
  final Place place;
  final bool isLast;
  final VoidCallback onTap;
  final CustomColorSet colors;

  const SearchedLocationItem({
    Key? key,
    required this.place,
    required this.onTap,
    required this.isLast,
    required this.colors,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Material(
          color: colors.transparent,
          child: InkWell(
            onTap: onTap,
            child: Column(
              children: [
                20.verticalSpace,
                Row(
                  children: [
                    Icon(
                      FlutterRemix.map_pin_line,
                      color: colors.textBlack,
                      size: 20.r,
                    ),
                    8.horizontalSpace,
                    Expanded(
                      child: Text(
                        place.displayName,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: CustomStyle.interNormal(
                            color: colors.textBlack, size: 16),
                      ),
                    ),

                  ],
                ),
                20.verticalSpace,
              ],
            ),
          ),
        ),
        if (!isLast)
          Divider(
            color: colors.textHint,
            thickness: 1.r,
            height: 1.r,
          ),
      ],
    );
  }
}
