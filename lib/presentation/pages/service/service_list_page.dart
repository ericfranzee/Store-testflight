import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibeauty/application/service/service_bloc.dart';
import 'package:ibeauty/domain/model/model/master_model.dart';
import 'package:ibeauty/domain/service/helper.dart';
import 'package:ibeauty/domain/service/tr_keys.dart';
import 'package:ibeauty/presentation/components/button/animation_button_effect.dart';
import 'package:ibeauty/presentation/components/button/pop_button.dart';
import 'package:ibeauty/presentation/components/custom_scaffold.dart';
import 'package:ibeauty/presentation/pages/service/widget/service_tab_view.dart';
import 'package:ibeauty/presentation/route/app_route_service.dart';
import 'package:ibeauty/presentation/style/style.dart';

import 'package:ibeauty/presentation/style/theme/theme.dart';
import 'widget/tab_bar_item.dart';

class ServiceListPage extends StatefulWidget {
  final int? shopId;
  final MasterModel? master;

  const ServiceListPage({super.key, this.shopId, this.master});

  @override
  State<ServiceListPage> createState() => _ServiceListPageState();
}

class _ServiceListPageState extends State<ServiceListPage>
    with TickerProviderStateMixin {
  late TabController tabController;
  num totalPrice = 0;
  num duration = 0;
  int service = 0;

  @override
  void initState() {
    tabController = TabController(length: 1, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: (colors) => SafeArea(
        bottom: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.r),
              child: Text(
                AppHelper.getTrn(TrKeys.servicesOffered),
                style:
                    CustomStyle.interNoSemi(color: colors.textBlack, size: 22),
              ),
            ),
            20.verticalSpace,
            BlocConsumer<ServiceBloc, ServiceState>(
              listener: (context, state) {
                if (state.categoryServices.isNotEmpty) {
                  tabController = TabController(
                      length: state.categoryServices.length + 1, vsync: this);
                }
                tabController.index =
                    state.selectIndex == 0 ? 0 : state.selectIndex - 1;
                totalPrice = 0;
                duration = 0;
                service = 0;
                if (state.selectServices.isEmpty) {
                  return;
                }
                for (var element in state.selectServices) {
                  totalPrice += (element.totalPrice ?? 0);
                  duration += (element.interval ?? 0);
                }
                service = state.selectServices.length;
              },
              builder: (context, state) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    _tabs(colors, state, context),
                    SizedBox(
                        height: MediaQuery.sizeOf(context).height - 152.r,
                        child: (state.selectIndex == 0)
                            ? ServiceTabView(
                                colors: colors,
                                shopId: widget.shopId,
                                master: widget.master,
                              )
                            : ServiceTabView(
                                key: ValueKey<int>(state
                                        .categoryServices[state.selectIndex - 1]
                                        .id ??
                                    0),
                                shopId: widget.shopId,
                                colors: colors,
                                master: widget.master,
                                categoryId: state
                                    .categoryServices[state.selectIndex - 1]
                                    .id))
                  ],
                );
              },
            )
          ],
        ),
      ),
      floatingButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingButton: (colors) => Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.r),
          child: Row(
            children: [
              PopButton(colors: colors),
              BlocBuilder<ServiceBloc, ServiceState>(
                buildWhen: (p, n) {
                  return p.selectServices.length != n.selectServices.length;
                },
                builder: (context, state) {
                  return (service != 0)
                      ? Expanded(
                          child: ButtonEffectAnimation(
                            onTap: () {
                              AppRouteService.goSelectOptionsMaster(
                                  context: context,
                                  serviceIds: state.selectServices,
                                  title: AppHelper.getTrn(TrKeys.selectMaster),
                                  shopId: widget.shopId,
                                  colors: colors);
                              // AppRouteService.goSelectMaster(
                              //     context: context,
                              //     shopId: widget.shopId,
                              //     services: state.selectServices);
                            },
                            child: Container(
                              margin: EdgeInsets.only(left: 16.r),
                              height: 64.r,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.r),
                                color: colors.primary,
                              ),
                              padding: EdgeInsets.symmetric(horizontal: 16.r),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "${AppHelper.getTrn(TrKeys.from)} ${AppHelper.numberFormat(number: totalPrice)}",
                                    style: CustomStyle.interNormal(
                                        color: colors.textWhite, size: 16),
                                  ),
                                  Text(
                                    "$service ${AppHelper.getTrn(TrKeys.services)} - $duration ${AppHelper.getTrn(TrKeys.minute)}",
                                    style: CustomStyle.interRegular(
                                        color: colors.textWhite, size: 16),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      : const SizedBox();
                },
              )
            ],
          )),
    );
  }

  Widget _tabs(
      CustomColorSet colors, ServiceState state, BuildContext context) {
    return TabBar(
      onTap: (e) {},
      labelPadding: EdgeInsets.zero,
      isScrollable: true,
      padding: EdgeInsets.symmetric(horizontal: 16.r),
      indicatorPadding: EdgeInsets.zero,
      indicatorColor: colors.transparent,
      dividerColor: colors.transparent,
      labelColor: colors.primary,
      unselectedLabelColor: colors.transparent,
      controller: tabController,
      tabAlignment: TabAlignment.start,
      tabs: [
        TabBarItem(
            colors: colors,
            title: AppHelper.getTrn(TrKeys.all),
            onTap: () {
              context
                  .read<ServiceBloc>()
                  .add(const ServiceEvent.selectServiceCategory(index: 0));
            },
            isActive: state.selectIndex == 0),
        ...state.categoryServices.map(
          (e) => TabBarItem(
            isActive:
                state.selectIndex == (state.categoryServices.indexOf(e) + 1),
            image: e.img ?? "",
            title: e.translation?.title ?? "",
            onTap: () {
              context.read<ServiceBloc>().add(
                  ServiceEvent.selectServiceCategory(
                      index: state.categoryServices.indexOf(e) + 1));
            },
            colors: colors,
          ),
        )
      ],
    );
  }
}
