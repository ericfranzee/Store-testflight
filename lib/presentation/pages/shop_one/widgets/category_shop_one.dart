import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibeauty/application/category/category_bloc.dart';
import 'package:ibeauty/application/products/product_bloc.dart';
import 'package:ibeauty/presentation/components/button/animation_button_effect.dart';
import 'package:ibeauty/presentation/components/custom_network_image.dart';
import 'package:ibeauty/presentation/components/shimmer/category_shimmer.dart';
import 'package:ibeauty/presentation/route/app_route.dart';
import 'package:ibeauty/presentation/style/style.dart';
import 'package:ibeauty/presentation/style/theme/theme.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class CategoryShopOne extends StatelessWidget {
  final CustomColorSet colors;
  final int shopId;

  final RefreshController categoryRefresh;

  const CategoryShopOne(
      {super.key,
      required this.colors,
      required this.categoryRefresh,
      required this.shopId});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryBloc, CategoryState>(
      builder: (context, state) {
        return state.categories.isNotEmpty || state.isLoadingCategory
            ? Column(
                children: [
                  SizedBox(
                    height: 120.r,
                    child: Row(
                      children: [
                        if (state.categories.isNotEmpty)
                          Expanded(
                            child: SmartRefresher(
                              controller: categoryRefresh,
                              scrollDirection: Axis.horizontal,
                              enablePullUp: true,
                              enablePullDown: false,
                              onLoading: () {
                                context.read<CategoryBloc>().add(
                                    CategoryEvent.fetchCategory(
                                        context: context,
                                        controller: categoryRefresh));
                              },
                              child: ListView.builder(
                                  key: const PageStorageKey<String>("list"),
                                  shrinkWrap: true,
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 16.r),
                                  scrollDirection: Axis.horizontal,
                                  itemCount: state.categories.length,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 8.r),
                                      child: ButtonEffectAnimation(
                                        onTap: () async {
                                          await AppRoute.goProductList(
                                              context: context,
                                              title: state.categories[index]
                                                      .translation?.title ??
                                                  "",
                                              categoryId:
                                                  state.categories[index].id,
                                              shopId: shopId);
                                          if (context.mounted) {
                                            context.read<ProductBloc>().add(
                                                const ProductEvent
                                                    .updateState());
                                          }
                                        },
                                        child: Container(
                                          width: 110.r,
                                          height: 110.r,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20.r),
                                            color: colors.newBoxColor,
                                          ),
                                          child: Column(
                                            children: [
                                              Align(
                                                alignment: Alignment.centerLeft,
                                                child: Padding(
                                                  padding: EdgeInsets.all(16.r),
                                                  child: Text(
                                                    state
                                                            .categories[index]
                                                            .translation
                                                            ?.title ??
                                                        "",
                                                    style:
                                                        CustomStyle.interNormal(
                                                            color: colors
                                                                .textBlack,
                                                            size: 14),
                                                  ),
                                                ),
                                              ),
                                              Align(
                                                alignment:
                                                    Alignment.bottomRight,
                                                child: CustomNetworkImage(
                                                    url: state.categories[index]
                                                            .img ??
                                                        "",
                                                    height: 70,
                                                    width: 70,
                                                    radius: 8),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  }),
                            ),
                          ),
                        if (state.isLoadingCategory) const CategoryShimmer(),
                      ],
                    ),
                  ),
                  8.verticalSpace,
                  Divider(
                    color: CustomStyle.dividerColor,
                    thickness: 4.r,
                  ),
                  8.verticalSpace,
                ],
              )
            : const SizedBox.shrink();
      },
    );
  }
}
