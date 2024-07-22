import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibeauty/app_constants.dart';
import 'package:ibeauty/application/filter/filter_bloc.dart';
import 'package:ibeauty/application/shop/shop_bloc.dart';
import 'package:ibeauty/domain/model/model/filter_shop_model.dart';
import 'package:ibeauty/domain/model/model/location_model.dart';
import 'package:ibeauty/domain/model/model/tag_model.dart';
import 'package:ibeauty/domain/service/helper.dart';
import 'package:ibeauty/domain/service/tr_keys.dart';
import 'package:ibeauty/infrastructure/local_storage/local_storage.dart';
import 'package:ibeauty/presentation/components/blur_wrap.dart';
import 'package:ibeauty/presentation/components/button/custom_button.dart';
import 'package:ibeauty/presentation/components/custom_textformfield.dart';
import 'package:ibeauty/presentation/components/keyboard_dismisser.dart';
import 'package:ibeauty/presentation/components/loading.dart';
import 'package:ibeauty/presentation/style/style.dart';
import 'package:ibeauty/presentation/style/theme/theme.dart';

class FilterShopPage extends StatefulWidget {
  final ScrollController controller;
  final CustomColorSet colors;
  final FilterShopModel? filter;
  final bool isNear;
  final LocationModel? location;
  final int? categoryId;

  const FilterShopPage({
    Key? key,
    required this.controller,
    required this.colors,
    this.filter,
    required this.isNear,
    this.location,
    this.categoryId,
  }) : super(key: key);

  @override
  State<FilterShopPage> createState() => _FilterShopPageState();
}

class _FilterShopPageState extends State<FilterShopPage> {
  late TextEditingController minPrice;
  late TextEditingController maxPrice;

  @override
  void initState() {
    minPrice =
        TextEditingController(text: "${widget.filter?.serviceMinPrice ?? ''}");
    maxPrice =
        TextEditingController(text: "${widget.filter?.serviceMaxPrice ?? ''}");
    super.initState();
  }

