import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibeauty/application/service/service_bloc.dart';
import 'package:ibeauty/domain/model/response/categories_paginate_response.dart';
import 'package:ibeauty/domain/service/helper.dart';
import 'package:ibeauty/domain/service/tr_keys.dart';
import 'package:ibeauty/presentation/components/button/animation_button_effect.dart';
import 'package:ibeauty/presentation/components/button/custom_button.dart';
import 'package:ibeauty/presentation/components/custom_network_image.dart';
import 'package:ibeauty/presentation/components/service_item.dart';
import 'package:ibeauty/presentation/route/app_route_service.dart';
import 'package:ibeauty/presentation/style/style.dart';
import 'package:ibeauty/presentation/style/theme/theme.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ServicesWidget extends StatefulWidget {
  final CustomColorSet colors;
  final int shopId;

  const ServicesWidget({super.key, required this.colors, required this.shopId});

  @override
  State<ServicesWidget> createState() => _ServicesWidgetState();
}

class _ServicesWidgetState extends State<ServicesWidget> {
  late RefreshController refreshController;

  @override
  void initState() {
    refreshController = RefreshController();
    super.initState();
  }

  @override
  void dispose() {
    refreshController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        24.verticalSpace,
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.r),
          child: Text(
            AppHelper.getTrn(TrKeys.servicesOffered),
            style: CustomStyle.interNoSemi(
                color: widget.colors.textBlack, size: 22),
          ),
        ),
        20.verticalSpace,
        BlocBuilder<ServiceBloc, ServiceState>(
          builder: (context, state) {
            return SizedBox(
              height: 40.r,
              child: SmartRefresher(
                controller: refreshController,
                scrollDirection: Axis.horizontal,
                enablePullUp: true,
                enablePullDown: false,
                onLoading: () {
                  context
                      .read<ServiceBloc>()
                      .add(ServiceEvent.fetchCategoryServices(
                        context: context,
                        controller: refreshController,
                      ));
                },
                child: ListView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 16.r),
                    scrollDirection: Axis.horizontal,
                    itemCount: state.categoryServices.length + 1,
                    itemBuilder: (context, index) {
                      return index == 0
                          ? ButtonEffectAnimation(
                              onTap: () {
                                context.read<ServiceBloc>().add(
                                    ServiceEvent.selectServiceCategory(
                                        index: index));
                              },
                              child: Container(
                                margin: EdgeInsets.only(right: 10.r),
                                padding: EdgeInsets.symmetric(horizontal: 16.r),
                                height: 40.r,
                                decoration: BoxDecoration(
                                  color: index == state.selectIndex
                                      ? widget.colors.textBlack
                                      : widget.colors.transparent,
                                  border: Border.all(
                                      color: widget.colors.textBlack),
                                  borderRadius: BorderRadius.circular(10.r),
                                ),
                                child: Row(
                                  children: [
                                    Text(
                                      AppHelper.getTrn(TrKeys.all),
                                      style: CustomStyle.interRegular(
                                          color: index == state.selectIndex
                                              ? widget.colors.textWhite
                                              : widget.colors.textBlack,
                                          size: 16),
                                    )
                                  ],
                                ),
                              ),
                            )
                          : ButtonEffectAnimation(
                              onTap: () {
                                AppRouteService.goServiceListPage(
                                    context: context,
                                    shopId: widget.shopId,
                                    categoryId:
                                        state.categoryServices[index - 1].id);
                              },
                              child: _categoryItem(
                                  category: state.categoryServices[index - 1],
                                  select: state.selectIndex == index),
                            );
                    }),
              ),
            );
          },
        ),
        BlocBuilder<ServiceBloc, ServiceState>(
          builder: (context, state) {
            return ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 16.r),
                itemCount: state.services.length,
                itemBuilder: (context, index) {
                  return ServiceItem(
                    shopId: widget.shopId,
                    colors: widget.colors,
                    service: state.services[index],
                    bookButton: false,
                  );
                });
          },
        ),
        16.verticalSpace,
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.r),
          child: CustomButton(
              title: AppHelper.getTrn(TrKeys.viewAll),
              bgColor: widget.colors.transparent,
              titleColor: widget.colors.textBlack,
              borderColor: widget.colors.textBlack,
              onTap: () {
                AppRouteService.goServiceListPage(
                    context: context, shopId: widget.shopId);
              }),
        )
      ],
    );
  }

  Widget _categoryItem({required CategoryData category, required bool select}) {
    return Container(
      margin: EdgeInsets.only(right: 10.r),
      padding: EdgeInsets.symmetric(horizontal: 16.r),
      height: 40.r,
      decoration: BoxDecoration(
        color: select ? widget.colors.textBlack : widget.colors.transparent,
        border: Border.all(color: widget.colors.textBlack),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Row(
        children: [
          CustomNetworkImage(url: category.img ?? "", height: 20, width: 20),
          10.horizontalSpace,
          Text(
            category.translation?.title ?? "",
            style: CustomStyle.interRegular(
                color:
                    select ? widget.colors.textWhite : widget.colors.textBlack,
                size: 16),
          )
        ],
      ),
    );
  }
}
