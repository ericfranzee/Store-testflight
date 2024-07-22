import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibeauty/application/category/category_bloc.dart';
import 'package:ibeauty/application/products/product_bloc.dart';
import 'package:ibeauty/domain/service/helper.dart';
import 'package:ibeauty/domain/service/tr_keys.dart';
import 'package:ibeauty/presentation/components/button/animation_button_effect.dart';
import 'package:ibeauty/presentation/components/custom_network_image.dart';
import 'package:ibeauty/presentation/components/shimmer/category_shimmer.dart';
import 'package:ibeauty/presentation/route/app_route.dart';
import 'package:ibeauty/presentation/style/style.dart';
import 'package:ibeauty/presentation/style/theme/theme.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class CategoryShopTwo extends StatelessWidget {
  final CustomColorSet colors;
  final int shopId;

  final RefreshController categoryRefresh;

  const CategoryShopTwo(
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 16.r),
                    child: Text(
                      AppHelper.getTrn(TrKeys.categories),
                      style: CustomStyle.interNormal(
                          color: colors.textBlack, size: 20),
                    ),
                  ),
                  16.verticalSpace,
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
                                          height: 140.r,
                                          width: 140.r,
                                          decoration: BoxDecoration(
                                              color: colors.newBoxColor,
                                              borderRadius:
                                                  BorderRadius.circular(10.r)),
                                          child: Column(
                                            children: [
                                              const Spacer(),
                                              CustomNetworkImage(
                                                  url: state.categories[index]
                                                          .img ??
                                                      "",
                                                  height: 60,
                                                  width: 70,
                                                  radius: 0),
                                              16.verticalSpace,
                                              Text(
                                                state.categories[index]
                                                        .translation?.title ??
                                                    "",
                                                style: CustomStyle.interNormal(
                                                    color: colors.textBlack,
                                                    size: 14),
                                              ),
                                              const Spacer(),
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
                  16.verticalSpace,
                ],
              )
            : const SizedBox.shrink();
      },
    );
  }
}
