import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibeauty/application/filter/filter_bloc.dart';
import 'package:ibeauty/application/products/product_bloc.dart';
import 'package:ibeauty/domain/service/helper.dart';
import 'package:ibeauty/domain/service/tr_keys.dart';
import 'package:ibeauty/presentation/components/blur_wrap.dart';
import 'package:ibeauty/presentation/components/button/custom_button.dart';
import 'package:ibeauty/presentation/components/loading.dart';
import 'package:ibeauty/presentation/pages/filter/widgets/brand.dart';
import 'package:ibeauty/presentation/pages/filter/widgets/category.dart';
import 'package:ibeauty/presentation/pages/filter/widgets/extras.dart';
import 'package:ibeauty/presentation/pages/filter/widgets/layout.dart';
import 'package:ibeauty/presentation/style/style.dart';
import 'package:ibeauty/presentation/style/theme/theme.dart';

import 'widgets/range_price.dart';
import 'widgets/title.dart';

class FilterPage extends StatelessWidget {
  final ScrollController controller;
  final CustomColorSet colors;

  const FilterPage({Key? key, required this.controller, required this.colors})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlurWrap(
      radius: BorderRadius.only(
        topRight: Radius.circular(24.r),
        topLeft: Radius.circular(24.r),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: colors.backgroundColor,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(24.r),
            topLeft: Radius.circular(24.r),
          ),
        ),
        child: BlocBuilder<FilterBloc, FilterState>(
          builder: (context, state) {
            return Stack(
              children: [
                SingleChildScrollView(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.paddingOf(context).bottom + 8.r,
                      left: 16.r,
                      right: 16.r),
                  controller: controller,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      24.verticalSpace,
                      TitleScreen(colors: colors),
                      24.verticalSpace,
                      LayoutScreen(
                          colors: colors, selectType: state.selectType),
                      if (state.filter?.brands?.isNotEmpty ?? false)
                        Padding(
                          padding: EdgeInsets.only(top: 8.r),
                          child: BrandScreen(
                            list: state.brands ?? [],
                            colors: colors,
                            brandes: state.filter?.brands ?? [],
                          ),
                        ),
                      if (state.filter?.categories?.isNotEmpty ?? false)
                        Padding(
                          padding: EdgeInsets.only(top: 8.r),
                          child: CategoryFilter(
                            colors: colors,
                            categories: state.filter?.categories ?? [],
                            list: state.categories ?? [],
                          ),
                        ),
                      8.verticalSpace,
                      ExtrasScreen(
                        colors: colors,
                        group: state.filter?.group ?? [],
                        listExtras: state.extras ?? [],
                      ),
                      if (state.filterPrices?.max != state.filterPrices?.min &&
                          state.rangeValues != null)
                        RangePrice(
                          colors: colors,
                          state: state,
                        ),
                      24.verticalSpace,
                      CustomButton(
                          title:
                              "${AppHelper.getTrn(TrKeys.view)} ${state.filter?.count ?? 0} ${AppHelper.getTrn(TrKeys.products)}",
                          bgColor: colors.primary,
                          titleColor: CustomStyle.white,
                          onTap: () {
                            context.read<ProductBloc>().add(
                                ProductEvent.fetchProducts(
                                    isRefresh: true,
                                    context: context,
                                    brandId: state.brands,
                                    categoryIds: state.categories,
                                    extrasId: state.extras,
                                    priceFrom: state.rangeValues?.start,
                                    priceTo: state.rangeValues?.end,
                                    isMostSaleProduct:
                                        state.type == "most_sold",
                                    isNewProduct: state.type == "news_letter"));
                            Navigator.pop(context);
                          }),
                    ],
                  ),
                ),
                if (state.isLoading) _customLoading(colors),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _customLoading(CustomColorSet colors) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: colors.backgroundColor.withOpacity(0.3),
        ),
        child: Container(
          width: 80,
          height: 80,
          alignment: Alignment.center,
          child: const Loading(),
        ),
      ),
    );
  }
}
