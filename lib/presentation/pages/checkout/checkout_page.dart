import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibeauty/app_constants.dart';
import 'package:ibeauty/application/cart/cart_bloc.dart';
import 'package:ibeauty/application/checkout/checkout_bloc.dart';
import 'package:ibeauty/application/main/main_bloc.dart';
import 'package:ibeauty/application/order/order_bloc.dart';
import 'package:ibeauty/application/products/product_bloc.dart';
import 'package:ibeauty/domain/model/model/create_order_model.dart';
import 'package:ibeauty/domain/model/response/payments_response.dart';
import 'package:ibeauty/domain/service/helper.dart';
import 'package:ibeauty/domain/service/tr_keys.dart';
import 'package:ibeauty/infrastructure/local_storage/local_storage.dart';
import 'package:ibeauty/presentation/components/button/animation_button_effect.dart';
import 'package:ibeauty/presentation/components/button/custom_button.dart';
import 'package:ibeauty/presentation/components/custom_scaffold.dart';
import 'package:ibeauty/presentation/route/app_route.dart';
import 'package:ibeauty/presentation/style/style.dart';

import 'package:ibeauty/presentation/style/theme/theme.dart';
import 'widget/custom_circular.dart';
import 'payment_screen.dart';
import 'shipping_screen.dart';
import 'widget/step_screen.dart';
import 'verify_screen.dart';

class CheckoutPage extends StatefulWidget {
  final bool fullDigital;

  const CheckoutPage({super.key, required this.fullDigital});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  Map<int, TextEditingController> comments = {};
  bool checkDigital = true;

  List<Tab> listTabs = [
    Tab(
      child: Text(AppHelper.getTrn(TrKeys.delivered)),
    ),
    Tab(
      child: Text(AppHelper.getTrn(TrKeys.pickup)),
    ),
  ];

  @override
  void initState() {
    if (widget.fullDigital) {
      context
          .read<CheckoutBloc>()
          .add(CheckoutEvent.changeStep(context: context, step: 2));
    }
    tabController = TabController(length: 2, vsync: this)
      ..addListener(() {
        if (tabController.index == 1) {
          context
              .read<CheckoutBloc>()
              .add(const CheckoutEvent.changeActive(active: true));
        } else {
          context
              .read<CheckoutBloc>()
              .add(const CheckoutEvent.changeActive(active: false));
        }
      });
    context
        .read<CartBloc>()
        .state
        .cart
        ?.userCarts
        ?.first
        .cartDetails
        ?.forEach((element) {
      comments.addAll({element.shop?.id ?? 0: TextEditingController()});
    });

    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  createOrder(CheckoutState state, CartState cartState) {
    context.read<OrderBloc>().add(
          OrderEvent.createOrder(
              totalPrice: context.read<CartBloc>().state.cart?.totalPrice ?? 0,
              context: context,
              order: CreateOrderModel(
                paymentId: (state.list?.firstWhere(
                                (element) => element.id == state.selectId,
                                orElse: () {
                              return PaymentData();
                            }) ??
                            PaymentData())
                        .id ??
                    0,
                note: comments,
                coupons: cartState.coupons,
                notes: context.read<CartBloc>().state.notes,
                cartId: context.read<CartBloc>().state.cart?.id ?? 0,
                pointId: state.selectPointId,
                deliveryType: widget.fullDigital
                    ? DeliveryTypeEnum.digital
                    : tabController.index == 0
                        ? DeliveryTypeEnum.delivery
                        : DeliveryTypeEnum.pickup,
                addressId: state.address.isNotEmpty
                    ? state.address[state.selectAddress].id
                    : null,
                deliveryDate: state.deliveryDate,
                deliveryPriceId: (state.deliveryPrice?.isNotEmpty ?? false)
                    ? (state.deliveryPrice?.first.id ?? 0)
                    : 0,
              ),
              onSuccess: () {
                LocalStorage.deleteCartList();
                context
                    .read<ProductBloc>()
                    .add(const ProductEvent.updateState());
                context
                    .read<MainBloc>()
                    .add(const MainEvent.changeIndex(index: 0));
                context.read<CartBloc>().add(CartEvent.checkCoupon(
                    context: context, coupon: "", shopId: 0, clear: true));
                AppRoute.goCongratsPage(context);
                return;
              },
              payment: state.list?.firstWhere(
                      (element) => element.id == state.selectId, orElse: () {
                    return PaymentData();
                  }) ??
                  PaymentData()),
        );
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: (colors) => BlocBuilder<CheckoutBloc, CheckoutState>(
        builder: (context, state) {
          return ListView(
            padding: EdgeInsets.zero,
            children: [
              _appBar(context, colors, state),
              if (state.step == 1)
                ShippingScreen(
                  markers: state.markers,
                  isLoadingPoint: state.isLoadingPoint,
                  colors: colors,
                  tabController: tabController,
                  list: listTabs,
                  listPoints: state.deliveryPoints ?? [],
                  selectPointId: state.selectPointId,
                  listAddress: state.address,
                  isLoading: state.isLoading,
                  selectAddress: state.selectAddress,
                ),
              if (state.step == 2)
                PaymentMethodsScreen(
                  colors: colors,
                  list: state.list ?? [],
                  selectId: state.selectId,
                  select: (int id) {
                    context
                        .read<CheckoutBloc>()
                        .add(CheckoutEvent.changePayment(id: id));
                  },
                ),
              if (state.step == 3)
                VerifyScreen(
                  controllers: comments,
                  colors: colors,
                  dateTime: state.deliveryDate,
                ),
            ],
          );
        },
      ),
      floatingButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingButton: (colors) => _bottom(colors, context),
    );
  }

