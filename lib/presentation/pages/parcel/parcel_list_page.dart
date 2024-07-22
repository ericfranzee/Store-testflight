import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibeauty/application/parcels_list/parcels_list_bloc.dart';
import 'package:ibeauty/domain/service/helper.dart';
import 'package:ibeauty/domain/service/tr_keys.dart';
import 'package:ibeauty/infrastructure/local_storage/local_storage.dart';
import 'package:ibeauty/presentation/components/button/pop_button.dart';
import 'package:ibeauty/presentation/components/custom_scaffold.dart';
import 'package:ibeauty/presentation/components/custom_tab_bar.dart';
import 'package:ibeauty/presentation/components/keyboard_dismisser.dart';
import 'package:ibeauty/presentation/components/loading.dart';
import 'package:ibeauty/presentation/style/style.dart';
import 'package:ibeauty/presentation/style/theme/theme.dart';
import 'package:lottie/lottie.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'parcel_item.dart';

class ParcelListPage extends StatefulWidget {
  const ParcelListPage({Key? key}) : super(key: key);

  @override
  State<ParcelListPage> createState() => _ParcelListPageState();
}

class _ParcelListPageState extends State<ParcelListPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late RefreshController activeRefreshController;
  late RefreshController historyRefreshController;

  final _tabs = [
    Tab(text: AppHelper.getTrn(TrKeys.activeParcel)),
    Tab(text: AppHelper.getTrn(TrKeys.parcelHistory)),
  ];

  @override
  void initState() {
    activeRefreshController = RefreshController();
    historyRefreshController = RefreshController();
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    activeRefreshController.dispose();
    historyRefreshController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
      isLtr: LocalStorage.getLangLtr(),
      child: CustomScaffold(
        body: (colors) => SafeArea(
          bottom: false,
          child: Column(
            children: [
              Text(
                AppHelper.getTrn(TrKeys.parcels),
                style:
                    CustomStyle.interNoSemi(color: colors.textBlack, size: 18),
              ),
              16.verticalSpace,
              Expanded(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.r),
                      child: CustomTabBar(
                        isScrollable: false,
                        tabController: _tabController,
                        tabs: _tabs,
                      ),
                    ),
                    BlocBuilder<ParcelsListBloc, ParcelsListState>(
                      builder: (context, state) {
                        return Expanded(
                          child:
                              TabBarView(controller: _tabController, children: [
                            state.isActiveLoading
                                ? const Loading()
                                : SmartRefresher(
                                    controller: activeRefreshController,
                                    enablePullDown: true,
                                    enablePullUp: true,
                                    onRefresh: () {
                                      context.read<ParcelsListBloc>().add(
                                          ParcelsListEvent.fetchActiveParcel(
                                              context: context,
                                              controller:
                                                  activeRefreshController,
                                              isRefresh: true));
                                    },
                                    onLoading: () {
                                      ParcelsListEvent.fetchActiveParcel(
                                          context: context,
                                          controller: activeRefreshController);
                                    },
                                    child: state.activeOrders.isNotEmpty
                                        ? ListView.separated(
                                            padding: EdgeInsets.only(top: 24.r),
                                            shrinkWrap: true,
                                            itemCount:
                                                state.activeOrders.length,
                                            itemBuilder: (context, index) {
                                              return ParcelItem(
                                                  index: index,
                                                  colors: colors,
                                                  parcel: state
                                                      .activeOrders[index]);
                                            },
                                            separatorBuilder:
                                                (BuildContext context,
                                                    int index) {
                                              return Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 16.r),
                                                child: const Divider(),
                                              );
                                            },
                                          )
                                        : _resultEmpty(colors),
                                  ),
                            state.isHistoryLoading
                                ? const Loading()
                                : SmartRefresher(
                                    controller: historyRefreshController,
                                    enablePullDown: true,
                                    enablePullUp: true,
                                    onRefresh: () {
                                      context.read<ParcelsListBloc>().add(
                                          ParcelsListEvent.fetchHistoryParcel(
                                              context: context,
                                              controller:
                                                  historyRefreshController,
                                              isRefresh: true));
                                    },
                                    onLoading: () {
                                      context.read<ParcelsListBloc>().add(
                                          ParcelsListEvent.fetchHistoryParcel(
                                              context: context,
                                              controller:
                                                  historyRefreshController));
                                    },
                                    child: state.historyOrders.isNotEmpty
                                        ? ListView.separated(
                                            padding: EdgeInsets.only(top: 24.r),
                                            shrinkWrap: true,
                                            itemCount:
                                                state.historyOrders.length,
                                            itemBuilder: (context, index) {
                                              return ParcelItem(
                                                  index: index,
                                                  colors: colors,
                                                  parcel: state
                                                      .historyOrders[index]);
                                            },
                                            separatorBuilder:
                                                (BuildContext context,
                                                    int index) {
                                              return Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 16.r),
                                                child: const Divider(),
                                              );
                                            },
                                          )
                                        : _resultEmpty(colors),
                                  ),
                          ]),
                        );
                      },
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        floatingButtonLocation: FloatingActionButtonLocation.startFloat,
        floatingButton: (colors) => PopButton(colors: colors),
      ),
    );
  }
}

Widget _resultEmpty(CustomColorSet colors) {
  return Column(
    children: [
      24.verticalSpace,
      Lottie.asset("assets/lottie/notification_empty.json"),
      16.verticalSpace,
      Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 32.w,
        ),
        child: Text(
          AppHelper.getTrn(TrKeys.thereIsNothingHere),
          style: CustomStyle.interNoSemi(size: 16, color: colors.textBlack),
          textAlign: TextAlign.center,
        ),
      ),
    ],
  );
}
