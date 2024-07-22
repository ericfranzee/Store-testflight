import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibeauty/application/brand/brand_bloc.dart';
import 'package:ibeauty/application/product_detail/product_detail_bloc.dart';
import 'package:ibeauty/domain/service/helper.dart';
import 'package:ibeauty/domain/service/tr_keys.dart';
import 'package:ibeauty/presentation/components/button/animation_button_effect.dart';
import 'package:ibeauty/presentation/components/custom_network_image.dart';
import 'package:ibeauty/presentation/components/title.dart';
import 'package:ibeauty/presentation/route/app_route.dart';
import 'package:ibeauty/presentation/style/style.dart';
import 'package:ibeauty/presentation/style/theme/theme.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class BrandsList extends StatelessWidget {
  final RefreshController brandRefresh;
  final CustomColorSet colors;

  const BrandsList(
      {super.key, required this.brandRefresh, required this.colors});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BrandBloc, BrandState>(
      builder: (context, state) {
        return state.brands.isNotEmpty || state.isLoading
            ? Column(
                children: [
                  24.verticalSpace,
                  TitleWidget(
                    title: AppHelper.getTrn(TrKeys.brandes),
                    titleColor: colors.textBlack,
                  ),
                  16.verticalSpace,
                  SizedBox(
                    height: 110.r,
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
                                          height: 100.r,
                                          padding: EdgeInsets.symmetric(
                                              vertical: 20.r, horizontal: 16.r),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10.r),
                                              border: Border.all(
                                                  color: colors.icon)),
                                          child: Row(
                                            children: [
                                              CustomNetworkImage(
                                                  url:
                                                      state.brands[index].img ??
                                                          "",
                                                  height: 64,
                                                  width: 64,
                                                  radius: 32),
                                              16.horizontalSpace,
                                              Text(
                                                state.brands[index].title ?? "",
                                                style: CustomStyle.interNormal(
                                                    color: colors.textBlack,
                                                    size: 18),
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  }),
                            ),
                          ),
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
