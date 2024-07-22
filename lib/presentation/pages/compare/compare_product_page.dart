import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibeauty/domain/model/model/product_model.dart';
import 'package:ibeauty/presentation/components/button/pop_button.dart';
import 'package:ibeauty/presentation/components/custom_scaffold.dart';
import 'package:ibeauty/presentation/pages/compare/widgets/additional_info.dart';
import 'package:ibeauty/presentation/pages/compare/widgets/main_info.dart';
import 'package:ibeauty/presentation/pages/compare/widgets/price_compare.dart';
import 'package:ibeauty/presentation/pages/compare/widgets/review_compare.dart';
import 'package:ibeauty/presentation/pages/compare/widgets/title_compare.dart';
import 'package:ibeauty/presentation/style/style.dart';

class CompareProductPage extends StatelessWidget {
  final List<ProductData> list;

  const CompareProductPage({super.key, required this.list});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: (colors) => SafeArea(
        bottom: false,
        child: Column(
          children: [
            if (list.isNotEmpty)
              Text(
                list.first.category?.translation?.title ?? "",
                style:
                    CustomStyle.interNoSemi(color: colors.textBlack, size: 18),
              ),
            24.verticalSpace,
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 16.r),
                scrollDirection: Axis.horizontal,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: list
                        .map((e) => Container(
                              margin: EdgeInsets.symmetric(horizontal: 8.r),
                              width:
                                  MediaQuery.sizeOf(context).width / 2 - 32.r,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  TitleCompare(colors: colors, product: e),
                                  const Divider(),
                                  ReviewCompare(colors: colors, product: e),
                                  const Divider(),
                                  PriceCompare(colors: colors, product: e),
                                  const Divider(),
                                  MainInfo(colors: colors, product: e),
                                  AdditionalInfo(colors: colors, product: e)
                                ],
                              ),
                            ))
                        .toList(),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      floatingButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingButton: (colors) => PopButton(colors: colors),
    );
  }
}
