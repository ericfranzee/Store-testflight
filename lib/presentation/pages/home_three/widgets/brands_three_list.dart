import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibeauty/application/brand/brand_bloc.dart';
import 'package:ibeauty/application/product_detail/product_detail_bloc.dart';
import 'package:ibeauty/domain/service/helper.dart';
import 'package:ibeauty/domain/service/tr_keys.dart';
import 'package:ibeauty/presentation/components/button/animation_button_effect.dart';
import 'package:ibeauty/presentation/components/custom_network_image.dart';
import 'package:ibeauty/presentation/route/app_route.dart';
import 'package:ibeauty/presentation/style/style.dart';
import 'package:ibeauty/presentation/style/theme/theme.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class BrandsThreeList extends StatelessWidget {
  final RefreshController brandRefresh;
  final CustomColorSet colors;

  const BrandsThreeList(
      {super.key, required this.brandRefresh, required this.colors});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BrandBloc, BrandState>(
      builder: (context, state) {
        return state.brands.isNotEmpty || state.isLoading
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Divider(
                    color: CustomStyle.dividerColor,
                    thickness: 16.r,
                  ),
                  16.verticalSpace,
                  Padding(
                    padding: EdgeInsets.only(left: 16.r),
                    child: Text(
                      AppHelper.getTrn(TrKeys.brandes),
                      style: CustomStyle.interNormal(
                          color: colors.textBlack, size: 20),
                    ),
                  ),
                  16.verticalSpace,
                  GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          childAspectRatio: 0.8.r,
                          crossAxisCount: 2,
                          mainAxisExtent: 70.r),
                      shrinkWrap: true,
                      padding: EdgeInsets.symmetric(horizontal: 16.r),
                      itemCount: state.brands.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.r,vertical: 4.r),
                          child: ButtonEffectAnimation(
                            onTap: () async {
                              await AppRoute.goProductList(
                                  context: context,
                                  brandId: state.brands[index].id,
                                  title: state.brands[index].title);
                              if (context.mounted) {
                                context.read<ProductDetailBloc>().add(
                                    const ProductDetailEvent.updateState());
                              }
                            },
                            child: Container(
                              height: 70.r,
                              width: 75.r,
                              padding: EdgeInsets.all(8.r),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.r),
                                  border: Border.all(color: colors.icon)),
                              child: CustomNetworkImage(
                                  url: state.brands[index].img ?? "",
                                  height: 70,
                                  fit: BoxFit.contain,
                                  width: 75,
                                  radius: 0),
                            ),
                          ),
                        );
                      }),
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
