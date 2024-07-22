import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibeauty/app_constants.dart';
import 'package:ibeauty/application/product_detail/product_detail_bloc.dart';
import 'package:ibeauty/domain/model/model/product_model.dart';
import 'package:ibeauty/domain/model/model/review_data.dart';
import 'package:ibeauty/domain/model/model/typed_extra.dart';
import 'package:ibeauty/domain/service/helper.dart';
import 'package:ibeauty/presentation/components/extras/color_two_extras.dart';
import 'package:ibeauty/presentation/components/extras/image_extras.dart';
import 'package:ibeauty/presentation/components/extras/text_two_extras.dart';
import 'package:ibeauty/presentation/style/style.dart';
import 'package:ibeauty/presentation/style/theme/theme.dart';
import 'package:provider/provider.dart';

class ProductExtrasTwo extends StatelessWidget {
  final List<TypedExtra> types;
  final List<Stocks> stocks;
  final Stocks? selectStock;
  final List<Galleries> list;
  final CustomColorSet colors;

  const ProductExtrasTwo({
    super.key,
    required this.types,
    required this.colors,
    required this.stocks,
    required this.list,
    required this.selectStock,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 16.r),
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: types.length,
      itemBuilder: (context, index) {
        final TypedExtra typedExtra = types[index];
        return Container(
          padding: REdgeInsets.symmetric(vertical: 8),
          margin: REdgeInsets.only(top: 8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    "${typedExtra.title} : ",
                    style: CustomStyle.interNoSemi(
                      size: 16,
                      color: colors.textBlack,
                      letterSpacing: -0.4,
                    ),
                  ),
                  Text(
                    AppHelper.getNameColor(typedExtra.uiExtras
                        .firstWhere(
                          (element) => element.isSelected == true,
                          orElse: () => UiExtra("", false, index),
                        )
                        .value),
                    style: CustomStyle.interNormal(
                      size: 16,
                      color: colors.textHint,
                      letterSpacing: -0.4,
                    ),
                  )
                ],
              ),
              16.verticalSpace,
              typedExtra.type == ExtrasType.text
                  ? TextTwoExtras(
                      list: list,
                      selectStock: selectStock,
                      uiExtras: typedExtra.uiExtras,
                      groupIndex: typedExtra.groupIndex,
                      onUpdate: (uiExtra) {
                        context.read<ProductDetailBloc>().add(
                            ProductDetailEvent.updateSelectedIndexes(
                                typedExtra.groupIndex, uiExtra.index, context));
                      },
                      colors: colors,
                    )
                  : typedExtra.type == ExtrasType.color
                      ? ColorTwoExtras(
                          stocks: stocks,
                          selectStock: selectStock,
                          uiExtras: typedExtra.uiExtras,
                          groupIndex: typedExtra.groupIndex,
                          onUpdate: (uiExtra) {
                            context.read<ProductDetailBloc>().add(
                                ProductDetailEvent.updateSelectedIndexes(
                                    typedExtra.groupIndex,
                                    uiExtra.index,
                                    context));
                          },
                          colors: colors,
                        )
                      : typedExtra.type == ExtrasType.image
                          ? ImageExtras(
                              selectStock: selectStock,
                              uiExtras: typedExtra.uiExtras,
                              groupIndex: typedExtra.groupIndex,
                              updateImage: (s) {},
                              onUpdate: (uiExtra) {
                                context.read<ProductDetailBloc>().add(
                                    ProductDetailEvent.updateSelectedIndexes(
                                        typedExtra.groupIndex,
                                        uiExtra.index,
                                        context));
                              },
                            )
                          : const SizedBox()
            ],
          ),
        );
      },
    );
  }
}
