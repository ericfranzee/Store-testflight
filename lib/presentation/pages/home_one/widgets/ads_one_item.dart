import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibeauty/app_constants.dart';
import 'package:ibeauty/application/products/product_bloc.dart';
import 'package:ibeauty/domain/model/model/product_model.dart';
import 'package:ibeauty/domain/model/response/ads_response.dart';
import 'package:ibeauty/domain/model/response/banners_paginate_response.dart';
import 'package:ibeauty/domain/service/helper.dart';
import 'package:ibeauty/domain/service/tr_keys.dart';
import 'package:ibeauty/presentation/components/button/animation_button_effect.dart';
import 'package:ibeauty/presentation/components/custom_network_image.dart';
import 'package:ibeauty/presentation/route/app_route.dart';
import 'package:ibeauty/presentation/style/style.dart';
import 'package:ibeauty/presentation/style/theme/theme.dart';

class AdsOneItem extends StatelessWidget {
  final CustomColorSet colors;
  final int colorIndex;
  final AdModel banner;
  final List<ShopAdsPackage> bannerProducts;

  const AdsOneItem(
      {super.key,
      required this.colors,
      required this.colorIndex,
      required this.banner,
      required this.bannerProducts});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppConstants.adsColor[colorIndex % 4].withOpacity(0.5),
          borderRadius: BorderRadius.circular(24.r)),
      padding: EdgeInsets.only(
        top: 24.r,
        bottom: 24.r,
      ),
      width: double.infinity,
      height: 275.r,
      margin: EdgeInsets.symmetric(horizontal: 16.r),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _title(context),
          26.verticalSpace,
          SizedBox(
            height: 155.r,
            child: ListView.builder(
                padding: EdgeInsets.only(left: 16.r),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: bannerProducts.length,
                itemBuilder: (context, shopAdsIndex) {
                  return ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: bannerProducts[shopAdsIndex]
                              .shopAdsProducts
                              ?.length ??
                          0,
                      itemBuilder: (context, index) {
                        return Container(
                          width: 150.r,
                          height: 150.r,
                          padding: EdgeInsets.all(20.r),
                          margin: EdgeInsets.only(right: 10.r),
                          decoration: BoxDecoration(
                              color: colors.backgroundColor,
                              borderRadius: BorderRadius.circular(24.r)),
                          child: _productItem(shopAdsIndex, index, context),
                        );
                      });
                }),
          )
        ],
      ),
    );
  }

  Widget _productItem(int shopAdsIndex, int index, BuildContext context) {
    return ButtonEffectAnimation(
      onTap: () async {
       await AppRoute.goProductPage(
            context: context,
            product: bannerProducts[shopAdsIndex].shopAdsProducts?[index] ??
                ProductData());
       if (context.mounted) {
         context.read<ProductBloc>().add(const ProductEvent.updateState());
       }
      },
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              bannerProducts[shopAdsIndex]
                      .shopAdsProducts?[index]
                      .translation
                      ?.title ??
                  "",
              style: CustomStyle.interNormal(color: colors.textBlack),
              maxLines: 2,
            ),
          ),
          const Spacer(),
          Align(
            alignment: Alignment.centerRight,
            child: CustomNetworkImage(
                url: (bannerProducts[shopAdsIndex]
                            .shopAdsProducts?[index]
                            .galleries
                            ?.isNotEmpty ??
                        false)
                    ? (bannerProducts[shopAdsIndex]
                            .shopAdsProducts?[index]
                            .galleries
                            ?.first
                            .path ??
                        "")
                    : (bannerProducts[shopAdsIndex]
                            .shopAdsProducts?[index]
                            .img ??
                        ""),
                preview: (bannerProducts[shopAdsIndex]
                            .shopAdsProducts?[index]
                            .galleries
                            ?.isNotEmpty ??
                        false)
                    ? (bannerProducts[shopAdsIndex]
                        .shopAdsProducts?[index]
                        .galleries
                        ?.first
                        .preview)
                    : null,
                height: 76,
                width: 76,
                radius: 8),
          )
        ],
      ),
    );
  }

  Widget _title(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16.r, right: 16.r),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                banner.translation?.title ?? "",
                style:
                    CustomStyle.interNoSemi(color: colors.textBlack, size: 22),
              ),
              2.verticalSpace,
              Text(
                banner.translation?.description ?? "",
                style:
                    CustomStyle.interRegular(color: colors.textBlack, size: 12),
              ),
            ],
          ),
          const Spacer(),
          ButtonEffectAnimation(
            onTap: () {
              AppRoute.goAdsBottomSheet(
                  context,
                  BannerData(
                      translation: banner.translation,
                      id: banner.id,
                      galleries: banner.galleries),
                  colors);
            },
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  border: Border.all(color: colors.textBlack)),
              padding: EdgeInsets.symmetric(vertical: 8.r, horizontal: 20.r),
              child: Text(
                AppHelper.getTrn(TrKeys.seeAll),
                style:
                    CustomStyle.interNormal(color: colors.textBlack, size: 14),
              ),
            ),
          )
        ],
      ),
    );
  }
}
