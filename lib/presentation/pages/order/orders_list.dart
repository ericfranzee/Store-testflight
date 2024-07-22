import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibeauty/application/order/order_bloc.dart';
import 'package:ibeauty/domain/service/helper.dart';
import 'package:ibeauty/domain/service/tr_keys.dart';
import 'package:ibeauty/presentation/components/button/pop_button.dart';
import 'package:ibeauty/presentation/components/custom_scaffold.dart';
import 'package:ibeauty/presentation/components/custom_tab_bar.dart';
import 'package:ibeauty/presentation/components/loading.dart';
import 'package:ibeauty/presentation/pages/order/widgets/order_item.dart';
import 'package:ibeauty/presentation/style/style.dart';
import 'package:ibeauty/presentation/style/theme/theme.dart';
import 'package:lottie/lottie.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class OrdersListPage extends StatefulWidget {
  const OrdersListPage({super.key});

  @override
  State<OrdersListPage> createState() => _OrdersListPageState();
}

class _OrdersListPageState extends State<OrdersListPage>
    with SingleTickerProviderStateMixin {
  late RefreshController activeRefresh;
  late RefreshController refundRefresh;
  late RefreshController historyRefresh;
  late TabController tabController;

  List<Tab> listTabs = [
    Tab(
      child: Text(AppHelper.getTrn(TrKeys.orders)),
    ),
    Tab(
      child: Text(AppHelper.getTrn(TrKeys.refundOrder)),
    ),
  ];

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    activeRefresh = RefreshController();
    refundRefresh = RefreshController();
    historyRefresh = RefreshController();
    super.initState();
  }

  @override
  void dispose() {
    activeRefresh.dispose();
    historyRefresh.dispose();
    refundRefresh.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: (colors) => SafeArea(
        bottom: false,
        child: Column(
          children: [
            Text(
              AppHelper.getTrn(TrKeys.orderHistory),
              style: CustomStyle.interNoSemi(color: colors.textBlack, size: 18),
            ),
            24.verticalSpace,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.r),
              child: CustomTabBar(
                tabController: tabController,
                tabs: listTabs,
              ),
            ),
            BlocBuilder<OrderBloc, OrderState>(
              builder: (context, state) {
                return Expanded(
                  child: TabBarView(controller: tabController, children: [
                    state.isLoadingActive
                        ? const Loading()
                        : state.activeOrders.isEmpty
                            ? _resultEmpty(colors)
                            : _activeOrders(context, state, colors),
                    state.isLoadingRefund
                        ? const Loading()
                        : state.refundOrders.isEmpty
                            ? _resultEmpty(colors)
                            : _refundOrders(context, state, colors)
                  ]),
                );
              },
            )
          ],
        ),
      ),
      floatingButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingButton: (colors) => PopButton(colors: colors),
    );
  }

  SmartRefresher _activeOrders(
      BuildContext context, OrderState state, CustomColorSet colors) {
    return SmartRefresher(
      controller: activeRefresh,
      enablePullUp: true,
      onRefresh: () {
        context.read<OrderBloc>().add(OrderEvent.fetchActiveOrders(
            context: context, isRefresh: true, controller: activeRefresh));
      },
      onLoading: () {
        context.read<OrderBloc>().add(OrderEvent.fetchActiveOrders(
            context: context, controller: activeRefresh));
      },
      child: ListView.separated(
        padding: EdgeInsets.only(top: 24.r),
        shrinkWrap: true,
        itemCount: state.activeOrders.length,
        itemBuilder: (context, index) {
          return OrderItem(
            index: index,
            colors: colors,
            order: state.activeOrders[index],
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.r),
            child: const Divider(),
          );
        },
      ),
    );
  }

  SmartRefresher _refundOrders(
      BuildContext context, OrderState state, CustomColorSet colors) {
    return SmartRefresher(
      controller: refundRefresh,
      enablePullUp: true,
      onRefresh: () {
        context.read<OrderBloc>().add(OrderEvent.fetchRefundOrders(
            context: context, isRefresh: true, controller: refundRefresh));
      },
      onLoading: () {
        context.read<OrderBloc>().add(OrderEvent.fetchRefundOrders(
            context: context, controller: refundRefresh));
      },
      child: ListView.separated(
        padding: EdgeInsets.only(top: 24.r),
        shrinkWrap: true,
        itemCount: state.refundOrders.length,
        itemBuilder: (context, index) {
          return OrderItem(
              index: index,
              colors: colors,
              refundModel: state.refundOrders[index]);
        },
        separatorBuilder: (BuildContext context, int index) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.r),
            child: const Divider(),
          );
        },
      ),
    );
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
}
