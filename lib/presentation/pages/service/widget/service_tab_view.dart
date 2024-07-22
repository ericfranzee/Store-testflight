import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibeauty/application/service/service_bloc.dart';
import 'package:ibeauty/domain/model/model/master_model.dart';
import 'package:ibeauty/presentation/components/loading.dart';
import 'package:ibeauty/presentation/components/service_item.dart';
import 'package:ibeauty/presentation/style/theme/theme.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ServiceTabView extends StatefulWidget {
  final CustomColorSet colors;
  final int? categoryId;
  final int? shopId;
  final MasterModel? master;

  const ServiceTabView(
      {super.key,
      required this.colors,
      this.categoryId,
      this.shopId,
      this.master});

  @override
  State<ServiceTabView> createState() => _ServiceTabViewState();
}

class _ServiceTabViewState extends State<ServiceTabView> {
  late RefreshController controller;

  @override
  void initState() {
    controller = RefreshController();
    context.read<ServiceBloc>().add(ServiceEvent.fetchServices(
        context: context,
        isRefresh: true,
        categoryId: widget.categoryId,
        shopId: widget.shopId,
        masterId: widget.master?.id));
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ServiceBloc, ServiceState>(
      builder: (context, state) {
        return state.isLoading
            ? const Loading()
            : SmartRefresher(
                controller: controller,
                enablePullUp: true,
                onRefresh: () {
                  context.read<ServiceBloc>().add(ServiceEvent.fetchServices(
                      context: context,
                      isRefresh: true,
                      categoryId: widget.categoryId,
                      shopId: widget.shopId,
                      masterId: widget.master?.id,
                      controller: controller));
                  controller.resetNoData();
                },
                onLoading: () {
                  context.read<ServiceBloc>().add(ServiceEvent.fetchServices(
                      context: context,
                      categoryId: widget.categoryId,
                      shopId: widget.shopId,
                      masterId: widget.master?.id,
                      controller: controller));
                  controller.resetNoData();
                },
                child: ListView.builder(
                    shrinkWrap: true,
                    padding:
                        EdgeInsets.only(right: 16.r, left: 16.r, bottom: 100.r),
                    itemCount: state.services.length,
                    itemBuilder: (context, index) {
                      return ServiceItem(
                        booked: state.selectServices
                            .map((e) => e.id)
                            .contains(state.services[index].id),
                        bookButton: true,
                        colors: widget.colors,
                        service: state.services[index],
                        master: widget.master,
                      );
                    }),
              );
      },
    );
  }
}
