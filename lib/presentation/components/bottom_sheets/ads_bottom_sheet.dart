import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibeauty/application/banner/banner_bloc.dart';
import 'package:ibeauty/domain/model/model/product_model.dart';
import 'package:ibeauty/domain/model/response/banners_paginate_response.dart';
import 'package:ibeauty/domain/service/helper.dart';
import 'package:ibeauty/domain/service/tr_keys.dart';
import 'package:ibeauty/presentation/style/style.dart';
import 'package:ibeauty/presentation/style/theme/theme.dart';

import '../blur_wrap.dart';
import '../custom_network_image.dart';
import '../loading.dart';
import '../product_items/vertical_product_item.dart';

class AdsBottomSheet extends StatelessWidget {
  final BannerData look;
  final CustomColorSet colors;

  const AdsBottomSheet({super.key, required this.look, required this.colors});

  @override
  Widget build(BuildContext context) {
    return BlurWrap(
      radius: BorderRadius.only(
        topRight: Radius.circular(24.r),
        topLeft: Radius.circular(24.r),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: colors.newBoxColor,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(24.r),
            topLeft: Radius.circular(24.r),
          ),
        ),
        padding: EdgeInsets.all(16.r),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            CustomNetworkImage(
                url: (look.galleries?.first.path ?? ""),
                preview: look.galleries?.first.preview,
                height: 300,
                width: double.infinity,
                radius: 24),
            16.verticalSpace,
            Text(
              look.translation?.description ?? "",
              style: CustomStyle.interNormal(
                color: colors.textBlack,
                size: 18,
              ),
            ),
            16.verticalSpace,
            BlocBuilder<BannerBloc, BannerState>(
              buildWhen: (p, n) {
                return p.isLoadingProduct != n.isLoadingProduct;
              },
              builder: (context, state) {
                return state.isLoadingProduct
                    ? const Loading()
                    : ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: state.shopAds.length,
                        itemBuilder: (context, index) {
                          return ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: state
                                      .shopAds[index].shopAdsProducts?.length ??
                                  0,
                              itemBuilder: (context, productIndex) {
                                return VerticalProductItem(
                                  product: state.shopAds[index]
                                          .shopAdsProducts?[productIndex] ??
                                      ProductData(), addAndRemove: () {
                                    context.read<BannerBloc>().add(const BannerEvent.updateProduct());
                                },
                                );
                              });
                        });
              },
            ),
            const Divider(),
            Text(
              AppHelper.getTrn(TrKeys.description),
              style: CustomStyle.interNormal(
                color: colors.textBlack,
                size: 16,
              ),
            ),
            8.verticalSpace,
            Text(
              look.translation?.description ?? "",
              style: CustomStyle.interRegular(
                color: colors.textBlack,
                size: 14,
              ),
            ),
            24.verticalSpace,
          ],
        ),
      ),
    );
  }
}
