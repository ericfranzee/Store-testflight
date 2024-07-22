import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibeauty/application/compare/compare_bloc.dart';
import 'package:ibeauty/domain/model/model/product_model.dart';
import 'package:ibeauty/domain/service/helper.dart';
import 'package:ibeauty/domain/service/tr_keys.dart';
import 'package:ibeauty/presentation/style/style.dart';
import 'package:ibeauty/presentation/style/theme/theme.dart';

class AdditionalInfo extends StatelessWidget {
  final CustomColorSet colors;
  final ProductData product;

  const AdditionalInfo(
      {super.key, required this.colors, required this.product});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CompareBloc, CompareState>(
      builder: (context, state) {
        return ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: state.propertyGroup.length,
            itemBuilder: (context, index) {
              Set<String> extra = {};

              for (int i = 0;
                  i < (state.propertyGroup[index].values?.length ?? 0);
                  i++) {
                if (state.propertyGroup[index].values?[i][product.id] != null) {
                  extra.add(
                      state.propertyGroup[index].values?[i][product.id] ?? "");
                }
              }
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    state.propertyGroup[index].translation?.title ?? "",
                    style: CustomStyle.interRegular(color: colors.textHint),
                  ),
                  8.verticalSpace,
                  extra.isNotEmpty
                      ? Wrap(
                          crossAxisAlignment: WrapCrossAlignment.start,
                          children: extra.map((value) {
                            return value.isNotEmpty
                                ? Padding(
                                    padding: EdgeInsets.all(4.r),
                                    child: Text(
                                      value,
                                      style: CustomStyle.interNormal(
                                          color: colors.textBlack),
                                    ),
                                  )
                                : const SizedBox.shrink();
                          }).toList())
                      : Text(
                          AppHelper.getTrn(TrKeys.noInfo),
                          style:
                              CustomStyle.interNormal(color: colors.textBlack),
                        ),
                  const Divider(),
                ],
              );
            });
      },
    );
  }
}
