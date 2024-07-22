import 'package:add_2_calendar/add_2_calendar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibeauty/application/booking/booking_bloc.dart';
import 'package:ibeauty/application/form_option/form_bloc.dart';
import 'package:ibeauty/application/shop/shop_bloc.dart';
import 'package:ibeauty/domain/model/response/booking_response.dart';
import 'package:ibeauty/domain/model/response/form_options_response.dart';
import 'package:ibeauty/domain/service/helper.dart';
import 'package:ibeauty/domain/service/time_service.dart';
import 'package:ibeauty/domain/service/tr_keys.dart';
import 'package:ibeauty/presentation/components/button/animation_button_effect.dart';
import 'package:ibeauty/presentation/components/custom_scaffold.dart';
import 'package:ibeauty/presentation/components/loading.dart';
import 'package:ibeauty/presentation/pages/booking/widget/booked_service.dart';
import 'package:ibeauty/presentation/pages/shop/widgets/connect_button.dart';
import 'package:ibeauty/presentation/pages/shop/widgets/share_like_widget.dart';
import 'package:ibeauty/presentation/pages/shop/widgets/shop_avatar.dart';
import 'package:ibeauty/presentation/route/app_route_service.dart';
import 'package:ibeauty/presentation/style/style.dart';
import 'package:ibeauty/presentation/style/theme/theme.dart';

import '../../components/button/pop_button.dart';
import 'widget/cancel_screen.dart';

class BookingPage extends StatelessWidget {
  final int shopId;

