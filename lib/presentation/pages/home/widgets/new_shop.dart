import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibeauty/application/shop/shop_bloc.dart';
import 'package:ibeauty/domain/service/helper.dart';
import 'package:ibeauty/domain/service/tr_keys.dart';
import 'package:ibeauty/presentation/components/shop_items/shop_item.dart';
import 'package:ibeauty/presentation/components/title.dart';
import 'package:ibeauty/presentation/style/theme/theme.dart';

class NewShopList extends StatelessWidget {
  final CustomColorSet colors;

  const NewShopList({Key? key, required this.colors}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShopBloc, ShopState>(
      builder: (context, state) {
        return state.shopsNew.isNotEmpty
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  32.verticalSpace,
                  TitleWidget(
                    title: AppHelper.getTrn(TrKeys.newShops),
                    titleColor: colors.textBlack,
                    subTitle: AppHelper.getTrn(TrKeys.seeAll),
                    onTap: () async {
                      //  await AppRoute.goProductList(
                      //     context: context,
                      //     list: state.newProduct,
                      //     title: AppHelper.getTrn(TrKeys.newArrivals),
                      //     total: state.newProductCount,
                      //     isNewProduct: true,
                      //     isMostSaleProduct: false,
                      //   );
                      //   if (context.mounted) {
                      //     context
                      //         .read<ProductBloc>()
                      //         .add(const ProductEvent.updateState());
                      //   }
                    },
                  ),
                  16.verticalSpace,
                  SizedBox(
                      height: 262.r,
                      child: ListView.builder(
                          padding: EdgeInsets.symmetric(horizontal: 16.r),
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: state.shopsNew.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.only(right: 8.r),
                              child: ShopItem(
                                  blurUi: true,
                                  colors: colors,
                                  shop: state.shopsNew[index]),
                            );
                          }))
                ],
              )
            : const SizedBox.shrink();
      },
    );
  }
}
