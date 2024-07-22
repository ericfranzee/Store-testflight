import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibeauty/app_constants.dart';
import 'package:ibeauty/application/gift_cart/gift_cart_bloc.dart';
import 'package:ibeauty/domain/model/response/gift_cart_response.dart';
import 'package:ibeauty/domain/service/helper.dart';
import 'package:ibeauty/domain/service/tr_keys.dart';
import 'package:ibeauty/presentation/components/button/animation_button_effect.dart';
import 'package:ibeauty/presentation/components/loading.dart';
import 'package:ibeauty/presentation/components/title.dart';
import 'package:ibeauty/presentation/route/app_route_shop.dart';
import 'package:ibeauty/presentation/style/style.dart';
import 'package:ibeauty/presentation/style/theme/theme.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class GiftCartShopList extends StatefulWidget {
  final CustomColorSet colors;
  final int shopId;

  const GiftCartShopList(
      {super.key, required this.colors, required this.shopId});

  @override
  State<GiftCartShopList> createState() => _GiftCartShopListState();
}

class _GiftCartShopListState extends State<GiftCartShopList> {
  late RefreshController controller;

  @override
  void initState() {
    controller = RefreshController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GiftCartBloc, GiftCartState>(
      builder: (context, state) {
        return state.giftCarts.isEmpty
            ? const SizedBox.shrink()
            : state.isLoading
                ? const Loading()
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      32.verticalSpace,
                      TitleWidget(
                        title: AppHelper.getTrn(TrKeys.giftCarts),
                        titleColor: widget.colors.textBlack,
                      ),
                      16.verticalSpace,
                      SizedBox(
                          height: 172.r,
                          child: SmartRefresher(
                            controller: controller,
                            scrollDirection: Axis.horizontal,
                            enablePullDown: false,
                            enablePullUp: true,
                            onLoading: () {
                              context.read<GiftCartBloc>().add(
                                  GiftCartEvent.fetchGiftCart(
                                      context: context,
                                      shopId: widget.shopId,
                                      controller: controller));
                            },
                            child: ListView.builder(
                                padding: EdgeInsets.symmetric(horizontal: 16.r),
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: state.giftCarts.length,
                                itemBuilder: (context, index) {
                                  return _giftCartItem(
                                      context: context,
                                      giftCart: state.giftCarts[index],
                                      index: index % 11);
                                }),
                          ))
                    ],
                  );
      },
    );
  }

  Widget _giftCartItem(
      {required BuildContext context,
      required GiftCartModel giftCart,
      required int index}) {
    return Padding(
      padding: EdgeInsets.only(right: 8.r),
      child: Container(
        width: 240.r,
        decoration: BoxDecoration(
            border: Border.all(color: widget.colors.icon),
            borderRadius: BorderRadius.circular(16.r)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 100.r,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: AppConstants.serviceColors[index],
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(16.r),
                      topLeft: Radius.circular(16.r))),
              child: Center(
                child: Icon(FlutterRemix.gift_fill, color: widget.colors.white),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        giftCart.translation?.title ?? "",
                        style: CustomStyle.interRegular(
                            color: widget.colors.textBlack),
                      ),
                      Text(
                        "${AppHelper.getTrn(TrKeys.duration)}: ${giftCart.time}",
                        style: CustomStyle.interRegular(
                            color: widget.colors.textBlack),
                      ),
                      Text(
                        AppHelper.numberFormat(number: giftCart.price),
                        style: CustomStyle.interNormal(
                            color: widget.colors.textBlack),
                      ),
                    ],
                  ),
                  ButtonEffectAnimation(
                    onTap: () {
                      AppRouteShop.goGiftCartPaymentBottomSheet(
                          context: context,
                          model: giftCart,
                          colors: widget.colors);
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          vertical: 10.r, horizontal: 16.r),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.r),
                          color: widget.colors.primary),
                      child: Text(
                        AppHelper.getTrn(TrKeys.buy),
                        style:
                            CustomStyle.interNormal(color: widget.colors.white),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
