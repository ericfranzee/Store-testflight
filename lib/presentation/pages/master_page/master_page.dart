// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ibeauty/application/master/master_bloc.dart';
import 'package:ibeauty/application/review/review_bloc.dart';
import 'package:ibeauty/domain/service/helper.dart';
import 'package:ibeauty/domain/service/tr_keys.dart';
import 'package:ibeauty/infrastructure/local_storage/local_storage.dart';
import 'package:ibeauty/presentation/components/button/animation_button_effect.dart';
import 'package:ibeauty/presentation/components/button/pop_button.dart';
import 'package:ibeauty/presentation/components/custom_network_image.dart';
import 'package:ibeauty/presentation/components/custom_scaffold.dart';
import 'package:ibeauty/presentation/components/custom_tab_bar.dart';
import 'package:ibeauty/presentation/components/loading.dart';
import 'package:ibeauty/presentation/pages/master_page/widget/master_avatar.dart';
import 'package:ibeauty/presentation/pages/master_page/widget/master_description.dart';
import 'package:ibeauty/presentation/pages/review/widgets/review_item.dart';
import 'package:ibeauty/presentation/style/style.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../review/widgets/review_one_item.dart';

class MasterPage extends StatefulWidget {
  const MasterPage({super.key});

  @override
  State<MasterPage> createState() => _MasterPageState();
}

class _MasterPageState extends State<MasterPage>
    with SingleTickerProviderStateMixin {
  late RefreshController masterRefresh;
  late TabController tabController;

  final tabs = [
    Tab(text: AppHelper.getTrn(TrKeys.portfolio)),
    Tab(text: AppHelper.getTrn(TrKeys.reviews)),
  ];

  @override
  void initState() {
    masterRefresh = RefreshController();
    tabController = TabController(length: 2, vsync: this);
    tabController.addListener(() {
      if(tabController.indexIsChanging){
        context.read<MasterBloc>().add(const MasterEvent.updateState());
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    masterRefresh.dispose();
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: (colors) => BlocBuilder<MasterBloc, MasterState>(
        builder: (context, state) {
          return Stack(
            children: [
              BlocBuilder<MasterBloc, MasterState>(
                builder: (context, state) {
                  return ListView(
                    padding: EdgeInsets.only(bottom: 100.r),
                    children: [
                      MasterAvatar(colors: colors),
                      if (state.master?.translation?.description != null)
                        MasterDescriptionPage(
                            master: state.master, colors: colors),
                      Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.r),
                          child: CustomTabBar(
                              tabController: tabController, tabs: tabs)),
                      30.verticalSpace,
                      tabController.index == 0
                          ? GridView.builder(
                              padding: EdgeInsets.symmetric(horizontal: 16.r),
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      childAspectRatio: 0.8.r,
                                      crossAxisCount: 2,
                                      crossAxisSpacing: 8.r,
                                      mainAxisSpacing: 8.r,
                                      mainAxisExtent: 320.r),
                              itemCount: state.masterImages.length,
                              itemBuilder: (context, index) {
                                return CustomNetworkImage(
                                  url: state.masterImages[index].path ?? "",
                                  height: 230,
                                  width: double.infinity,
                                  radius: 10,
                                );
                              })
                          : BlocBuilder<ReviewBloc, ReviewState>(
                              builder: (context, state) {
                                return state.isLoading
                                    ? const Loading()
                                    : ListView.builder(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 16.r),
                                        shrinkWrap: true,
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        itemCount: state.list.length,
                                        itemBuilder: (context, index) {
                                          return AppHelper.getType() == 0
                                              ? ReviewItem(
                                                  review: state.list[index],
                                                  colors: colors,
                                                )
                                              : ReviewOneItem(
                                                  review: state.list[index],
                                                  colors: colors,
                                                );
                                        });
                              },
                            )
                    ],
                  );
                },
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.paddingOf(context).top + 8.r,
                    left: 16.r,
                    right: 16.r),
                child: Row(
                  children: [
                    Container(
                      height: 40.r,
                      width: 40.r,
                      decoration: BoxDecoration(
                        color: colors.textWhite.withOpacity(0.9),
                        border: Border.all(color: colors.icon),
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Center(
                        child: BlocBuilder<MasterBloc, MasterState>(
                          builder: (context, state) {
                            return Text(
                              state.master?.rate?.toStringAsFixed(1) ?? "0",
                              style: CustomStyle.interNoSemi(
                                  color: colors.textBlack, size: 12),
                            );
                          },
                        ),
                      ),
                    ),
                    const Spacer(),
                    Container(
                      padding: EdgeInsets.all(8.r),
                      decoration: BoxDecoration(
                          color: colors.textWhite.withOpacity(0.8),
                          borderRadius: BorderRadius.circular(10.r)),
                      child: BlocBuilder<MasterBloc, MasterState>(
                        builder: (context, state) {
                          return ButtonEffectAnimation(
                            onTap: () {
                              LocalStorage.setLikedMaster(
                                  state.master?.id ?? 0);
                              context
                                  .read<MasterBloc>()
                                  .add(const MasterEvent.updateState());
                            },
                            child: SvgPicture.asset(
                              LocalStorage.getLikedMaster()
                                      .contains(state.master?.id)
                                  ? "assets/svg/likeButtom.svg"
                                  : "assets/svg/unlike.svg",
                              width: 26.r,
                              height: 26.r,
                              color: colors.textBlack,
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              )
            ],
          );
        },
      ),
      floatingButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingButton: (colors) => PopButton(colors: colors),
    );
  }
}
