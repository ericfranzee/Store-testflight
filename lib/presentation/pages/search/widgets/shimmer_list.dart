import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibeauty/presentation/style/style.dart';
import 'package:ibeauty/presentation/style/theme/theme.dart';

class ShimmerList extends StatelessWidget {
  final CustomColorSet colors;
  const ShimmerList({Key? key, required this.colors}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return Column(
          crossAxisAlignment:
          CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 20.r,
              color: CustomStyle.shimmerBase,
            ),
            Divider(color: colors.textHint,)
          ],
        );
      },
      itemCount: 4,
      shrinkWrap: true,
      physics:
      const NeverScrollableScrollPhysics(),
    );
  }
}
