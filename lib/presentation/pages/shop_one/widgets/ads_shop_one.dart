import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ibeauty/application/banner/banner_bloc.dart';
import 'package:ibeauty/presentation/pages/home_one/widgets/ads_one_item.dart';
import 'package:ibeauty/presentation/style/theme/theme.dart';

class AdsShopOne extends StatelessWidget {
  final CustomColorSet colors;

  const AdsShopOne({super.key, required this.colors});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BannerBloc, BannerState>(
      builder: (context, state) {
        return ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: state.shopListAds.length,
            itemBuilder: (context, index) {
              return AdsOneItem(
                colors: colors,
                colorIndex: index % 6,
                banner: state.shopListAds[index],
                bannerProducts: state.shopListAds[index].shopAdsPackages ?? [],
              );
            });
      },
    );
  }
}
