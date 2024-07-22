import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ibeauty/app_constants.dart';
import 'package:ibeauty/application/booking/booking_bloc.dart';
import 'package:ibeauty/application/membership/membership_bloc.dart';
import 'package:ibeauty/domain/model/model/master_model.dart';
import 'package:ibeauty/domain/model/response/my_membership_response.dart';
import 'package:ibeauty/domain/service/helper.dart';
import 'package:ibeauty/domain/service/time_service.dart';
import 'package:ibeauty/domain/service/tr_keys.dart';
import 'package:ibeauty/infrastructure/local_storage/local_storage.dart';
import 'package:ibeauty/presentation/components/button/animation_button_effect.dart';
import 'package:ibeauty/presentation/components/keyboard_dismisser.dart';
import 'package:ibeauty/presentation/components/loading.dart';
import 'package:ibeauty/presentation/style/style.dart';
import 'package:ibeauty/presentation/style/theme/theme.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class SelectMembershipScreen extends StatefulWidget {
  final CustomColorSet colors;
  final ScrollController controller;
  final int? serviceId;
  final MasterModel? selectMaster;
  final DateTime startTime;

  const SelectMembershipScreen(
      {super.key,
      required this.colors,
      required this.controller,
      required this.serviceId,
      required this.selectMaster,
      required this.startTime});

  @override
  State<SelectMembershipScreen> createState() => _SelectMembershipScreenState();
}

class _SelectMembershipScreenState extends State<SelectMembershipScreen> {
  late RefreshController membershipRefresh;

  @override
  void initState() {
    membershipRefresh = RefreshController();
    super.initState();
  }

  @override
  void dispose() {
    membershipRefresh.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
      isLtr: LocalStorage.getLangLtr(),
      child: Container(
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
              AppHelper.getTrn(TrKeys.selectMembership),
              style: CustomStyle.interNormal(color: widget.colors.textBlack),
            ),
            24.verticalSpace,
            BlocBuilder<MembershipBloc, MembershipState>(
              builder: (context, state) {
                return Expanded(
                  child: state.isLoading
                      ? const Loading()
                      : state.myMemberships.isNotEmpty
                          ? SmartRefresher(
                              controller: membershipRefresh,
                              scrollController: widget.controller,
                              enablePullUp: true,
                              enablePullDown: false,
                              onLoading: () {
                                context.read<MembershipBloc>().add(
                                    MembershipEvent.myMemberships(
                                        context: context,
                                        controller: membershipRefresh));
                              },
                              child: ListView.builder(
                                  controller: widget.controller,
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 16.r),
                                  shrinkWrap: true,
                                  itemCount: state.myMemberships.length,
                                  itemBuilder: (context, index) {
                                    return _membershipItem(
                                        context: context,
                                        myMembership:
                                            state.myMemberships[index],
                                        index: index,
                                        colors: widget.colors);
                                  }),
                            )
                          : Column(
                              children: [
                                32.verticalSpace,
                                SvgPicture.asset("assets/svg/noMembership.svg"),
                                32.verticalSpace,
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 32.r),
                                  child: Text(
                                    AppHelper.getTrn(
                                        TrKeys.youHaveNoMembership),
                                    textAlign: TextAlign.center,
                                    style: CustomStyle.interNoSemi(
                                        color: widget.colors.textBlack,
                                        size: 30),
                                  ),
                                ),
                                16.verticalSpace,
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 32.r),
                                  child: Text(
                                    AppHelper.getTrn(TrKeys
                                        .youDontHaveAnyMembershipMaybeYouWillGetMembershipSoon),
                                    textAlign: TextAlign.center,
                                    style: CustomStyle.interRegular(
                                        color: widget.colors.textBlack,
                                        size: 16),
                                  ),
                                ),
                              ],
                            ),
                );
              },
            )
          ],
        ),
      ),
    );
  }

  Widget _membershipItem({
    required BuildContext context,
    required MyMembershipModel myMembership,
    required int index,
    required CustomColorSet colors,
  }) {
    return ButtonEffectAnimation(
      onTap: () {
        Navigator.pop(context);
        context.read<BookingBloc>()
          ..add(BookingEvent.selectMaster(
              serviceId: widget.serviceId,
              master: widget.selectMaster?.copyWith(membership: myMembership)))
          ..add(BookingEvent.calculateBooking(
              context: context, startTime: widget.startTime));
      },
      child: Padding(
        padding: EdgeInsets.only(right: 8.r),
        child: Container(
          height: 120.r,
          width: double.infinity,
          margin: EdgeInsets.only(bottom: 16.r),
          decoration: BoxDecoration(
              image: const DecorationImage(
                  image: AssetImage("assets/images/gift.png"),
                  fit: BoxFit.contain,
                  alignment: Alignment.topLeft),
              color: AppHelper.checkIfHex(myMembership.color)
                  ? Color(
                      int.parse('0xFF${myMembership.color?.substring(1, 7)}'))
                  : AppConstants.serviceColors[index],
              border: Border.all(color: colors.icon)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(8.r),
                child: SizedBox(
                  width: 64.r,
                  child: Text(
                    "${myMembership.remainder ?? 0}/${myMembership.sessionsCount ?? 0}",
                    style: CustomStyle.interNormal(
                        color: colors.textBlack, size: 16),
                  ),
                ),
              ),
              const Spacer(),
              Padding(
                padding: EdgeInsets.all(16.r),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      myMembership.memberShip?.translation?.title ?? "",
                      style: CustomStyle.interNormal(color: colors.textBlack),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.right,
                    ),
                    Text(
                      myMembership.memberShip?.shop?.translation?.title ?? "",
                      style: CustomStyle.interRegular(
                          color: colors.textHint, size: 14),
                      textAlign: TextAlign.right,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const Spacer(),
                    Text(
                      "${AppHelper.getTrn(TrKeys.expiredAt)}: ${TimeService.dateFormatMDYHm(myMembership.expiredAt)}",
                      style: CustomStyle.interRegular(
                          color: colors.textBlack, size: 14),
                      textAlign: TextAlign.right,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
