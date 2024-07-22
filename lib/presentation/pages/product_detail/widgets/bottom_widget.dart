import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ibeauty/app_constants.dart';
import 'package:ibeauty/application/cart/cart_bloc.dart';
import 'package:ibeauty/application/main/main_bloc.dart';
import 'package:ibeauty/application/product_detail/product_detail_bloc.dart';
import 'package:ibeauty/application/products/product_bloc.dart';
import 'package:ibeauty/domain/model/model/product_model.dart';
import 'package:ibeauty/domain/service/helper.dart';
import 'package:ibeauty/domain/service/tr_keys.dart';
import 'package:ibeauty/infrastructure/local_storage/local_storage.dart';
import 'package:ibeauty/presentation/components/blur_wrap.dart';
import 'package:ibeauty/presentation/components/button/animation_button_effect.dart';
import 'package:ibeauty/presentation/components/button/custom_button.dart';
import 'package:ibeauty/presentation/components/loading.dart';
import 'package:ibeauty/presentation/route/app_route.dart';
import 'package:ibeauty/presentation/route/app_route_setting.dart';
import 'package:ibeauty/presentation/style/style.dart';
import 'package:ibeauty/presentation/style/theme/theme.dart';
import 'package:url_launcher/url_launcher.dart';

class BottomWidget extends StatelessWidget {
  final ProductData? product;
  final Stocks? selectStock;
  final CustomColorSet colors;