  const BookingPage({Key? key, required this.shopId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: (colors) => Stack(
        children: [
          SizedBox(
            height: MediaQuery.sizeOf(context).height,
            width: MediaQuery.sizeOf(context).width,
            child: NestedScrollView(
              physics: const NeverScrollableScrollPhysics(),
              headerSliverBuilder: (BuildContext context, bool innerBox) {
                return [_appBar(colors, context)];
              },
              body: SizedBox(
                height: MediaQuery.sizeOf(context).height - 250.r,
                child: ListView(
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  children: [
                    16.verticalSpace,
                    BlocConsumer<BookingBloc, BookingState>(
                      listenWhen: (p, n) {
                        return p.upcoming.length != n.upcoming.length;
                      },
                      listener: (context, state) {
                        List<int> list = state.upcoming
                            .map((e) => e.serviceMasterId ?? 0)
                            .toList();

                        context.read<FormBloc>().add(FormEvent.fetchForms(
                            context: context, serviceMasterIds: list));
                      },
                      builder: (context, state) {
                        return state.isLoading
                            ? const Loading()
                            : Padding(
                                padding: EdgeInsets.symmetric(horizontal: 16.r),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      TimeService.dateFormatMDYHm(
                                          (state.upcoming.isNotEmpty)
                                              ? state.upcoming.first.startDate
                                              : DateTime.now()),
                                      style: CustomStyle.interNoSemi(
                                          color: colors.textBlack, size: 22),
                                    ),
                                    8.verticalSpace,
                                    Text(
                                      "${state.upcoming.fold(0, (e, element) => e + (element.serviceMaster?.interval ?? 0).toInt())} ${AppHelper.getTrn(TrKeys.minute)}",
                                      style: CustomStyle.interNormal(
                                          color: colors.textHint, size: 16),
                                    ),
                                    16.verticalSpace,
                                    const Divider(),
                                    _addCalendar(state, colors),
                                    const Divider(),
                                    if (!(state.upcoming
                                        .map((e) => e.status)
                                        .toList()
                                        .contains(TrKeys.canceled)))
                                      _cancelBooking(context, colors, state),
                                    16.verticalSpace,
                                    Text(
                                      AppHelper.getTrn(TrKeys.details),
                                      style: CustomStyle.interNoSemi(
                                          color: colors.textBlack, size: 22),
                                    ),
                                    22.verticalSpace,
                                    ListView.builder(
                                        padding: EdgeInsets.zero,
                                        shrinkWrap: true,
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        itemCount: state.upcoming.length,
                                        itemBuilder: (context, index) {

                                          return BookedServiceItem(
                                              shopId: shopId,
                                              colors: colors,
                                              bookingModel:
                                                  state.upcoming[index]);
                                        }),
                                    const Divider(),
                                    _formScreen(colors,state.upcoming.map((e) => e.address).toList()),
                                    16.verticalSpace,
                                    Row(
                                      children: [
                                        Text(
                                          AppHelper.getTrn(TrKeys.total),
                                          style: CustomStyle.interNoSemi(
                                              color: colors.textBlack,
                                              size: 26),
                                        ),
                                        const Spacer(),
                                        Text(
                                          AppHelper.numberFormat(
                                            number: (state.upcoming.isNotEmpty
                                                ? state.upcoming.first
                                                    .totalPriceByParent
                                                : 0),
                                          ),
                                          style: CustomStyle.interNoSemi(
                                              color: colors.textBlack,
                                              size: 26),
                                        ),
                                      ],
                                    ),
                                    16.verticalSpace,
                                    const Divider(),
                                  ],
                                ),
                              );
                      },
                    ),
                    100.verticalSpace,
                  ],
                ),
              ),
            ),
          ),
          ShareAndLike(colors: colors, shopId: shopId, likeButton: false)
        ],
      ),
      floatingButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingButton: (colors) => Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.r),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              PopButton(colors: colors),
              const Spacer(),
              ConnectButtonShop(colors: colors)
            ],
          )),
    );
  }

  BlocBuilder<FormBloc, FormOptionsState> _formScreen(
      CustomColorSet colors, List<BookingAddressModel?> list) {
    List<FormOptionsData?> listForm = [];
    for (var element in list) {
      listForm.addAll(element?.forms ?? []);
    }
    return BlocBuilder<FormBloc, FormOptionsState>(
      builder: (context, state) {
        return state.formOptionList.isEmpty
            ? const SizedBox.shrink()
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  24.verticalSpace,
                  Text(
                    AppHelper.getTrn(TrKeys.form),
                    style: CustomStyle.interNoSemi(
                        color: colors.textBlack, size: 26),
                  ),
                  16.verticalSpace,
                  ListView.separated(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: state.formOptionList.length,
                    itemBuilder: (context, index) {
                      return ButtonEffectAnimation(
                        onTap: () {
                          AppRouteService.goFormOptionPage(
                            context: context,
                            form: listForm.firstWhere(
                                (element) =>
                                    element?.id ==
                                    state.formOptionList[index].id,
                                orElse: () => null),
                            formOptionId: state.formOptionList[index].id,
                          );
                        },
                        child: Row(
                          children: [
                            Icon(
                              FlutterRemix.survey_line,
                              color: colors.textBlack,
                            ),
                            16.horizontalSpace,
                            Text(
                              state.formOptionList[index].translation?.title ??
                                  "",
                              style: CustomStyle.interNormal(
                                  color: colors.textBlack),
                            ),
                            const Spacer(),
                            Icon(
                              FlutterRemix.arrow_right_s_line,
                              color: colors.textBlack,
                            )
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return const Divider();
                    },
                  ),
                  16.verticalSpace,
                ],
              );
      },
    );
  }

  Column _cancelBooking(
      BuildContext context, CustomColorSet colors, BookingState state) {
    return Column(
      children: [
        ButtonEffectAnimation(
          onTap: () {
            AppHelper.showCustomModalBottomSheet(
                context: context,
                modal: BlocProvider.value(
                  value: context.read<BookingBloc>(),
                  child: CancelBookingScreen(
                      colors: colors, bookId: state.upcoming.first.id ?? 0),
                ));
          },
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 16.r),
            child: Row(
              children: [
                Icon(FlutterRemix.close_circle_line,
                    color: colors.textBlack, size: 26.r),
                16.horizontalSpace,
                Text(
                  AppHelper.getTrn(TrKeys.cancelAppointment),
                  style: CustomStyle.interNormal(
                      color: colors.textBlack, size: 20),
                ),
                const Spacer(),
                Icon(FlutterRemix.arrow_right_s_line,
                    color: colors.textBlack, size: 26.r)
              ],
            ),
          ),
        ),
        const Divider(),
      ],
    );
  }

  ButtonEffectAnimation _addCalendar(
      BookingState state, CustomColorSet colors) {
    return ButtonEffectAnimation(
      onTap: () {
        final Event event = Event(
          title: state.upcoming.first.serviceMaster?.shop?.translation?.title ??
              "Shop",
          description: state.upcoming.first.serviceMaster?.shop?.translation
                  ?.description ??
              "description",
          location:
              state.upcoming.first.serviceMaster?.shop?.translation?.address ??
                  "address",
          startDate: state.upcoming.first.startDate ?? DateTime.now(),
          endDate: state.upcoming.first.endDate ?? DateTime.now(),
          iosParams: const IOSParams(
            reminder: Duration(hours: 1),
          ),
        );
        Add2Calendar.addEvent2Cal(event);
      },
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 16.r),
        child: Row(
          children: [
            Icon(FlutterRemix.calendar_event_line,
                color: colors.textBlack, size: 26.r),
            16.horizontalSpace,
            Text(
              AppHelper.getTrn(TrKeys.addToCalendar),
              style: CustomStyle.interNormal(color: colors.textBlack, size: 20),
            ),
            const Spacer(),
            Icon(FlutterRemix.arrow_right_s_line,
                color: colors.textBlack, size: 26.r)
          ],
        ),
      ),
    );
  }

  SliverAppBar _appBar(CustomColorSet colors, BuildContext context) {
    return SliverAppBar(
      pinned: true,
      snap: false,
      floating: true,
      forceElevated: true,
      expandedHeight: 250.r,
      toolbarHeight: 56.r,
      elevation: 0,
      leading: const SizedBox.shrink(),
      backgroundColor: colors.backgroundColor,
      flexibleSpace: FlexibleSpaceBar(
        expandedTitleScale: 1.5,
        collapseMode: CollapseMode.pin,
        title: BlocBuilder<ShopBloc, ShopState>(
          buildWhen: (p, n) {
            return p.shop != n.shop;
          },
          builder: (context, state) {
            return Stack(
              children: [
                Positioned(
                  left: 14.r,
                  right: 100.r,
                  child: SizedBox(
                    width: double.infinity,
                    child: Center(
                      child: Text(state.shop?.translation?.title ?? "",
                          style: CustomStyle.interSemi(
                              color: colors.textBlack, size: 21),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
        titlePadding:
            EdgeInsets.only(top: MediaQuery.paddingOf(context).top + 10.r),
        background: ShopAvatar(colors: colors),
      ),
    );
  }
}