  @override
  void dispose() {
    minPrice.dispose();
    maxPrice.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlurWrap(
      radius: BorderRadius.only(
        topRight: Radius.circular(24.r),
        topLeft: Radius.circular(24.r),
      ),
      child: KeyboardDismisser(
        isLtr: LocalStorage.getLangLtr(),
        child: Container(
          decoration: BoxDecoration(
            color: widget.colors.backgroundColor,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(24.r),
              topLeft: Radius.circular(24.r),
            ),
          ),
          child: BlocBuilder<FilterBloc, FilterState>(
            builder: (context, state) {
              return Stack(
                children: [
                  SingleChildScrollView(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.paddingOf(context).bottom + 8.r,
                        left: 16.r,
                        right: 16.r),
                    controller: widget.controller,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        8.verticalSpace,
                        Center(
                          child: Container(
                            height: 4.r,
                            width: 48.r,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100.r),
                              color: widget.colors.icon,
                            ),
                          ),
                        ),
                        24.verticalSpace,
                        _sort(),
                        10.verticalSpace,
                        _serviceType(),
                        10.verticalSpace,
                        _price(),
                        10.verticalSpace,
                        _amenities(),
                        10.verticalSpace,
                        _gender(),
                        24.verticalSpace,
                        CustomButton(
                            title: AppHelper.getTrn(TrKeys.apply),
                            bgColor: widget.colors.primary,
                            titleColor: CustomStyle.white,
                            onTap: () {
                              Navigator.pop(context);
                              bool empty = state.sort == null &&
                                  state.tagId == null &&
                                  state.serviceType == null &&
                                  state.genderIndex == 2 &&
                                  ((double.tryParse(minPrice.text) ?? 0) ==
                                      0) &&
                                  ((double.tryParse(maxPrice.text) ?? 0) == 0);
                              final filter = FilterShopModel(
                                type: empty
                                    ? null
                                    : widget.isNear
                                        ? TrKeys.nearByShop
                                        : TrKeys.allShops,
                                sort: state.sort,
                                serviceMaxPrice: double.tryParse(maxPrice.text),
                                serviceMinPrice: double.tryParse(minPrice.text),
                                tag: TagModel(id: state.tagId),
                                serviceType: state.serviceType,
                                gender: state.genderIndex,
                              );
                              context.read<ShopBloc>()
                                ..add(widget.isNear
                                    ? ShopEvent.fetchNearShops(
                                        isRefresh: true,
                                        context: context,
                                        onSuccess: () {},
                                        category: widget.categoryId,
                                        location: widget.location ??
                                            LocationModel(
                                              latitude:
                                                  AppHelper.getInitialLatitude()
                                                      .toString(),
                                              longitude: AppHelper
                                                      .getInitialLongitude()
                                                  .toString(),
                                            ),
                                        filter: filter)
                                    : ShopEvent.fetchShops(
                                        context: context,
                                        isRefresh: true,
                                        filter: filter,
                                      ))
                                ..add(
                                  ShopEvent.setFilter(filter: filter),
                                );
                            }),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Container _amenities() {
    return Container(
      padding: EdgeInsets.all(16.r),
      width: double.infinity,
      decoration: BoxDecoration(
        color: widget.colors.newBoxColor,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppHelper.getTrn(TrKeys.amenities),
            style: CustomStyle.interNoSemi(
                color: widget.colors.textBlack, size: 18),
          ),
          16.verticalSpace,
          BlocBuilder<FilterBloc, FilterState>(
            builder: (context, state) {
              return state.isLoading
                  ? const Loading()
                  : ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: state.shopFilter?.tags.length,
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      itemBuilder: (context, index) {
                        return InkWell(
                            onTap: () {
                              context.read<FilterBloc>().add(
                                  FilterEvent.setAmenities(
                                      value: state.shopFilter?.tags[index].id));
                            },
                            child: _item(
                                state.shopFilter?.tags[index], state.tagId));
                      });
            },
          )
        ],
      ),
    );
  }

  Widget _item(TagModel? tag, int? id) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.r),
      child: Row(
        children: [
          Text(
            tag?.translation?.title ?? "",
            style: CustomStyle.interRegular(
                color: widget.colors.textBlack, size: 14),
          ),
          const Spacer(),
          Container(
            width: 22.r,
            height: 22.r,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                    color: id == tag?.id
                        ? widget.colors.textBlack
                        : widget.colors.icon,
                    width: id == tag?.id ? 6.r : 1.r)),
          )
        ],
      ),
    );
  }

  Container _price() {
    return Container(
      padding: EdgeInsets.all(16.r),
      width: double.infinity,
      decoration: BoxDecoration(
        color: widget.colors.newBoxColor,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: BlocBuilder<FilterBloc, FilterState>(buildWhen: (p, n) {
        return p.shopFilter != n.shopFilter;
      }, builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppHelper.getTrn(TrKeys.price),
              style: CustomStyle.interNoSemi(
                  color: widget.colors.textBlack, size: 18),
            ),
            8.verticalSpace,
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppHelper.numberFormat(
                            number: state.shopFilter?.serviceMinPrice),
                        style: CustomStyle.interNoSemi(
                            color: widget.colors.textBlack, size: 14),
                      ),
                      4.verticalSpace,
                      CustomTextFormField(
                        hint: AppHelper.getTrn(TrKeys.from),
                        controller: minPrice,
                        inputType: TextInputType.number,
                      ),
                    ],
                  ),
                ),
                12.horizontalSpace,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '=< ${AppHelper.numberFormat(number: state.shopFilter?.serviceMaxPrice)}',
                        style: CustomStyle.interNoSemi(
                            color: widget.colors.textBlack, size: 14),
                      ),
                      4.verticalSpace,
                      CustomTextFormField(
                        hint: AppHelper.getTrn(TrKeys.to),
                        controller: maxPrice,
                        inputType: TextInputType.number,
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        );
      }),
    );
  }

  Container _sort() {
    return Container(
      padding: EdgeInsets.all(16.r),
      width: double.infinity,
      decoration: BoxDecoration(
        color: widget.colors.newBoxColor,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppHelper.getTrn(TrKeys.sortBy),
            style: CustomStyle.interNoSemi(
                color: widget.colors.textBlack, size: 18),
          ),
          16.verticalSpace,
          BlocBuilder<FilterBloc, FilterState>(
            buildWhen: (p, n) {
              return p.sort != n.sort || p.shopFilter != n.shopFilter;
            },
            builder: (context, state) {
              final ordersBy = state.shopFilter?.orderBy?.values.toList() ?? [];
              return ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: ordersBy.length,
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  itemBuilder: (context, index) {
                    return InkWell(
                        onTap: () {
                          context
                              .read<FilterBloc>()
                              .add(FilterEvent.setSort(value: ordersBy[index]));
                        },
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 12.r),
                          child: Row(
                            children: [
                              Text(
                                AppHelper.getTrn(ordersBy[index]),
                                style: CustomStyle.interRegular(
                                    color: widget.colors.textBlack, size: 14),
                              ),
                              const Spacer(),
                              Container(
                                width: 22.r,
                                height: 22.r,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        color: ordersBy[index] == state.sort
                                            ? widget.colors.textBlack
                                            : widget.colors.icon,
                                        width: ordersBy[index] == state.sort
                                            ? 6.r
                                            : 1.r)),
                              )
                            ],
                          ),
                        ));
                  });
            },
          )
        ],
      ),
    );
  }

  Container _serviceType() {
    return Container(
      padding: EdgeInsets.all(16.r),
      width: double.infinity,
      decoration: BoxDecoration(
        color: widget.colors.newBoxColor,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppHelper.getTrn(TrKeys.serviceType),
            style: CustomStyle.interNoSemi(
                color: widget.colors.textBlack, size: 18),
          ),
          16.verticalSpace,
          BlocBuilder<FilterBloc, FilterState>(
            buildWhen: (p, n) {
              return p.serviceType != n.serviceType ||
                  p.shopFilter != n.shopFilter;
            },
            builder: (context, state) {
              final type = state.shopFilter?.serviceType?.values.toList() ?? [];
              return ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: type.length,
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  itemBuilder: (context, index) {
                    return InkWell(
                        onTap: () {
                          context.read<FilterBloc>().add(
                              FilterEvent.setServiceType(value: type[index]));
                        },
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 12.r),
                          child: Row(
                            children: [
                              Text(
                                AppHelper.getTrn(type[index]),
                                style: CustomStyle.interRegular(
                                    color: widget.colors.textBlack, size: 14),
                              ),
                              const Spacer(),
                              Container(
                                width: 22.r,
                                height: 22.r,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        color: type[index] == state.serviceType
                                            ? widget.colors.textBlack
                                            : widget.colors.icon,
                                        width: type[index] == state.serviceType
                                            ? 6.r
                                            : 1.r)),
                              )
                            ],
                          ),
                        ));
                  });
            },
          )
        ],
      ),
    );
  }

  Container _gender() {
    return Container(
      padding: EdgeInsets.all(16.r),
      width: double.infinity,
      decoration: BoxDecoration(
        color: widget.colors.newBoxColor,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppHelper.getTrn(TrKeys.gender),
            style: CustomStyle.interNoSemi(
                color: widget.colors.textBlack, size: 18),
          ),
          16.verticalSpace,
          BlocBuilder<FilterBloc, FilterState>(
            buildWhen: (p, n) {
              return p.genderIndex != n.genderIndex;
            },
            builder: (context, state) {
              return ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: AppConstants.genderList.length,
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  itemBuilder: (context, index) {
                    return InkWell(
                        onTap: () {
                          context
                              .read<FilterBloc>()
                              .add(FilterEvent.setGender(index: index));
                        },
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 12.r),
                          child: Row(
                            children: [
                              Text(
                                AppHelper.getTrn(
                                    AppConstants.genderList[index]),
                                style: CustomStyle.interRegular(
                                    color: widget.colors.textBlack, size: 14),
                              ),
                              const Spacer(),
                              Container(
                                width: 22.r,
                                height: 22.r,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        color: index == state.genderIndex
                                            ? widget.colors.textBlack
                                            : widget.colors.icon,
                                        width: index == state.genderIndex
                                            ? 6.r
                                            : 1.r)),
                              )
                            ],
                          ),
                        ));
                  });
            },
          )
        ],
      ),
    );
  }
}
