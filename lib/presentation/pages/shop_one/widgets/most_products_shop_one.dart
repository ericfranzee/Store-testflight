import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibeauty/application/products/product_bloc.dart';
import 'package:ibeauty/domain/service/helper.dart';
import 'package:ibeauty/domain/service/tr_keys.dart';
import 'package:ibeauty/presentation/components/product_items/product_item.dart';
import 'package:ibeauty/presentation/components/shimmer/products_shimmer.dart';
import 'package:ibeauty/presentation/components/title.dart';
import 'package:ibeauty/presentation/route/app_route.dart';
import 'package:ibeauty/presentation/style/theme/theme.dart';


class MostShopOneProductList extends StatelessWidget {
  final CustomColorSet colors;
  final int shopId;

  const MostShopOneProductList(
      {Key? key, required this.colors, required this.shopId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        return state.mostSaleShopProduct.isNotEmpty || state.isLoadingMostSale
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  32.verticalSpace,
                  TitleWidget(
                    isSale: true,
                    title: AppHelper.getTrn(TrKeys.mostSales),
                    titleColor: colors.textBlack,
                    subTitle: AppHelper.getTrn(TrKeys.seeAll),
                    onTap: () async {
                      await AppRoute.goProductList(
                          context: context,
                          list: state.mostSaleShopProduct,
                          title: AppHelper.getTrn(TrKeys.mostSales),
                          isNewProduct: false,
                          isMostSaleProduct: true,
                          shopId: shopId);
                      if (context.mounted) {
                        context
                            .read<ProductBloc>()
                            .add(const ProductEvent.updateState());
                      }
                    },
                  ),
                  16.verticalSpace,
                  !state.isLoadingMostSale
                      ? GridView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          padding: EdgeInsets.only(
                              right: 16.r, left: 16.r, top: 16.r),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  childAspectRatio: 0.8.r,
                                  crossAxisCount: 2,
                                  mainAxisExtent: 360.r),
                          itemCount: state.mostSaleShopProduct.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.symmetric(horizontal: 4.r),
                              child: ProductItem(
                                  product: state.mostSaleShopProduct[index]),
                            );
                          })
                      : const ProductsShimmer()
                ],
              )
            : const SizedBox.shrink();
      },
    );
  }
}
