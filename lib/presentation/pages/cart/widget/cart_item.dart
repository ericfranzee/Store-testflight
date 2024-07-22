import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibeauty/application/cart/cart_bloc.dart';
import 'package:ibeauty/application/products/product_bloc.dart';
import 'package:ibeauty/domain/model/model/product_model.dart';
import 'package:ibeauty/domain/model/response/cart_response.dart';
import 'package:ibeauty/domain/service/helper.dart';
import 'package:ibeauty/domain/service/tr_keys.dart';
import 'package:ibeauty/infrastructure/local_storage/local_storage.dart';
import 'package:ibeauty/presentation/components/button/animation_button_effect.dart';
import 'package:ibeauty/presentation/components/custom_network_image.dart';
import 'package:ibeauty/presentation/route/app_route.dart';
import 'package:ibeauty/presentation/style/style.dart';
import 'package:ibeauty/presentation/style/theme/theme.dart';

class CartItem extends StatelessWidget {
  final CustomColorSet colors;
  final CartDetailProduct? cartItem;
  final String? note;
  final bool isAddAndRemove;
  final bool groupOrder;

  const CartItem(
      {super.key,
      required this.colors,
      required this.cartItem,
      required this.note,
      this.isAddAndRemove = true,  this.groupOrder = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 24.r),
      child: InkWell(
        onTap: () {
          AppRoute.goProductPage(
              context: context,
              product: cartItem?.stocks?.product ?? ProductData());
        },
        child: Row(
          children: [
            Stack(
              children: [
                CustomNetworkImage(
                    url: (cartItem?.galleries?.isNotEmpty ?? false)
                        ? cartItem?.galleries?.first.path ?? ""
                        : cartItem?.stocks?.product?.img ?? "",
                    preview: (cartItem?.galleries?.isNotEmpty ?? false)
                        ? cartItem?.galleries?.first.preview
                        : null,
                    height: 160,
                    width: 100,
                    radius: 16),
                if (cartItem?.bonus ?? false)
                  Container(
                    margin: EdgeInsets.only(top: 8.r),
                    padding:
                        EdgeInsets.symmetric(vertical: 4.r, horizontal: 8.r),
                    decoration: BoxDecoration(
                        color: colors.primary,
                        borderRadius: BorderRadius.circular(100.r)),
                    child: Row(
                      children: [
                        Icon(
                          FlutterRemix.gift_line,
                          color: colors.white,
                          size: 16.r,
                        ),
                        4.horizontalSpace,
                        Text(
                          AppHelper.getTrn(TrKeys.bonus),
                          style: CustomStyle.interNormal(
                              color: colors.white, size: 12),
                        )
                      ],
                    ),
                  )
              ],
            ),
            16.horizontalSpace,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    cartItem?.stocks?.product?.translation?.title ?? "",
                    style: CustomStyle.interNormal(
                        color: colors.textBlack, size: 14),
                  ),
                  if ((cartItem?.stocks?.extras?.isNotEmpty ?? false) &&
                      LocalStorage.getToken().isNotEmpty)
                    ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.zero,
                        itemCount: cartItem?.stocks?.extras?.length ?? 0,
                        itemBuilder: (context, index) {
                          bool typeColor =
                              cartItem?.stocks?.extras?[index].group?.type ==
                                  "color";
                          return Padding(
                            padding: EdgeInsets.only(top: 4.r),
                            child: Text(
                              "${cartItem?.stocks?.extras?[index].group?.translation?.title ?? ""} : ${typeColor ? AppHelper.getNameColor(cartItem?.stocks?.extras?[index].value) : cartItem?.stocks?.extras?[index].value}",
                              style: CustomStyle.interNormal(
                                  color: colors.textBlack, size: 12),
                            ),
                          );
                        }),
                  if ((cartItem?.stocks?.extrasCompare?.isNotEmpty ?? false) &&
                      LocalStorage.getToken().isEmpty)
                    ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.zero,
                        itemCount: cartItem?.stocks?.extrasCompare?.length ?? 0,
                        itemBuilder: (context, index) {
                          bool typeColor = cartItem
                                  ?.stocks?.extrasCompare?[index].group?.type ==
                              "color";
                          return Padding(
                            padding: EdgeInsets.only(top: 4.r),
                            child: Text(
                              "${cartItem?.stocks?.extrasCompare?[index].group?.translation?.title ?? ""} : ${typeColor ? AppHelper.getNameColor(cartItem?.stocks?.extrasCompare?[index].value) : cartItem?.stocks?.extrasCompare?[index].value}",
                              style: CustomStyle.interNormal(
                                  color: colors.textBlack, size: 12),
                            ),
                          );
                        }),
                  if (cartItem?.discount != null && cartItem?.discount != 0)
                    Padding(
                      padding: EdgeInsets.only(top: 4.r),
                      child: Text(
                        AppHelper.numberFormat(
                          number: (cartItem?.price ?? 0),
                        ),
                        style: CustomStyle.interNoSemi(
                            color: CustomStyle.red,
                            size: 14,
                            decoration: TextDecoration.lineThrough),
                      ),
                    ),
                  4.verticalSpace,
                  Text(
                    AppHelper.numberFormat(
                        number: (LocalStorage.getToken().isNotEmpty
                                ? (cartItem?.price ?? 0)
                                : (cartItem?.price ?? 0)) -
                            (cartItem?.discount ?? 0)),
                    style: CustomStyle.interSemi(
                        color: colors.textBlack, size: 16),
                  ),
                  16.verticalSpace,
                  ((cartItem?.bonus ?? false) || !isAddAndRemove)
                      ? Container(
                          padding: EdgeInsets.all(16.r),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: colors.icon)),
                          child: Text(
                            (cartItem?.quantity ?? 0).toString(),
                            style: CustomStyle.interNormal(
                                color: colors.textBlack, size: 20),
                          ),
                        )
                      : Row(
                          children: [
                            ButtonEffectAnimation(
                              onTap: () {
                                AppHelper.removeProduct(
                                    context: context,
                                    product: cartItem?.stocks?.product,
                                    stock: cartItem?.stocks);

                                if (AppHelper.getCountCart(
                                        productId:
                                            cartItem?.stocks?.product?.id,
                                        stockId: cartItem?.stocks?.id) ==
                                    0 && !groupOrder) {
                                  if(LocalStorage.getToken().isEmpty){
                                    context
                                        .read<CartBloc>()
                                        .add(CartEvent.insertCart(
                                      context: context,
                                      refresh: true,
                                      onSuccess: () {
                                        context.read<ProductBloc>().add(
                                            const ProductEvent.updateState());
                                      },
                                    ));
                                    return;
                                  }
                                  context.read<CartBloc>().add(
                                      CartEvent.removeProductCart(
                                          context: context,
                                          cartDetailId: cartItem?.id));
                                  return;
                                }
                                context.read<CartBloc>().add(
                                      CartEvent.insertCart(
                                        context: context,
                                        refresh: true,
                                        onSuccess: () {
                                          if (LocalStorage.getToken()
                                              .isNotEmpty) {
                                            context.read<CartBloc>().add(
                                                CartEvent
                                                    .calculateCartWithCoupon(
                                                        context: context));
                                          }

                                          context.read<ProductBloc>().add(
                                              const ProductEvent.updateState());
                                        },
                                      ),
                                    );
                              },
                              child: Container(
                                padding: EdgeInsets.all(10.r),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: colors.transparent,
                                    border: Border.all(color: colors.icon)),
                                child: Icon(
                                  FlutterRemix.subtract_line,
                                  color: colors.textBlack,
                                ),
                              ),
                            ),
                            6.horizontalSpace,
                            Text(
                              ((cartItem?.quantity ?? 0) *
                                      (cartItem?.stocks?.product?.interval ??
                                          1))
                                  .toString(),
                              style: CustomStyle.interNormal(
                                  color: colors.textBlack, size: 20),
                            ),
                            6.horizontalSpace,
                            ButtonEffectAnimation(
                              onTap: () {
                                AppHelper.addProduct(
                                    context: context,
                                    product: cartItem?.stocks?.product,
                                    stock: cartItem?.stocks);
                                context
                                    .read<CartBloc>()
                                    .add(CartEvent.insertCart(
                                      context: context,
                                      refresh: true,
                                      onSuccess: () {
                                        if (LocalStorage.getToken()
                                            .isNotEmpty) {
                                          context.read<CartBloc>().add(
                                              CartEvent.calculateCartWithCoupon(
                                                  context: context));
                                        }

                                        context.read<ProductBloc>().add(
                                            const ProductEvent.updateState());
                                      },
                                    ));
                              },
                              child: Container(
                                padding: EdgeInsets.all(10.r),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: colors.transparent,
                                    border: Border.all(color: colors.icon)),
                                child: Icon(
                                  FlutterRemix.add_line,
                                  color: colors.textBlack,
                                ),
                              ),
                            ),
                            const Spacer(),
                            ButtonEffectAnimation(
                              onTap: () {
                                AppRoute.goNoteForProduct(
                                    context, cartItem, note);
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: CustomStyle.shimmerBase),
                                padding: EdgeInsets.all(10.r),
                                child: const Icon(FlutterRemix.chat_1_line),
                              ),
                            ),
                            const Spacer(),
                            ButtonEffectAnimation(
                              onTap: () {
                                AppHelper.deleteProduct(
                                    context: context,
                                    product: cartItem?.stocks?.product,
                                    stock: cartItem?.stocks);

                                if (LocalStorage.getToken().isNotEmpty && !groupOrder) {
                                  context.read<CartBloc>().add(
                                      CartEvent.removeProductCart(
                                          context: context,
                                          cartDetailId: cartItem?.id));

                                  context.read<CartBloc>().add(
                                      CartEvent.calculateCartWithCoupon(
                                          context: context));
                                } else {
                                  context
                                      .read<CartBloc>()
                                      .add(CartEvent.insertCart(
                                        context: context,
                                        refresh: true,
                                        onSuccess: () {
                                          context.read<ProductBloc>().add(
                                              const ProductEvent.updateState());
                                        },
                                      ));
                                }
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: CustomStyle.shimmerBase),
                                padding: EdgeInsets.all(10.r),
                                child: const Icon(FlutterRemix.delete_bin_line),
                              ),
                            )
                          ],
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
