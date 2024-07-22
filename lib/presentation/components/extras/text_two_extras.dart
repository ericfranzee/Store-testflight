import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibeauty/domain/model/model/product_model.dart';
import 'package:ibeauty/domain/model/model/review_data.dart';
import 'package:ibeauty/domain/model/model/typed_extra.dart';
import 'package:ibeauty/presentation/style/style.dart';
import 'package:ibeauty/presentation/style/theme/theme.dart';

class TextTwoExtras extends StatelessWidget {
  final int groupIndex;
  final List<UiExtra> uiExtras;
  final List<Galleries> list;
  final Function(UiExtra) onUpdate;
  final Stocks? selectStock;
  final CustomColorSet colors;

  const TextTwoExtras({
    Key? key,
    required this.groupIndex,
    required this.uiExtras,
    required this.onUpdate,
    required this.list,
    required this.selectStock,
    required this.colors,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8.r,
      runSpacing: 10.r,
      children: uiExtras
          .map(
            (uiExtra) => Padding(
              padding: REdgeInsets.all(4.0),
              child: Container(
                foregroundDecoration: BoxDecoration(
                    color:
                        (selectStock?.quantity ?? 0) <= 0 && uiExtra.isSelected
                            ? CustomStyle.white.withOpacity(0.7)
                            : CustomStyle.transparent),
                child: Material(
                  borderRadius: BorderRadius.circular(8.r),
                  color: CustomStyle.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(8.r),
                    onTap: () {
                      if (uiExtra.isSelected) {
                        return;
                      }
                      onUpdate(uiExtra);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        border: Border.all(
                            color: uiExtra.isSelected
                                ? colors.textBlack
                                : colors.icon),
                      ),
                      padding: REdgeInsets.all(12),
                      child: Text(
                        uiExtra.value,
                        style: CustomStyle.interNormal(
                          size: 14,
                          color: colors.textBlack,
                          letterSpacing: -14 * 0.01,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}
