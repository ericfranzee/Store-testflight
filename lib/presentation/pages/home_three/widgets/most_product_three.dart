import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibeauty/application/products/product_bloc.dart';
import 'package:ibeauty/domain/service/helper.dart';
import 'package:ibeauty/domain/service/tr_keys.dart';
import 'package:ibeauty/presentation/components/product_items/product_item.dart';
import 'package:ibeauty/presentation/components/shimmer/h_product_shimmer.dart';
import 'package:ibeauty/presentation/components/title.dart';
import 'package:ibeauty/presentation/route/app_route.dart';
import 'package:ibeauty/presentation/style/theme/theme.dart';

class MostProductThreeList extends StatelessWidget {
  final CustomColorSet colors;

  const MostProductThreeList({Key? key, required this.colors})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        return state.mostSaleProduct.isNotEmpty || state.isLoadingMostSale
            ? Container(
                color: colors.backgroundColor,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    16.verticalSpace,
                    TitleWidget(
                      isSale: true,
                      title: AppHelper.getTrn(TrKeys.mostSales),
                      titleColor: colors.textBlack,
                      subTitle: AppHelper.getTrn(TrKeys.seeAll),
                      onTap: () async {
                        await AppRoute.goProductList(
                          context: context,
                          list: state.mostSaleProduct,
                          title: AppHelper.getTrn(TrKeys.mostSales),
                          total: state.mostSaleProductCount,
                          isNewProduct: false,
                          isMostSaleProduct: true,
                        );
                        if (context.mounted) {
                          context
                              .read<ProductBloc>()
                              .add(const ProductEvent.updateState());
                        }
                      },
                    ),
                    16.verticalSpace,
                    SizedBox(
                      height: 330.r,
                      child: !state.isLoadingMostSale
                          ? ListView.builder(
                              padding: EdgeInsets.symmetric(horizontal: 16.r),
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: state.mostSaleProduct.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: EdgeInsets.only(right: 8.r),
                                  child: ProductItem(
                                    product: state.mostSaleProduct[index],
                                    height: 260,
                                    width: 236,
                                  ),
                                );
                              })
                          : const HProductShimmer(),
                    )
                  ],
                ),
              )
            : const SizedBox.shrink();
      },
    );
  }
}
