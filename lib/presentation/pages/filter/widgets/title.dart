import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cea_zed/application/filter/filter_bloc.dart';
import 'package:cea_zed/domain/service/helper.dart';
import 'package:cea_zed/domain/service/tr_keys.dart';
import 'package:cea_zed/presentation/components/button/animation_button_effect.dart';
import 'package:cea_zed/presentation/style/style.dart';
import 'package:cea_zed/presentation/style/theme/theme.dart';

class TitleScreen extends StatelessWidget {
  final CustomColorSet colors;

  const TitleScreen({
    super.key,
    required this.colors,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          AppHelper.getTrn(TrKeys.filter),
          style: CustomStyle.interNoSemi(color: colors.textBlack, size: 22),
        ),
        ButtonEffectAnimation(
          onTap: () {
            context.read<FilterBloc>()
              ..add(const FilterEvent.clearFilter())
              ..add(FilterEvent.fetchExtras(context: context, isPrice: true));
          },
          child: Text(
            AppHelper.getTrn(TrKeys.clearAll),
            style: CustomStyle.interNormal(color: colors.textBlack, size: 14),
          ),
        ),
      ],
    );
  }
}
