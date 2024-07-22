import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ibeauty/application/cart/cart_bloc.dart';
import 'package:ibeauty/application/main/main_bloc.dart';
import 'package:ibeauty/domain/service/helper.dart';
import 'package:ibeauty/domain/service/tr_keys.dart';
import 'package:ibeauty/infrastructure/local_storage/local_storage.dart';
import 'package:ibeauty/presentation/components/blur_wrap.dart';
import 'package:ibeauty/presentation/components/button/animation_button_effect.dart';
import 'package:ibeauty/presentation/style/style.dart';
import 'package:ibeauty/presentation/style/theme/theme.dart';

import '../../../../application/products/product_bloc.dart';

class CartButton extends StatelessWidget {
  final CustomColorSet colors;

  const CartButton({Key? key, required this.colors}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ButtonEffectAnimation(
      onTap: () {
        Navigator.popUntil(context, (route) {
          return route.isFirst;
        });
        context.read<MainBloc>().add(const MainEvent.changeIndex(index: 4));
        context.read<CartBloc>().add(CartEvent.insertCart(
              context: context,
              onSuccess: () {
                if (LocalStorage.getToken().isNotEmpty) {
                  context
                      .read<CartBloc>()
                      .add(CartEvent.calculateCartWithCoupon(context: context));
                }

                context
                    .read<ProductBloc>()
                    .add(const ProductEvent.updateState());
              },
            ));
      },
      child: BlurWrap(
        radius: BorderRadius.circular(100.r),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 8.r, vertical: 2.r),
          decoration: BoxDecoration(
              color: colors.bottomBarColor,
              borderRadius: BorderRadius.circular(100.r)),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              16.horizontalSpace,
              SvgPicture.asset(
                "assets/svg/selectBag.svg",
                height: 14.r,
              ),
              8.horizontalSpace,
              Text(
                AppHelper.getTrn(TrKeys.goToCart),
                style: CustomStyle.interNormal(color: colors.white, size: 16),
              ),
              16.horizontalSpace,
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: colors.primary,
                ),
                padding: EdgeInsets.all(12.r),
                child: Text(
                  LocalStorage.getCartList()
                      .where((element) => element.count > 0)
                      .length
                      .toString(),
                  style: CustomStyle.interNormal(color: colors.white, size: 20),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
