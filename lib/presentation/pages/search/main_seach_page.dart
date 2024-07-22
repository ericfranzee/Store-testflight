import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibeauty/app_constants.dart';
import 'package:ibeauty/application/category/category_bloc.dart';
import 'package:ibeauty/domain/model/model/location_model.dart';
import 'package:ibeauty/domain/service/helper.dart';
import 'package:ibeauty/domain/service/time_service.dart';
import 'package:ibeauty/domain/service/tr_keys.dart';
import 'package:ibeauty/presentation/components/button/animation_button_effect.dart';
import 'package:ibeauty/presentation/components/button/custom_button.dart';
import 'package:ibeauty/presentation/components/custom_network_image.dart';
import 'package:ibeauty/presentation/components/custom_scaffold.dart';
import 'package:ibeauty/presentation/components/custom_textformfield.dart';
import 'package:ibeauty/presentation/route/app_route.dart';
import 'package:ibeauty/presentation/style/style.dart';
import 'package:ibeauty/presentation/style/theme/theme.dart';
import 'package:osm_nominatim/osm_nominatim.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class MainSearchPage extends StatefulWidget {
  const MainSearchPage({super.key});

  @override
  State<MainSearchPage> createState() => _MainSearchPageState();
}

class _MainSearchPageState extends State<MainSearchPage> {
  late TextEditingController placeController;
  late TextEditingController dateController;
  late TextEditingController timeController;
  late RefreshController serviceController;
  Place? place;

  @override
  void initState() {
    placeController = TextEditingController();
    dateController = TextEditingController();
    timeController = TextEditingController();
    serviceController = RefreshController();
    super.initState();
  }

  @override
  void dispose() {
    placeController.dispose();
    dateController.dispose();
    timeController.dispose();
    serviceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        body: (colors) => Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/search_bg.png"),
                    fit: BoxFit.cover)),
            child: SafeArea(
              bottom: false,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _appbar(context, colors),
                  Expanded(
                    child: SmartRefresher(
                      controller: serviceController,
                      enablePullUp: true,
                      onRefresh: () {
                        context
                            .read<CategoryBloc>()
                            .add(CategoryEvent.fetchCategoryOfService(
                              context: context,
                              isRefresh: true,
                              controller: serviceController,
                            ));
                      },
                      onLoading: () {
                        context
                            .read<CategoryBloc>()
                            .add(CategoryEvent.fetchCategoryOfService(
                              context: context,
                              controller: serviceController,
                            ));
                      },
                      child: ListView(
                        shrinkWrap: true,
                        children: [
                          24.verticalSpace,
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 36.r),
                            child: Text(
                              AppHelper.getTrn(TrKeys.findTheBest),
                              textAlign: TextAlign.center,
                              style: CustomStyle.interNoSemi(
                                  color: colors.textBlack, size: 32),
                            ),
                          ),
                          24.verticalSpace,
                          _searchInput(colors, context),
                          _services(colors)
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )));
  }

  BlocBuilder<CategoryBloc, CategoryState> _services(CustomColorSet colors) {
    return BlocBuilder<CategoryBloc, CategoryState>(
      builder: (context, state) {
        return state.categoriesOfService.isNotEmpty
            ? Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.r),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    16.verticalSpace,
                    Text(
                      AppHelper.getTrn(TrKeys.service),
                      style: CustomStyle.interNoSemi(
                          color: colors.textBlack, size: 22),
                    ),
                    12.verticalSpace,
                    GridView.builder(
                        padding: EdgeInsets.only(bottom: 100.r),
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 0.8.r,
                            crossAxisCount: 2,
                            mainAxisExtent: 134.r),
                        itemCount: state.categoriesOfService.length,
                        itemBuilder: (context, index) {
                          return ButtonEffectAnimation(
                            onTap: () {
                              AppRoute.goSearchMap(
                                  context: context,
                                  categoryId:
                                      state.categoriesOfService[index].id,
                                  location: LocationModel(
                                      longitude: place?.lon.toString(),
                                      latitude: place?.lat.toString()));
                            },
                            child: Container(
                              margin: EdgeInsets.all(8.r),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.r),
                                  color:
                                      AppConstants.serviceColors[(index % 11)],
                                  image: DecorationImage(
                                      image: AssetImage(
                                          "assets/images/service${(index % 11) + 1}.png"),
                                      fit: BoxFit.cover)),
                              child: Stack(
                                children: [
                                  Positioned(
                                    bottom: 0,
                                    right: 10,
                                    child: CustomNetworkImage(
                                      url: state
                                              .categoriesOfService[index].img ??
                                          "",
                                      fit: BoxFit.contain,
                                      height: 86,
                                      width: 96,
                                      radius: 10,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(20.r),
                                    child: Text(
                                      state.categoriesOfService[index]
                                              .translation?.title ??
                                          "",
                                      style: CustomStyle.interNoSemi(
                                          color: colors.textBlack, size: 16),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        })
                  ],
                ),
              )
            : const SizedBox.shrink();
      },
    );
  }

  Widget _searchInput(CustomColorSet colors, BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.r),
      padding: EdgeInsets.all(12.r),
      decoration: BoxDecoration(
        color: colors.textWhite,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        children: [
          CustomTextFormField(
            hint: AppHelper.getTrn(TrKeys.serviceBeauty),
            readOnly: true,
            onTap: () {
              AppRoute.goSearchPage(context: context);
            },
            prefixIcon: Icon(
              FlutterRemix.search_2_line,
              color: colors.textBlack,
            ),
          ),
          10.verticalSpace,
          CustomTextFormField(
            controller: placeController,
            hint: AppHelper.getTrn(TrKeys.where),
            readOnly: true,
            onTap: () async {
              final placeMap = await AppRoute.goSearchLocation(context);
              place = placeMap;
              placeController.text = placeMap.displayName;
            },
            prefixIcon: Icon(
              FlutterRemix.map_pin_line,
              color: colors.textBlack,
            ),
          ),
          10.verticalSpace,
          CustomTextFormField(
            controller: dateController,
            hint: AppHelper.getTrn(TrKeys.date),
            readOnly: true,
            onTap: () async {
              final DateTime? time = await AppRoute.goSelectDateSearch(
                  context: context, colors: colors, dateTime: DateTime.now());
              if (time != null) {
                dateController.text = TimeService.dateFormatDMY(time);
              }
            },
            prefixIcon: Icon(
              FlutterRemix.calendar_2_line,
              color: colors.textBlack,
            ),
          ),
          10.verticalSpace,
          CustomTextFormField(
            controller: timeController,
            hint: AppHelper.getTrn(TrKeys.time),
            readOnly: true,
            prefixIcon: Icon(
              FlutterRemix.time_line,
              color: colors.textBlack,
            ),
            onTap: () async {
              final List list = await AppRoute.goSelectTime(context: context);
              timeController.text = "${list.first} - ${list.last}";
            },
          ),
          10.verticalSpace,
          CustomButton(
              title: AppHelper.getTrn(TrKeys.search),
              bgColor: colors.textBlack,
              titleColor: colors.textWhite,
              onTap: () {
                AppRoute.goSearchMap(
                    context: context,
                    location: LocationModel(
                        longitude: place?.lon.toString(),
                        latitude: place?.lat.toString()));
              })
        ],
      ),
    );
  }

  Widget _appbar(BuildContext context, CustomColorSet colors) {
    return Row(
      children: [
        IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: Icon(
              FlutterRemix.menu_line,
              color: colors.textBlack,
            )),
      ],
    );
  }
}
