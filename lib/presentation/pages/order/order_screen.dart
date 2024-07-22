import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibeauty/application/order/order_bloc.dart';
import 'package:ibeauty/domain/model/model/order_model.dart';
import 'package:ibeauty/domain/service/helper.dart';
import 'package:ibeauty/domain/service/tr_keys.dart';
import 'package:ibeauty/infrastructure/local_storage/local_storage.dart';
import 'package:ibeauty/presentation/components/custom_network_image.dart';
import 'package:ibeauty/presentation/components/keyboard_dismisser.dart';
import 'package:ibeauty/presentation/components/loading.dart';
import 'package:ibeauty/presentation/pages/checkout/widget/checkout_product_item.dart';
import 'package:ibeauty/presentation/pages/order/widgets/deliveryman_widget.dart';
import 'package:ibeauty/presentation/pages/order/widgets/location_widget.dart';
import 'package:ibeauty/presentation/pages/order/widgets/order_bottom.dart';
import 'package:ibeauty/presentation/pages/order/widgets/order_status.dart';
import 'package:ibeauty/presentation/pages/order/widgets/order_title.dart';
import 'package:ibeauty/presentation/pages/order/widgets/price_info.dart';
import 'package:ibeauty/presentation/pages/order/widgets/tracking_widget.dart';
import 'package:ibeauty/presentation/route/app_route_setting.dart';
import 'package:ibeauty/presentation/style/style.dart';
import 'package:ibeauty/presentation/style/theme/theme.dart';
import 'package:ibeauty/presentation/style/theme/theme_warpper.dart';
import 'package:lottie/lottie.dart';

class OrderScreen extends StatelessWidget {
  final ScrollController controller;

