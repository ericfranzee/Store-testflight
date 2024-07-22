import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibeauty/application/brand/brand_bloc.dart';
import 'package:ibeauty/application/product_detail/product_detail_bloc.dart';
import 'package:ibeauty/presentation/components/button/animation_button_effect.dart';
import 'package:ibeauty/presentation/components/custom_network_image.dart';
import 'package:ibeauty/presentation/components/shimmer/category_shimmer.dart';
import 'package:ibeauty/presentation/route/app_route.dart';
import 'package:ibeauty/presentation/style/style.dart';
import 'package:ibeauty/presentation/style/theme/theme.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class BrandsTwoList extends StatelessWidget {
  final RefreshController brandRefresh;
  final CustomColorSet colors;

  const BrandsTwoList(
      {super.key, required this.brandRefresh, required this.colors});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BrandBloc, BrandState>(
      builder: (context, state) {
        return state.brands.isNotEmpty || state.isLoading
            ? Column(
                children: [
                  16.verticalSpace,
                  SizedBox(
                    height: 40.r,
                    child: Row(
                      children: [
                        if (state.brands.isNotEmpty)
                          Expanded(
                            child: SmartRefresher(
                              controller: brandRefresh,
                              scrollDirection: Axis.horizontal,
                              enablePullUp: true,
                              enablePullDown: false,
                              onLoading: () {
                                context.read<BrandBloc>().add(
                                    BrandEvent.fetchBrands(
                                        context: context,
                                        controller: brandRefresh));
                              },
                              child: ListView.builder(
                                  key: const PageStorageKey<String>("list"),
                                  shrinkWrap: true,
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 16.r),
                                  scrollDirection: Axis.horizontal,
                                  itemCount: state.brands.length,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 8.r),
                                      child: ButtonEffectAnimation(
                                        onTap: () async {
                                          await AppRoute.goProductList(
                                              context: context,
                                              brandId: state.brands[index].id,
                                              title: state.brands[index].title);
                                          if (context.mounted) {
                                            context
                                                .read<ProductDetailBloc>()
                                                .add(const ProductDetailEvent
                                                    .updateState());
                                          }
                                        },
                                        child: Container(
                                          height: 40.r,
                                          width: 75.r,
                                          padding: EdgeInsets.all(8.r),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10.r),
                                              border: Border.all(
                                                  color: colors.icon)),
                                          child: CustomNetworkImage(
                                              url:
                                                  state.brands[index].img ?? "",
                                              height: 75,
                                              fit: BoxFit.contain,
                                              width: 60,
                                              radius: 0),
                                        ),
                                      ),
                                    );
                                  }),
                            ),
                          ),
                        if (state.isLoading) const CategoryShimmer(),
                      ],
                    ),
                  ),
                  16.verticalSpace,
                  Divider(
                    color: CustomStyle.dividerColor,
                    thickness: 16.r,
                  ),
                  8.verticalSpace,
                ],
              )
            : const SizedBox.shrink();
      },
    );
  }
}
