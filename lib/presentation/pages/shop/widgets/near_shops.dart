import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibeauty/application/shop/shop_bloc.dart';
import 'package:ibeauty/domain/service/helper.dart';
import 'package:ibeauty/domain/service/tr_keys.dart';
import 'package:ibeauty/presentation/components/shop_items/shop_item.dart';
import 'package:ibeauty/presentation/components/title.dart';
import 'package:ibeauty/presentation/style/theme/theme.dart';

class NearShops extends StatelessWidget {
  final CustomColorSet colors;

  const NearShops({super.key, required this.colors});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShopBloc, ShopState>(builder: (context, state) {
      return state.nearShops.isNotEmpty
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                32.verticalSpace,
                TitleWidget(
                  title: AppHelper.getTrn(TrKeys.nearByShop),
                  titleColor: colors.textBlack,
                ),
                16.verticalSpace,
                SizedBox(
                    height: 350.r,
                    child: ListView.builder(
                        padding: EdgeInsets.symmetric(horizontal: 16.r),
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: state.nearShops.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.only(right: 8.r),
                            child: ShopItem(
                                colors: colors, shop: state.nearShops[index]),
                          );
                        }))
              ],
            )
          : const SizedBox.shrink();
    });
  }
}