  Widget _bottom(CustomColorSet colors, BuildContext context) {
    return SizedBox(
      height: 60.r,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.r),
        child: BlocBuilder<CheckoutBloc, CheckoutState>(
          buildWhen: (p, n) {
            return p.step != n.step ||
                p.isActive != n.isActive ||
                p.isLoading != n.isLoading ||
                p.isLoadingPoint != n.isLoadingPoint ||
                p.selectId != n.selectId ||
                p.deliveryDate != n.deliveryDate ||
                p.deliveryPrice?.length != n.deliveryPrice?.length;
          },
          builder: (context, state) {
            return Row(
              children: [
                Expanded(
                  child: ButtonEffectAnimation(
                    onTap: () {
                      if (widget.fullDigital && state.step == 2) {
                        Navigator.pop(context);
                        return;
                      }
                      if (state.step == 1) {
                        Navigator.pop(context);
                        return;
                      }
                      context.read<CheckoutBloc>().add(CheckoutEvent.changeStep(
                          context: context, step: state.step - 1));
                    },
                    child: Container(
                      height: double.infinity,
                      decoration: BoxDecoration(
                          border: Border.all(color: colors.bottomBarColor),
                          color: colors.newBoxColor,
                          borderRadius: BorderRadius.circular(16)),
                      child: Icon(
                        FlutterRemix.arrow_left_s_line,
                        color: colors.textBlack,
                      ),
                    ),
                  ),
                ),
                10.horizontalSpace,
                Expanded(
                  flex: 3,
                  child: BlocBuilder<OrderBloc, OrderState>(
                    builder: (context, stateOrder) {
                      bool active = state.isActive
                          ? (state.deliveryPoints?.isNotEmpty ?? false)
                          : ((state.deliveryPrice?.isNotEmpty ?? false) &&
                              (state.address.isNotEmpty));
                      return BlocBuilder<CartBloc, CartState>(
                        builder: (context, cartState) {
                          return CustomButton(
                              isLoading: stateOrder.isLoading,
                              title: AppHelper.getTrn(state.step == 3
                                  ? TrKeys.confirmAndPay
                                  : TrKeys.next),
                              bgColor:
                                  !active ? colors.newBoxColor : colors.primary,
                              titleColor:
                                  !active ? colors.textBlack : colors.white,
                              onTap: () {
                                if (active) {
                                  checkDigital = true;
                                  if (state.step == 2) {
                                    cartState.cart?.userCarts
                                        ?.forEach((userCart) {
                                      userCart.cartDetails?.forEach((detail) {
                                        detail.cartDetailProducts
                                            ?.forEach((element) {
                                          if (element
                                                  .stocks?.product?.digital ??
                                              false) {
                                            if (state.list?.firstWhere(
                                                    (payment) =>
                                                        payment.id ==
                                                        state.selectId,
                                                    orElse: () {
                                                  return PaymentData();
                                                }).tag ==
                                                "cash") {
                                              AppHelper.openDialog(
                                                  context: context,
                                                  title: AppHelper.getTrn(TrKeys
                                                      .youCannotPayWithCashBecauseThereTheCart));
                                              checkDigital = false;
                                              return;
                                            }
                                          }
                                        });
                                      });
                                    });
                                    context.read<CartBloc>().add(
                                        CartEvent.calculateCart(
                                            fullDigital: widget.fullDigital,
                                            context: context,
                                            deliveryPriceId: (state
                                                        .deliveryPrice
                                                        ?.isNotEmpty ??
                                                    false)
                                                ? state.deliveryPrice?.first.id
                                                : null,
                                            pointId: state.selectPointId));
                                  }
                                  if (state.step == 3) {
                                    createOrder(state, cartState);
                                  }

                                  if (checkDigital) {
                                    context.read<CheckoutBloc>().add(
                                        CheckoutEvent.changeStep(
                                            context: context));
                                  }
                                }
                              });
                        },
                      );
                    },
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _appBar(
    BuildContext context,
    CustomColorSet colors,
    CheckoutState state,
  ) {
    return Container(
      padding: EdgeInsets.only(
        top: MediaQuery.paddingOf(context).top,
      ),
      width: double.infinity,
      decoration: BoxDecoration(
        color: colors.newBoxColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(24.r),
          bottomRight: Radius.circular(24.r),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                AppHelper.getTrn(TrKeys.checkout),
                style: CustomStyle.interSemi(color: colors.textBlack, size: 22),
              ),
            ),
            Stack(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    height: 220.r,
                    child: CustomPaint(
                      painter: ArcPainter(100, 10, state.step),
                    ),
                  ),
                ),
                Positioned(
                    top: 50.r,
                    left: 0,
                    right: 0,
                    child: StepScreen(
                      colors: colors,
                      step: state.step,
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
