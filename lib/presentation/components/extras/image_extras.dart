import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibeauty/domain/model/model/product_model.dart';
import 'package:ibeauty/domain/model/model/typed_extra.dart';
import 'package:ibeauty/presentation/components/custom_network_image.dart';
import 'package:ibeauty/presentation/style/style.dart';

class ImageExtras extends StatelessWidget {
  final int groupIndex;
  final List<UiExtra> uiExtras;
  final Function(UiExtra) onUpdate;
  final Function(String) updateImage;
  final Stocks? selectStock;

  const ImageExtras({
    Key? key,
    required this.groupIndex,
    required this.uiExtras,
    required this.onUpdate,
    required this.updateImage,
    required this.selectStock,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8.r,
      runSpacing: 10.r,
      children: uiExtras
          .map(
            (uiExtra) => Container(
              foregroundDecoration: BoxDecoration(
                  color: (selectStock?.quantity ?? 0) <= 0 && uiExtra.isSelected
                      ? CustomStyle.white.withOpacity(0.7)
                      : CustomStyle.transparent),
              child: Material(
                borderRadius: BorderRadius.circular(21.r),
                child: InkWell(
                  borderRadius: BorderRadius.circular(21.r),
                  onTap: () {
                    updateImage(uiExtra.value);
                    if (uiExtra.isSelected) {
                      return;
                    }
                    onUpdate(uiExtra);
                  },
                  child: Container(
                    width: 42.r,
                    height: 42.r,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(21.r),
                    ),
                    child: Stack(
                      children: [
                        CustomNetworkImage(
                            url: uiExtra.value,
                            width: 42.r,
                            height: 42.r,
                            radius: 20.r),
                        if (uiExtra.isSelected)
                          Align(
                            alignment: Alignment.center,
                            child: Container(
                              width: 22.r,
                              height: 22.r,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(11.r),
                                color: CustomStyle.primary,
                                border: Border.all(
                                  color: CustomStyle.white,
                                  width: 8.r,
                                ),
                              ),
                            ),
                          ),
                      ],
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
