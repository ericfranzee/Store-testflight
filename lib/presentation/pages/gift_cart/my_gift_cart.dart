import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ibeauty/app_constants.dart';
import 'package:ibeauty/application/gift_cart/gift_cart_bloc.dart';
import 'package:ibeauty/domain/model/response/my_gift_cart_response.dart';
import 'package:ibeauty/domain/service/helper.dart';
import 'package:ibeauty/domain/service/time_service.dart';
import 'package:ibeauty/domain/service/tr_keys.dart';
import 'package:ibeauty/presentation/components/button/pop_button.dart';
import 'package:ibeauty/presentation/components/custom_scaffold.dart';
import 'package:ibeauty/presentation/components/loading.dart';
import 'package:ibeauty/presentation/style/style.dart';
import 'package:ibeauty/presentation/style/theme/theme.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class MyGiftCartPage extends StatefulWidget {
  const MyGiftCartPage({super.key});

  @override
  State<MyGiftCartPage> createState() => _MyGiftCartPageState();
}

class _MyGiftCartPageState extends State<MyGiftCartPage> {
  late RefreshController giftCartRefresh;

  @override
  void initState() {
    giftCartRefresh = RefreshController();
    super.initState();
  }

  @override
  void dispose() {
    giftCartRefresh.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: (colors) => SafeArea(
        bottom: false,
        child: Column(
          children: [
            Text(
              AppHelper.getTrn(TrKeys.myGiftCarts),
              style: CustomStyle.interNoSemi(color: colors.textBlack, size: 18),
            ),
            24.verticalSpace,
            BlocBuilder<GiftCartBloc, GiftCartState>(
              builder: (context, state) {
                return Expanded(
                  child: state.isLoading
                      ? const Loading()
                      : state.myGiftCarts.isNotEmpty
                          ? SmartRefresher(
                              controller: giftCartRefresh,
                              enablePullUp: true,
                              onRefresh: () {
                                context.read<GiftCartBloc>().add(
                                    GiftCartEvent.myGiftCart(
                                        context: context,
                                        isRefresh: true,
                                        controller: giftCartRefresh));
                              },
                              onLoading: () {
                                context.read<GiftCartBloc>().add(
                                    GiftCartEvent.myGiftCart(
                                        context: context,
                                        controller: giftCartRefresh));
                              },
                              child: ListView.builder(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 16.r),
                                  shrinkWrap: true,
                                  itemCount: state.myGiftCarts.length,
                                  itemBuilder: (context, index) {
                                    return _giftItem(
                                        context: context,
                                        myGiftCart: state.myGiftCarts[index],
                                        index: index,
                                        colors: colors);
                                  }),
                            )
                          : Column(
                              children: [
                                32.verticalSpace,
                                SvgPicture.asset("assets/svg/noMembership.svg"),
                                32.verticalSpace,
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 32.r),
                                  child: Text(
                                    AppHelper.getTrn(
                                        TrKeys.youHaveNoMembership),
                                    textAlign: TextAlign.center,
                                    style: CustomStyle.interNoSemi(
                                        color: colors.textBlack, size: 30),
                                  ),
                                ),
                                16.verticalSpace,
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 32.r),
                                  child: Text(
                                    AppHelper.getTrn(TrKeys
                                        .youDontHaveAnyMembershipMaybeYouWillGetMembershipSoon),
                                    textAlign: TextAlign.center,
                                    style: CustomStyle.interRegular(
                                        color: colors.textBlack, size: 16),
                                  ),
                                ),
                              ],
                            ),
                );
              },
            )
          ],
        ),
      ),
      floatingButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingButton: (colors) => PopButton(colors: colors),
    );
  }

  Widget _giftItem({
    required BuildContext context,
    required MyGiftCartModel myGiftCart,
    required int index,
    required CustomColorSet colors,
  }) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.r),
      child: Container(
        width: 240.r,
        decoration: BoxDecoration(
            border: Border.all(color: colors.icon),
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
                child: Icon(FlutterRemix.gift_fill, color: colors.white),
              ),
            ),
            Padding(
              padding:  EdgeInsets.all(16.r),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    myGiftCart.giftCart?.translation?.title ?? "",
                    style:
                        CustomStyle.interRegular(color: colors.textBlack),
                  ),
                  6.verticalSpace,
                  Text(
                    "${AppHelper.getTrn(TrKeys.expiredAt)}: ${TimeService.dateFormatMDYHm(myGiftCart.expiredAt)}",
                    style: CustomStyle.interRegular(color: colors.textBlack),
                  ),
                  6.verticalSpace,
                  Text(
                    AppHelper.numberFormat(
                        number: myGiftCart.giftCart?.price),
                    style: CustomStyle.interNormal(color: colors.textBlack),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
