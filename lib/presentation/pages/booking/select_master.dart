import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibeauty/application/booking/booking_bloc.dart';
import 'package:ibeauty/domain/model/model/master_model.dart';
import 'package:ibeauty/domain/service/helper.dart';
import 'package:ibeauty/domain/service/tr_keys.dart';
import 'package:ibeauty/infrastructure/local_storage/local_storage.dart';
import 'package:ibeauty/presentation/components/button/animation_button_effect.dart';
import 'package:ibeauty/presentation/components/button/custom_button.dart';
import 'package:ibeauty/presentation/components/button/pop_button.dart';
import 'package:ibeauty/presentation/components/custom_network_image.dart';
import 'package:ibeauty/presentation/components/custom_scaffold.dart';
import 'package:ibeauty/presentation/components/keyboard_dismisser.dart';
import 'package:ibeauty/presentation/route/app_route_service.dart';
import 'package:ibeauty/presentation/style/style.dart';
import 'package:ibeauty/presentation/style/theme/theme.dart';

class SelectMasterPage extends StatelessWidget {
  final int? shopId;

  const SelectMasterPage({super.key, required this.shopId});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: (colors) => KeyboardDismisser(
        isLtr: LocalStorage.getLangLtr(),
        child: SafeArea(
          bottom: false,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppHelper.getTrn(TrKeys.selectStaff),
                  style: CustomStyle.interNoSemi(
                      color: colors.textBlack, size: 18),
                ),
                24.verticalSpace,
                BlocBuilder<BookingBloc, BookingState>(
                  builder: (context, state) {
                    return ListView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        itemCount: state.selectServices.length,
                        itemBuilder: (context, index) {
                          final MasterModel? master = state
                              .selectMasters[state.selectServices[index].id];
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                state.selectServices[index].translation
                                        ?.title ??
                                    "",
                                style: CustomStyle.interNormal(
                                    color: colors.textBlack, size: 18),
                              ),
                              8.verticalSpace,
                              _addMaster(context, state, index, colors, master),
                              8.verticalSpace,
                              const Divider(),
                              8.verticalSpace,
                            ],
                          );
                        });
                  },
                )
              ],
            ),
          ),
        ),
      ),
      floatingButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingButton: (colors) => Align(
        alignment: Alignment.bottomLeft,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.r),
          child: Row(
            children: [
              PopButton(colors: colors),
              10.horizontalSpace,
              Expanded(
                child: SizedBox(
                  height: 56.r,
                  child: BlocBuilder<BookingBloc, BookingState>(
                    builder: (context, state) {
                      return CustomButton(
                          title: AppHelper.getTrn(TrKeys.next),
                          bgColor: colors.primary,
                          titleColor: colors.textWhite,
                          onTap: () {
                            List list = state.selectMasters.keys.toList()
                              ..sort();
                            if (listEquals(
                                list,
                                state.selectServices.map((e) => e.id).toList()
                                  ..sort())) {
                              AppRouteService.goSelectBookTimePage(
                                  context: context,
                                  selectMasters: state.selectMasters);
                              return;
                            }
                            AppHelper.openDialog(
                                context: context,
                                title: AppHelper.getTrn(
                                    TrKeys.youMustSelectMaster));
                          });
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  ButtonEffectAnimation _addMaster(BuildContext context, BookingState state,
      int index, CustomColorSet colors, MasterModel? master) {
    return ButtonEffectAnimation(
      onTap: () {
        AppRouteService.goSelectMasterBottomSheet(
            context: context,
            serviceId: state.selectServices[index].id,
            title: state.selectServices[index].translation?.title ?? "",
            shopId: shopId,
            colors: colors);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(color: colors.icon),
        ),
        padding: EdgeInsets.symmetric(horizontal: 12.r, vertical: 8.r),
        child: master == null
            ? Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    FlutterRemix.account_circle_line,
                    color: colors.textBlack,
                    size: 24.r,
                  ),
                  8.horizontalSpace,
                  Text(
                    AppHelper.getTrn(TrKeys.addMaster),
                    style: CustomStyle.interNormal(
                        color: colors.textBlack, size: 16),
                  ),
                ],
              )
            : Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomNetworkImage(
                    url: master.img ?? "",
                    height: 32,
                    width: 32,
                    radius: 4,
                  ),
                  8.horizontalSpace,
                  Text(
                    master.firstname ?? "",
                    style: CustomStyle.interNormal(
                        color: colors.textBlack, size: 16),
                  )
                ],
              ),
      ),
    );
  }
}
