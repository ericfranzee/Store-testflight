import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibeauty/application/products/product_bloc.dart';
import 'package:ibeauty/domain/service/helper.dart';
import 'package:ibeauty/domain/service/tr_keys.dart';
import 'package:ibeauty/presentation/components/product_items/one_product_item.dart';
import 'package:ibeauty/presentation/components/title.dart';
import 'package:ibeauty/presentation/route/app_route.dart';
import 'package:ibeauty/presentation/style/theme/theme.dart';

class NewProductTwoList extends StatelessWidget {
  final CustomColorSet colors;

  const NewProductTwoList({Key? key, required this.colors}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        return state.newProduct.isNotEmpty || state.isLoadingNew
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  32.verticalSpace,
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
                  ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.symmetric(horizontal: 16.r),
                      shrinkWrap: true,
                      itemCount: state.newProduct.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.only(right: 8.r),
                          child: OneProductItem(
                            height: 360,
                            product: state.newProduct[index],
                          ),
                        );
                      })
                ],
              )
            : const SizedBox.shrink();
      },
    );
  }
}
