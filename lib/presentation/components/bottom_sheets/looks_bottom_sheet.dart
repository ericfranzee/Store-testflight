import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibeauty/application/banner/banner_bloc.dart';
import 'package:ibeauty/domain/model/response/banners_paginate_response.dart';
import 'package:ibeauty/domain/service/helper.dart';
import 'package:ibeauty/domain/service/tr_keys.dart';
import 'package:ibeauty/presentation/components/loading.dart';
import 'package:ibeauty/presentation/style/style.dart';
import 'package:ibeauty/presentation/style/theme/theme.dart';

import '../blur_wrap.dart';
import '../button/custom_button.dart';
import '../custom_network_image.dart';
import '../product_items/vertical_product_item.dart';

class LooksBottomSheet extends StatelessWidget {
  final BannerData look;
  final CustomColorSet colors;

  const LooksBottomSheet({super.key, required this.look, required this.colors});

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
        child: SingleChildScrollView(
          child: Column(
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
                          itemCount: state.products.length,
                          itemBuilder: (context, index) {
                            return VerticalProductItem(
                              product: state.products[index],
                              addAndRemove: () {
                                context
                                    .read<BannerBloc>()
                                    .add(const BannerEvent.updateProduct());
                              },
                            );
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
              BlocBuilder<BannerBloc, BannerState>(
                buildWhen: (p, n) {
                  return false;
                },
                builder: (context, state) {
                  return CustomButton(
                      title: AppHelper.getTrn(TrKeys.buyAllProduct),
                      bgColor: CustomStyle.black,
                      titleColor: CustomStyle.white,
                      onTap: () {
                        for (var element in state.products) {
                          AppHelper.addProduct(
                              context: context,
                              product: element,
                              stock: element.stocks?.first);
                        }
                        Navigator.pop(context);
                      });
                },
              ),
              16.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }
}