  const BottomWidget(
      {super.key,
      required this.colors,
      required this.product,
      required this.selectStock});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.r),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          _connectButton(colors, context),
          22.verticalSpace,
          if ((selectStock?.quantity ?? 0) > 0)
            AppHelper.getCountCart(
                        productId: product?.id, stockId: selectStock?.id) !=
                    0
                ? _blurCart(context)
                : _buyAndCart(context),
          if (!((selectStock?.quantity ?? 0) > 0))
            const SizedBox(
              width: double.infinity,
            )
        ],
      ),
    );
  }

  Widget _blurCart(BuildContext context) {
    return BlurWrap(
      radius: BorderRadius.circular(100.r),
      child: Container(
        padding: EdgeInsets.all(8.r),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100.r),
            color: colors.textBlack.withOpacity(0.3)),
        child: Row(
          children: [
            BlocBuilder<CartBloc, CartState>(
              buildWhen: (p, n) {
                return p.isLoading != n.isLoading;
              },
              builder: (context, state) {
                return ButtonEffectAnimation(
                  onTap: () {
                    if (state.isLoading) {
                      return;
                    }
                    context
                        .read<MainBloc>()
                        .add(const MainEvent.changeIndex(index: 4));
                    context.read<CartBloc>().add(CartEvent.insertCart(
                          context: context,
                          onSuccess: () {
                            if (LocalStorage.getToken().isNotEmpty) {
                              context.read<CartBloc>().add(
                                  CartEvent.calculateCartWithCoupon(
                                      context: context));
                            }

                            context
                                .read<ProductBloc>()
                                .add(const ProductEvent.updateState());
                            Navigator.popUntil(context, (route) {
                              return route.isFirst;
                            });
                          },
                        ));
                  },
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 12.r, horizontal: 24.r),
                    decoration: BoxDecoration(
                      color: CustomStyle.black,
                      borderRadius: BorderRadius.circular(100.r),
                    ),
                    child: state.isLoading
                        ? const Loading(changeColor: true)
                        : Row(
                            children: [
                              SvgPicture.asset(
                                "assets/svg/selectBag.svg",
                                height: 14.r,
                              ),
                              8.horizontalSpace,
                              Text(
                                AppHelper.getTrn(TrKeys.goToCart),
                                style: CustomStyle.interNormal(
                                    color: CustomStyle.white, size: 16),
                              ),
                            ],
                          ),
                  ),
                );
              },
            ),
            const Spacer(),
            ButtonEffectAnimation(
              onTap: () {
                AppHelper.removeProduct(
                    context: context, product: product, stock: selectStock);
                context
                    .read<ProductDetailBloc>()
                    .add(const ProductDetailEvent.updateState());
              },
              child: Container(
                padding: EdgeInsets.all(10.r),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: colors.primary,
                ),
                child: Icon(
                  FlutterRemix.subtract_line,
                  color: colors.white,
                ),
              ),
            ),
            12.horizontalSpace,
            Text(
              (AppHelper.getCountCart(
                          productId: product?.id, stockId: selectStock?.id) *
                      (product?.interval ?? 1))
                  .toString(),
              style: CustomStyle.interNormal(color: colors.white, size: 20),
            ),
            12.horizontalSpace,
            ButtonEffectAnimation(
              onTap: () {
                AppHelper.addProduct(
                    context: context, product: product, stock: selectStock);
                context
                    .read<ProductDetailBloc>()
                    .add(const ProductDetailEvent.updateState());
              },
              child: Container(
                padding: EdgeInsets.all(10.r),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: colors.primary,
                ),
                child: Icon(
                  FlutterRemix.add_line,
                  color: colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buyAndCart(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: BlocBuilder<CartBloc, CartState>(
            buildWhen: (p, n) {
              return p.isLoading != n.isLoading;
            },
            builder: (context, state) {
              return CustomButton(
                title: AppHelper.getTrn(TrKeys.buyNow),
                isLoading: state.isLoading,
                bgColor: colors.primary,
                titleColor: colors.white,
                onTap: () {
                  AppHelper.addProduct(
                      context: context, product: product, stock: selectStock);
                  context
                      .read<MainBloc>()
                      .add(const MainEvent.changeIndex(index: 4));
                  context.read<CartBloc>().add(CartEvent.insertCart(
                        context: context,
                        onSuccess: () {
                          if (LocalStorage.getToken().isNotEmpty) {
                            context.read<CartBloc>().add(
                                CartEvent.calculateCartWithCoupon(
                                    context: context));
                          }

                          context
                              .read<ProductBloc>()
                              .add(const ProductEvent.updateState());
                          Navigator.popUntil(context, (route) {
                            return route.isFirst;
                          });
                        },
                      ));
                },
              );
            },
          ),
        ),
        10.horizontalSpace,
        Expanded(
          child: CustomButton(
            title: AppHelper.getTrn(TrKeys.addToCart),
            bgColor: colors.bottomBarColor,
            titleColor: colors.white,
            onTap: () {
              AppHelper.addProduct(
                  context: context, product: product, stock: selectStock);
              context
                  .read<ProductDetailBloc>()
                  .add(const ProductDetailEvent.updateState());
            },
          ),
        )
      ],
    );
  }

  SpeedDial _connectButton(CustomColorSet colors, BuildContext context) {
    return SpeedDial(
      spacing: 3,
      mini: true,
      childPadding: const EdgeInsets.all(5),
      spaceBetweenChildren: 4,
      dialRoot: (ctx, open, toggleChildren) {
        return ButtonEffectAnimation(
          onTap: toggleChildren,
          child: Container(
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: colors.primary,
                boxShadow: [
                  BoxShadow(
                      color: colors.primary,
                      offset: const Offset(0, 20),
                      blurRadius: 40,
                      spreadRadius: 0)
                ]),
            padding: EdgeInsets.all(16.r),
            child: Icon(
              open ? FlutterRemix.close_line : FlutterRemix.message_3_fill,
              color: colors.white,
              size: 30.r,
            ),
          ),
        );
      },
      elevation: 8.0,
      animationCurve: Curves.elasticInOut,
      isOpenOnStart: false,
      shape: const StadiumBorder(),
      children: [
        SpeedDialChild(
          child: Icon(
            FlutterRemix.message_3_fill,
            color: colors.white,
          ),
          backgroundColor: colors.bottomBarColor,
          onTap: () {
            if (product?.shop?.phone != null) {
              try {
                final Uri smsLaunchUri = Uri(
                  scheme: 'sms',
                  path: product?.shop?.phone,
                  queryParameters: <String, String>{
                    'body': Uri.encodeComponent('Hello '),
                  },
                );
                launchUrl(smsLaunchUri);
              } catch (e) {
                AppHelper.openDialog(context: context, title: e.toString());
              }
              return;
            }
            AppHelper.openDialog(
                context: context,
                title: AppHelper.getTrn(TrKeys.thisShopDontEnterContact));
          },
        ),
        SpeedDialChild(
          child: Icon(
            FlutterRemix.phone_fill,
            color: colors.white,
          ),
          backgroundColor: colors.bottomBarColor,
          onTap: () {
            if (product?.shop?.phone != null) {
              try {
                final Uri smsLaunchUri = Uri(
                  scheme: 'tel',
                  path: product?.shop?.phone,
                );
                launchUrl(smsLaunchUri);
              } catch (e) {
                AppHelper.openDialog(context: context, title: e.toString());
              }
              return;
            }
            AppHelper.openDialog(
                context: context,
                title: AppHelper.getTrn(TrKeys.thisShopDontEnterContact));
          },
        ),
        SpeedDialChild(
          child: Icon(
            FlutterRemix.messenger_fill,
            color: colors.white,
          ),
          backgroundColor: colors.bottomBarColor,
          onTap: () {
            if (LocalStorage.getToken().isEmpty) {
              AppRoute.goLogin(context);
              return;
            }
            AppRouteSetting.goChat(
              context: context,
              senderId: product?.shop?.userId ?? 0,
            );
          },
        ),
        for (int i = 0; i < (product?.shop?.socials?.length ?? 0); i++)
          SpeedDialChild(
            child: Icon(
              AppConstants.socialIcon[product?.shop?.socials?[i].type],
              color: colors.white,
            ),
            backgroundColor: colors.bottomBarColor,
            onTap: () {
              final Uri launchUri =
                  Uri.parse(product?.shop?.socials?[i].content ?? "");
              launchUrl(launchUri);
            },
          )
      ],
    );
  }
}
