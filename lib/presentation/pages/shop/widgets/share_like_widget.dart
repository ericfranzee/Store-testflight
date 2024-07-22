import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ibeauty/application/shop/shop_bloc.dart';
import 'package:ibeauty/domain/service/helper.dart';
import 'package:ibeauty/domain/service/tr_keys.dart';
import 'package:ibeauty/infrastructure/local_storage/local_storage.dart';
import 'package:ibeauty/presentation/components/button/animation_button_effect.dart';
import 'package:ibeauty/presentation/style/theme/theme.dart';

class ShareAndLike extends StatelessWidget {
  final CustomColorSet colors;
  final int shopId;
  final bool likeButton;

  const ShareAndLike(
      {super.key,
      required this.colors,
      required this.shopId,
      this.likeButton = true});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: MediaQuery.paddingOf(context).top + 4, left: 14.r, right: 14.r),
      child: Row(
        children: [
          const Spacer(),
          Container(
            padding: EdgeInsets.all(8.r),
            decoration: BoxDecoration(
                color: colors.white.withOpacity(0.8),
                borderRadius: BorderRadius.circular(10.r)),
            child: BlocBuilder<ShopBloc, ShopState>(
              builder: (context, state) {
                return ButtonEffectAnimation(
                  onTap: () {
                    if (state.shopLink.isNotEmpty) {
                      FlutterShare.share(
                          title: state.shop?.translation?.title ??
                              AppHelper.getTrn(TrKeys.shops),
                          linkUrl: state.shopLink);
                    }
                  },
                  child: SvgPicture.asset(
                    "assets/svg/share.svg",
                    width: 26.r,
                    height: 26.r,
                  ),
                );
              },
            ),
          ),
          10.horizontalSpace,
          if (likeButton)
            Container(
              padding: EdgeInsets.all(8.r),
              decoration: BoxDecoration(
                  color: colors.white.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(10.r)),
              child: BlocBuilder<ShopBloc, ShopState>(
                builder: (context, state) {
                  return ButtonEffectAnimation(
                    onTap: () {
                      LocalStorage.setLikedShopsList(shopId);
                      context
                          .read<ShopBloc>()
                          .add(const ShopEvent.updateState());
                    },
                    child: SvgPicture.asset(
                      LocalStorage.getLikedShopsList().contains(shopId)
                          ? "assets/svg/likeButtom.svg"
                          : "assets/svg/unlike.svg",
                      width: 26.r,
                      height: 26.r,
                    ),
                  );
                },
              ),
            )
        ],
      ),
    );
  }
}
