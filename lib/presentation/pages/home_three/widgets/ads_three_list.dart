// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:ibeauty/application/banner/banner_bloc.dart';
import 'package:ibeauty/domain/model/response/banners_paginate_response.dart';
import 'package:ibeauty/presentation/components/custom_network_image.dart';
import 'package:ibeauty/presentation/route/app_route.dart';
import 'package:collection/collection.dart';
import 'package:ibeauty/presentation/style/theme/theme.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class AdsThreeList extends StatefulWidget {
  final CustomColorSet colors;
  final RefreshController controller;
  final VoidCallback onLoading;

  const AdsThreeList(
      {Key? key,
      required this.colors,
      required this.controller,
      required this.onLoading})
      : super(key: key);

  @override
  State<AdsThreeList> createState() => _AdsThreeListState();
}

class _AdsThreeListState extends State<AdsThreeList> {
  List<CustomGridTile> tiles = [
    CustomGridTile(12, 7),
    CustomGridTile(6, 7),
    CustomGridTile(6, 7),
    CustomGridTile(12, 7),
    CustomGridTile(6, 7),
    CustomGridTile(6, 7),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BannerBloc, BannerState>(
      builder: (context, state) {
        return state.adsBanners.isNotEmpty
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  16.verticalSpace,
                  StaggeredGrid.count(
                    crossAxisCount: 12,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                    children: [
                      ...state.adsBanners.mapIndexed((index, tile) {
                        return StaggeredGridTile.count(
                          crossAxisCellCount: tiles[index].crossAxisCount,
                          mainAxisCellCount: tiles[index].mainAxisCount,
                          child: _itemBanner(context, state,
                              state.adsBanners[index], index % 3 == 0),
                        );
                      }),
                    ],
                  )
                ],
              )
            : const SizedBox.shrink();
      },
    );
  }

  Padding _itemBanner(
      BuildContext context, BannerState state, BannerData banner, bool single) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.r),
      child: InkWell(
        onTap: () {
          AppRoute.goAdsBottomSheet(context, banner, widget.colors);
        },
        child: Container(
          height: 164,
          width: single ? MediaQuery.sizeOf(context).width : 200,
          decoration: BoxDecoration(
              border: Border.all(color: widget.colors.icon),
              borderRadius: BorderRadius.circular(10.r)),
          child: CustomNetworkImage(
              url: banner.galleries?.first.path ?? "",
              preview: banner.galleries?.first.preview,
              height: double.infinity,
              width: single ? MediaQuery.sizeOf(context).width : 200,
              radius: 10),
        ),
      ),
    );
  }
}

class CustomGridTile {
  CustomGridTile(this.crossAxisCount, this.mainAxisCount, {this.banner});

  BannerData? banner;
  final int crossAxisCount;
  final int mainAxisCount;

  copyWith({BannerData? banner}) {
    return CustomGridTile(crossAxisCount, mainAxisCount,
        banner: banner ?? BannerData());
  }
}
