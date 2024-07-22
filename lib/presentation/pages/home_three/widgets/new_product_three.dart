import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibeauty/application/products/product_bloc.dart';
import 'package:ibeauty/domain/service/helper.dart';
import 'package:ibeauty/domain/service/tr_keys.dart';
import 'package:ibeauty/presentation/components/product_items/product_item.dart';
import 'package:ibeauty/presentation/components/title.dart';
import 'package:ibeauty/presentation/route/app_route.dart';
import 'package:ibeauty/presentation/style/theme/theme.dart';

import '../../../style/style.dart';

class NewProductThreeList extends StatelessWidget {
  final CustomColorSet colors;

  const NewProductThreeList({Key? key, required this.colors}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        return state.newProduct.isNotEmpty || state.isLoadingNew
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  16.verticalSpace,
                  Divider(
                    color: CustomStyle.dividerColor,
                    thickness: 16.r,
                  ),
                  16.verticalSpace,
                  TitleWidget(
                    title: AppHelper.getTrn(TrKeys.newArrivals),
                    titleColor: colors.textBlack,
                    subTitle: AppHelper.getTrn(TrKeys.seeAll),
                    onTap: () async {
                      await AppRoute.goProductList(
                        context: context,
                        list: state.newProduct,
                        title: AppHelper.getTrn(TrKeys.newArrivals),
                        total: state.newProductCount,
                        isNewProduct: true,
                        isMostSaleProduct: false,
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
                    child: ListView.builder(
                        padding: EdgeInsets.symmetric(horizontal: 16.r),
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: state.newProduct.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.only(right: 8.r),
                            child: ProductItem(
                              product: state.newProduct[index],
                              height: 260,
                              width: 236,

                            ),
                          );
                        }),
                  )
                ],
              )
            : const SizedBox.shrink();
      },
    );
  }
}
