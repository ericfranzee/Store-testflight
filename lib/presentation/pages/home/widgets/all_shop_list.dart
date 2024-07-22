import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibeauty/application/shop/shop_bloc.dart';
import 'package:ibeauty/domain/service/helper.dart';
import 'package:ibeauty/domain/service/tr_keys.dart';
import 'package:ibeauty/presentation/components/shop_items/shop_item.dart';
import 'package:ibeauty/presentation/components/title.dart';
import 'package:ibeauty/presentation/style/theme/theme.dart';

class AllShopList extends StatelessWidget {
  final CustomColorSet colors;

  const AllShopList({super.key, required this.colors});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        32.verticalSpace,
        TitleWidget(
          title: AppHelper.getTrn(TrKeys.allShops),
          titleColor: colors.textBlack,
        ),
        BlocBuilder<ShopBloc, ShopState>(
          builder: (context, state) {
            return ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                padding: EdgeInsets.only(right: 16.r, left: 16.r, top: 16.r),
                itemCount: state.shops.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: 8.r),
                    child: ShopItem(
                      shop: state.shops[index],
                      colors: colors,
                    ),
                  );
                });
          },
        ),
      ],
    );
  }
}
