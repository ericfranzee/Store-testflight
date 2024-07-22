import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibeauty/application/booking/booking_bloc.dart';
import 'package:ibeauty/application/master/master_bloc.dart';
import 'package:ibeauty/domain/model/model/service_model.dart';
import 'package:ibeauty/domain/service/helper.dart';
import 'package:ibeauty/domain/service/tr_keys.dart';
import 'package:ibeauty/infrastructure/local_storage/local_storage.dart';
import 'package:ibeauty/presentation/components/keyboard_dismisser.dart';
import 'package:ibeauty/presentation/components/loading.dart';
import 'package:ibeauty/presentation/components/master_item/master_item.dart';
import 'package:ibeauty/presentation/route/app_route_service.dart';
import 'package:ibeauty/presentation/style/style.dart';
import 'package:ibeauty/presentation/style/theme/theme.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class SelectMasterBottomSheet extends StatefulWidget {
  final CustomColorSet colors;
  final String? title;
  final int? shopId;
  final int? serviceId;
  final List<ServiceModel>? serviceIds;
  final ScrollController controller;
  final bool selectAll;

  const SelectMasterBottomSheet(
      {super.key,
      required this.colors,
      required this.controller,
      required this.title,
      this.shopId,
      this.serviceId,
      this.selectAll = false,
      this.serviceIds});

  @override
  State<SelectMasterBottomSheet> createState() =>
      _SelectMasterBottomSheetState();
}

class _SelectMasterBottomSheetState extends State<SelectMasterBottomSheet> {
  late RefreshController controller;

  @override
  void initState() {
    controller = RefreshController();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
      isLtr: LocalStorage.getLangLtr(),
      child: Container(
        width: MediaQuery.sizeOf(context).width,
        height: 400,
        decoration: BoxDecoration(
          color: widget.colors.newBoxColor,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(24.r),
            topLeft: Radius.circular(24.r),
          ),
        ),
        padding: EdgeInsets.only(
          left: 16.r,
          right: 16.r,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            8.verticalSpace,
            Container(
              height: 4.r,
              margin: EdgeInsets.symmetric(
                  horizontal: MediaQuery.sizeOf(context).width / 2 - 48.r),
              decoration: BoxDecoration(
                  color: widget.colors.icon,
                  borderRadius: BorderRadius.circular(100.r)),
            ),
            16.verticalSpace,
            Text(
              widget.title ?? "",
              style: CustomStyle.interNoSemi(
                  color: widget.colors.textBlack, size: 22),
            ),
            BlocBuilder<MasterBloc, MasterState>(
              builder: (context, state) {
                return state.isLoading
                    ? Padding(
                        padding: EdgeInsets.only(top: 32.r),
                        child: const Loading(),
                      )
                    : Expanded(
                        child: SmartRefresher(
                          controller: controller,
                          scrollController: widget.controller,
                          enablePullUp: true,
                          enablePullDown: false,
                          onRefresh: () {
                            context.read<MasterBloc>().add(
                                MasterEvent.fetchMasters(
                                    context: context,
                                    controller: controller,
                                    isRefresh: true,
                                    shopId: widget.shopId,
                                    serviceId: widget.serviceId));
                          },
                          onLoading: () {
                            context.read<MasterBloc>().add(
                                MasterEvent.fetchMasters(
                                    context: context,
                                    controller: controller,
                                    shopId: widget.shopId,
                                    serviceId: widget.serviceId));
                          },
                          child: widget.selectAll
                              ? _selectAllService(state)
                              : _selectPerService(state),
                        ),
                      );
              },
            ),
          ],
        ),
      ),
    );
  }

  GridView _selectPerService(MasterState state) {
    return GridView.builder(
      shrinkWrap: true,
      controller: widget.controller,
      padding: EdgeInsets.only(top: 24.r),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisExtent: 284.r,
          mainAxisSpacing: 8.r,
          crossAxisSpacing: 8.r),
      itemCount: state.masters.length,
      itemBuilder: (context, index) {
        return MasterItem(
            selectService: true,
            onTap: () {
              context.read<BookingBloc>().add(BookingEvent.selectMaster(
                  serviceId: widget.serviceId, master: state.masters[index]));
              Navigator.pop(context);
            },
            height: 140,
            master: state.masters[index],
            colors: widget.colors);
      },
    );
  }

  GridView _selectAllService(MasterState state) {
    return GridView.builder(
      shrinkWrap: true,
      controller: widget.controller,
      padding: EdgeInsets.only(top: 24.r),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisExtent: 284.r,
          mainAxisSpacing: 8.r,
          crossAxisSpacing: 8.r),
      itemCount: state.masters.length + 1,
      itemBuilder: (context, index) {
        return index == 0
            ? InkWell(
                onTap: () {
                  AppRouteService.goSelectMaster(
                      context: context,
                      shopId: widget.shopId,
                      services: widget.serviceIds ?? []);
                },
                child: Container(
                  width: 200.r,
                  padding: EdgeInsets.all(8.r),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    border: Border.all(color: widget.colors.icon),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        FlutterRemix.team_line,
                        color: widget.colors.textBlack,
                      ),
                      8.verticalSpace,
                      Text(
                        AppHelper.getTrn(TrKeys.selectMasterPerService),
                        style: CustomStyle.interNormal(
                            color: widget.colors.textBlack, size: 16),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              )
            : MasterItem(
                selectService: true,
                onTap: () {
                  AppRouteService.goSelectMaster(
                      context: context,
                      shopId: widget.shopId,
                      services: widget.serviceIds ?? [],
                      master: state.masters[index-1]);
                },
                height: 140,
                master: state.masters[index - 1],
                colors: widget.colors);
      },
    );
  }
}