  const OrderScreen({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(builder: (colors, con) {
      return KeyboardDismisser(
        isLtr: LocalStorage.getLangLtr(),
        child: Stack(
          children: [
            Positioned(
              top: 0,
              child: GestureDetector(
                onTap: () {
                  AppRouteSetting.goGamePage(context: context);
                },
                child: Container(
                  margin: MediaQuery.viewInsetsOf(context),
                  width: MediaQuery.sizeOf(context).width,
                  height: 64.r,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(colors: [
                      CustomStyle.primary,
                      CustomStyle.starColor,
                    ]),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(24.r),
                      topLeft: Radius.circular(24.r),
                    ),
                  ),
                  padding: EdgeInsets.only(
                    top: 8.r,
                    left: 16.r,
                    right: 16.r,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Icon(
                        FlutterRemix.gamepad_fill,
                        color: CustomStyle.white,
                      ),
                      8.horizontalSpace,
                      Text(
                        AppHelper.getTrn(TrKeys.wantToPlayGame),
                        style:
                            CustomStyle.interNormal(color: CustomStyle.white),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 32.r),
              child: Container(
                margin: MediaQuery.viewInsetsOf(context),
                width: MediaQuery.sizeOf(context).width,
                decoration: BoxDecoration(
                  color: colors.newBoxColor,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(24.r),
                    topLeft: Radius.circular(24.r),
                  ),
                ),
                padding: EdgeInsets.only(
                  left: 16.r,
                  right: 16.r,
                ),
                child: BlocBuilder<OrderBloc, OrderState>(
                  builder: (context, state) {
                    return state.anotherOrder
                        ? _anotherOrder(colors)
                        : state.isLoading && state.order == null
                            ? const Loading()
                            : _orderDetail(state, colors);
                  },
                ),
              ),
            ),
          ],
        ),
      );
    });
  }

  ListView _orderDetail(OrderState state, CustomColorSet colors) {
    return ListView(
      controller: controller,
      padding: EdgeInsets.symmetric(vertical: 24.r),
      children: [
        OrderTitle(
            order: (state.order?.orderShops?.isNotEmpty ?? false)
                ? state.order?.orderShops?.last
                : null,
            colors: colors),
        10.verticalSpace,
        state.isLoading
            ? const Loading()
            : ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                itemCount: state.order?.orderShops?.length ?? 0,
                itemBuilder: (context, index) {
                  return Theme(
                    data: Theme.of(context).copyWith(
                        dividerColor: CustomStyle.transparent,
                        primaryColor: colors.textBlack,
                        colorScheme: Theme.of(context).colorScheme.copyWith(
                            secondary: colors.textBlack,
                            primary: colors.textBlack)),
                    child: ExpansionTile(
                      title:
                          _shopTitle(state.order?.orderShops?[index], colors),
                      tilePadding: EdgeInsets.zero,
                      children: [
                        _order(state.order?.orderShops?[index], colors)
                      ],
                    ),
                  );
                }),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.r),
          child: Divider(
            color: colors.textHint,
          ),
        ),
        16.verticalSpace,
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.r),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppHelper.getTrn(TrKeys.total),
                style: CustomStyle.interBold(color: colors.textBlack, size: 14),
              ),
              Text(
                AppHelper.numberFormat(
                    number: (state.order?.orderShops?.fold(0.0,
                        (e, element) => (e ?? 0) + (element.totalPrice ?? 0)))),
                style: CustomStyle.interBold(color: colors.textBlack, size: 14),
              ),
            ],
          ),
        ),
        24.verticalSpace,
      ],
    );
  }

  Widget _order(OrderShops? order, CustomColorSet colors) {
    return Column(
      children: [
        16.verticalSpace,
        OrderStatus(
          colors: colors,
          status: order?.status,
          createAt: order?.createdAt,
          notes: order?.notes,
        ),
        if (order?.deliveryMan != null)
          DeliverymanWidget(
              status: order?.status,
              colors: colors,
              orderId: order?.id,
              deliveryman: order?.deliveryMan),
        if (order?.trackId != null)
          TrackingWidget(
            colors: colors,
            trackName: order?.trackName ?? "",
            trackId: order?.trackId ?? "",
            trackUrl: order?.trackUrl ?? "",
          ),
        LocationWidget(
          colors: colors,
          order: order,
        ),
        24.verticalSpace,
        ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: order?.details?.length ?? 0,
            padding: EdgeInsets.only(top: 24.r),
            itemBuilder: (context, index) {
              final detail = order?.details?[index];
              return CheckoutProductItem(
                colors: colors,
                cartItem: detail,
              );
            }),
        if (order?.note != null)
          Padding(
            padding: EdgeInsets.only(
              top: 20.r,
            ),
            child: Text(
              order?.note ?? "",
              style: CustomStyle.interRegular(
                  color: colors.textBlack,
                  size: 14,
                  fontStyle: FontStyle.italic),
            ),
          ),
        24.verticalSpace,
        PriceInfo(colors: colors, order: order),
        OrderBottom(order: order, colors: colors),
        8.verticalSpace,
      ],
    );
  }

  Widget _shopTitle(OrderShops? order, CustomColorSet colors) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
              shape: BoxShape.circle, border: Border.all(color: colors.icon)),
          child: CustomNetworkImage(
              url: order?.shop?.logoImg ?? "",
              height: 48,
              width: 48,
              radius: 24),
        ),
        16.horizontalSpace,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SizedBox(
                  width: 100.r,
                  child: Text(
                    order?.shop?.translation?.title ?? "",
                    style: CustomStyle.interNormal(color: colors.textBlack),
                  ),
                ),
                8.horizontalSpace,
                if (order?.shop?.deliveryTime != null)
                  Text(
                    "(${order?.shop?.deliveryTime?.from} - ${order?.shop?.deliveryTime?.to} ${AppHelper.getTrn(order?.shop?.deliveryTime?.type ?? "")})",
                    style: CustomStyle.interNormal(
                        color: colors.textHint, size: 12),
                  ),
              ],
            ),
            Text(
              "${AppHelper.getTrn(TrKeys.id)}: ${order?.id ?? ""}",
              style: CustomStyle.interRegular(color: colors.textHint),
            ),
          ],
        )
      ],
    );
  }

  Column _anotherOrder(CustomColorSet colors) {
    return Column(
      children: [
        16.verticalSpace,
        Lottie.asset("assets/lottie/order_not.json"),
        8.verticalSpace,
        Text(
          AppHelper.getTrn(TrKeys.thisOrderIsNotYourPersonalOrder),
          style: CustomStyle.interNormal(color: colors.textBlack),
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}
