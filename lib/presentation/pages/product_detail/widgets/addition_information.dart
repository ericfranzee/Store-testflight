import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibeauty/domain/model/model/product_model.dart';
import 'package:ibeauty/domain/service/helper.dart';
import 'package:ibeauty/domain/service/tr_keys.dart';
import 'package:ibeauty/presentation/components/blur_wrap.dart';
import 'package:ibeauty/presentation/style/style.dart';
import 'package:ibeauty/presentation/style/theme/theme.dart';


class AdditionInformation extends StatelessWidget {
  final CustomColorSet colors;
  final List<Properties>? list;

  const AdditionInformation({
    super.key,
    required this.colors,
    required this.list,
  });

  @override
  Widget build(BuildContext context) {
    return BlurWrap(
      radius: BorderRadius.only(
        topRight: Radius.circular(24.r),
        topLeft: Radius.circular(24.r),
      ),
      child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: colors.backgroundColor,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(24.r),
              topLeft: Radius.circular(24.r),
            ),
          ),
          padding: EdgeInsets.symmetric(horizontal: 16.r),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              24.verticalSpace,
              Text(
                AppHelper.getTrn(TrKeys.additionInformation),
                style: CustomStyle.interSemi(color: colors.textBlack, size: 22),
              ),
              16.verticalSpace,
              ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: list?.length ?? 0,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(top: 16.r),
                      child: Row(
                        children: [
                          Container(
                            height: 8.r,
                            width: 8.r,
                            decoration: BoxDecoration(
                                color: colors.textBlack,
                                shape: BoxShape.circle),
                          ),
                          6.horizontalSpace,
                          Text(
                            "${list?[index].group?.translation?.title ?? ""}: ",
                            style: CustomStyle.interNoSemi(
                                color: colors.textBlack),
                          ),
                          Text(
                            list?[index].value?.value ?? "",
                            style: CustomStyle.interNormal(
                                color: colors.textBlack),
                          )
                        ],
                      ),
                    );
                  }),
              32.verticalSpace,
            ],
          )),
    );
  }
}
