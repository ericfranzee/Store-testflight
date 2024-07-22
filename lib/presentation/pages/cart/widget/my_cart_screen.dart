import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibeauty/domain/model/response/cart_response.dart';
import 'package:ibeauty/domain/model/response/product_calculate_response.dart';
import 'package:ibeauty/domain/service/helper.dart';
import 'package:ibeauty/domain/service/tr_keys.dart';
import 'package:ibeauty/infrastructure/local_storage/local_storage.dart';
import 'package:ibeauty/presentation/components/custom_network_image.dart';
import 'package:ibeauty/presentation/pages/cart/widget/cart_item.dart';
import 'package:ibeauty/presentation/style/style.dart';
import 'package:ibeauty/presentation/style/theme/theme.dart';

import 'coupon.dart';

class MyCartScreen extends StatelessWidget {
  final CustomColorSet colors;
  final List<CartDetail>? cartDetails;
  final List<ProductNote>? notes;
  final List<ShopElement>? shopsProduct;

  const MyCartScreen({
    super.key,
    required this.colors,
    required this.cartDetails,
    this.shopsProduct,
    this.notes,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.r),
      decoration: BoxDecoration(
        color: colors.backgroundColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(24.r),
          bottomRight: Radius.circular(24.r),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          32.verticalSpace,
          Text(
            AppHelper.getTrn(TrKeys.myCart),
            style: CustomStyle.interNoSemi(color: colors.textBlack, size: 16),
          ),
          16.verticalSpace,
          shopsProduct == null ? _cart() : _productCalculate(),
          32.verticalSpace,
        ],
      ),
    );
  }

  Widget _cart() {
    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: cartDetails?.length ?? 0,
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) {
          final cartDetailProduct = cartDetails?[index].cartDetailProducts;
          return Theme(
            data: Theme.of(context).copyWith(
                dividerColor: CustomStyle.transparent,
                primaryColor: colors.textBlack,
                colorScheme: Theme.of(context).colorScheme.copyWith(
                    secondary: colors.textBlack, primary: colors.textBlack)),
            child: ExpansionTile(
              tilePadding: EdgeInsets.zero,
              title: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: colors.icon)),
                    child: CustomNetworkImage(
                        url: cartDetails?[index].shop?.logoImg ?? "",
                        height: 48,
                        width: 48,
                        radius: 24),
                  ),
                  16.horizontalSpace,
                  SizedBox(
                    width: 100.r,
                    child: Text(
                      cartDetails?[index].shop?.translation?.title ?? "",
                      style: CustomStyle.interNormal(color: colors.textBlack),
                    ),
                  ),
                  8.horizontalSpace,
                  if (cartDetails?[index].shop?.deliveryTime != null)
                    Text(
                      "(${AppHelper.getTrn(TrKeys.est)} ${cartDetails?[index].shop?.deliveryTime?.from} - ${cartDetails?[index].shop?.deliveryTime?.to} ${AppHelper.getTrn(cartDetails?[index].shop?.deliveryTime?.type ?? "")})",
                      style: CustomStyle.interNormal(
                          color: colors.textHint, size: 14),
                    ),
                ],
              ),
              children: [
                ListView.builder(
                    padding: EdgeInsets.only(top: 16.r),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: cartDetailProduct?.length ?? 0,
                    itemBuilder: (context, i) {
                      return CartItem(
                        colors: colors,
                        cartItem: cartDetailProduct?[i],
                        note: notes?.firstWhere(
                            (e) =>
                                e.stockId == cartDetailProduct?[i].stocks?.id,
                            orElse: () {
                          return ProductNote();
                        }).comment,
                      );
                    }),
                if (LocalStorage.getToken().isNotEmpty)
                  Padding(
                      padding: EdgeInsets.only(
                          bottom:
                              LocalStorage.getToken().isNotEmpty ? 24.r : 0),
                      child: CouponWidget(
                        colors: colors,
                        shopId: cartDetails?[index].shop?.id ?? 0,
                      )),
              ],
            ),
          );
        });
  }

  Widget _productCalculate() {
    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: shopsProduct?.length ?? 0,
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) {
          final shopsOrder = shopsProduct?[index];
          return Theme(
            data: Theme.of(context).copyWith(
                dividerColor: CustomStyle.transparent,
                primaryColor: colors.textBlack,
                colorScheme: Theme.of(context).colorScheme.copyWith(
                    secondary: colors.textBlack, primary: colors.textBlack)),
            child: ExpansionTile(
              tilePadding: EdgeInsets.zero,
              title: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: colors.icon)),
                    child: CustomNetworkImage(
                        url: shopsOrder?.shop?.logoImg ?? "",
                        height: 48,
                        width: 48,
                        radius: 24),
                  ),
                  16.horizontalSpace,
                  SizedBox(
                    width: 100.r,
                    child: Text(
                      shopsOrder?.shop?.translation?.title ?? "",
                      style: CustomStyle.interNormal(color: colors.textBlack),
                    ),
                  ),
                  8.horizontalSpace,
                  if (cartDetails?[index].shop?.deliveryTime != null)
                    Text(
                      "(${AppHelper.getTrn(TrKeys.est)} ${cartDetails?[index].shop?.deliveryTime?.from} - ${cartDetails?[index].shop?.deliveryTime?.to} ${AppHelper.getTrn(cartDetails?[index].shop?.deliveryTime?.type ?? "")})",
                      style: CustomStyle.interNormal(
                          color: colors.textHint, size: 14),
                    ),
                ],
              ),
              children: [
                ListView.builder(
                    padding: EdgeInsets.only(top: 16.r),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: shopsOrder?.stocks?.length ?? 0,
                    itemBuilder: (context, i) {
                      return CartItem(
                        colors: colors,
                        cartItem: CartDetailProduct(
                            quantity: shopsOrder?.stocks?[i].quantity,
                            price: shopsOrder?.stocks?[i].price,
                            discount: shopsOrder?.stocks?[i].discount,
                            stocks: shopsOrder?.stocks?[i].stock,
                            galleries: shopsOrder
                                ?.stocks?[i].stock?.product?.galleries),
                        note: "",
                      );
                    }),
                if (LocalStorage.getToken().isNotEmpty)
                  Padding(
                      padding: EdgeInsets.only(
                          bottom:
                              LocalStorage.getToken().isNotEmpty ? 24.r : 0),
                      child: CouponWidget(
                        colors: colors,
                        shopId: cartDetails?[index].shop?.id ?? 0,
                      )),
              ],
            ),
          );
        });
  }
}
