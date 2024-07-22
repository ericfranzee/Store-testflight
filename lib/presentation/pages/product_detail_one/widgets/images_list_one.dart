import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibeauty/domain/model/model/review_data.dart';
import 'package:ibeauty/presentation/style/theme/theme.dart';

class ImagesOneList extends StatelessWidget {
  final CustomColorSet colors;
  final List<Galleries> list;
  final int selectImageId;

  const ImagesOneList({
    Key? key,
    required this.list,
    required this.selectImageId,
    required this.colors,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 6.r,
      width: MediaQuery.sizeOf(context).width,
      child: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: list
                .map((e) => AnimatedContainer(
                      duration: const Duration(milliseconds: 400),
                      margin: EdgeInsets.only(right: 6.r),
                      height: 6.r,
                      width: selectImageId == e.id ? 32.r : 8.r,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100.r),
                          color: selectImageId == e.id
                              ? colors.textBlack
                              : colors.textHint),
                    ))
                .toList(),
          ),
        ),
      ),
    );
  }
}
