import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibeauty/domain/model/model/master_model.dart';
import 'package:ibeauty/presentation/style/style.dart';
import 'package:ibeauty/presentation/style/theme/theme.dart';

class MasterDescriptionPage extends StatelessWidget {
  final CustomColorSet colors;
  final MasterModel? master;

  const MasterDescriptionPage(
      {super.key, required this.master, required this.colors});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.r),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            master?.translation?.title ?? "",
            style: CustomStyle.interNormal(color: colors.textBlack, size: 20),
          ),
          8.verticalSpace,
          Text(
            master?.translation?.description ?? "",
            style: CustomStyle.interRegular(color: colors.textBlack, size: 16),
            maxLines: 7,
          ),
          20.verticalSpace,
          const Divider(),
        ],
      ),
    );
  }
}
