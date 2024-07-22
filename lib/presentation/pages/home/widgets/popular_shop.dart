import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibeauty/application/shop/shop_bloc.dart';
import 'package:ibeauty/domain/service/helper.dart';
import 'package:ibeauty/domain/service/tr_keys.dart';
import 'package:ibeauty/presentation/components/shop_items/shop_item.dart';
import 'package:ibeauty/presentation/components/title.dart';
import 'package:ibeauty/presentation/route/app_route_shop.dart';
import 'package:ibeauty/presentation/style/theme/theme.dart';

import '../../../components/shimmer/h_product_shimmer.dart';

class ShopsPopularList extends StatelessWidget {
  final CustomColorSet colors;

  const ShopsPopularList({Key? key, required this.colors}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShopBloc, ShopState>(
      builder: (context, state) {
        return state.shopsPopular.isNotEmpty || state.isLoadingPopular
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  16.verticalSpace,
                  TitleWidget(
                    title: AppHelper.getTrn(TrKeys.recommended),
                    titleColor: colors.textBlack,
                    subTitle: AppHelper.getTrn(TrKeys.seeAll),
                    onTap: () async {
                      await AppRouteShop.goShopListPage(context: context);
                      if (context.mounted) {
                        context
                            .read<ShopBloc>()
                            .add(const ShopEvent.updateState());
                      }
                    },
                  ),
                  16.verticalSpace,
                  SizedBox(
                    height: 340.r,
                    child: !state.isLoadingPopular
                        ? ListView.builder(
                            padding: EdgeInsets.symmetric(horizontal: 16.r),
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: state.shopsPopular.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.only(right: 8.r),
                                child: ShopItem(
                                    colors: colors,
                                    shop: state.shopsPopular[index]),
                              );
                            })
                        : const HProductShimmer(),
                  )
                ],
              )
            : const SizedBox.shrink();
      },
    );
  }
}
