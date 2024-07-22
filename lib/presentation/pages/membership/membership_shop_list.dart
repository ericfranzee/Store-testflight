import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibeauty/app_constants.dart';
import 'package:ibeauty/application/membership/membership_bloc.dart';
import 'package:ibeauty/domain/model/response/membership_response.dart';
import 'package:ibeauty/domain/service/helper.dart';
import 'package:ibeauty/domain/service/tr_keys.dart';
import 'package:ibeauty/presentation/components/button/animation_button_effect.dart';
import 'package:ibeauty/presentation/components/loading.dart';
import 'package:ibeauty/presentation/components/title.dart';
import 'package:ibeauty/presentation/route/app_route_shop.dart';
import 'package:ibeauty/presentation/style/style.dart';
import 'package:ibeauty/presentation/style/theme/theme.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class MembershipShopList extends StatefulWidget {
  final CustomColorSet colors;
  final int shopId;

  const MembershipShopList(
      {super.key, required this.colors, required this.shopId});

  @override
  State<MembershipShopList> createState() => _MembershipShopListState();
}

class _MembershipShopListState extends State<MembershipShopList> {
  late RefreshController controller;

  @override
  void initState() {
    controller = RefreshController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MembershipBloc, MembershipState>(
      builder: (context, state) {
        return state.memberships.isEmpty
            ? const SizedBox.shrink()
            : state.isLoading
                ? const Loading()
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      32.verticalSpace,
                      TitleWidget(
                        title: AppHelper.getTrn(TrKeys.memberships),
                        titleColor: widget.colors.textBlack,
                      ),
                      16.verticalSpace,
                      SizedBox(
                          height: 100.r,
                          child: SmartRefresher(
                            controller: controller,
                            scrollDirection: Axis.horizontal,
                            enablePullDown: false,
                            enablePullUp: true,
                            onLoading: () {
                              context.read<MembershipBloc>().add(
                                  MembershipEvent.fetchMembership(
                                      context: context,
                                      shopId: widget.shopId,
                                      controller: controller));
                            },
                            child: ListView.builder(
                                padding: EdgeInsets.symmetric(horizontal: 16.r),
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: state.memberships.length,
                                itemBuilder: (context, index) {
                                  return _membershipItem(
                                      context: context,
                                      membership: state.memberships[index],
                                      index: index % 11);
                                }),
                          ))
                    ],
                  );
      },
    );
  }

  Widget _membershipItem(
      {required BuildContext context,
      required MembershipModel membership,
      required int index}) {
    return ButtonEffectAnimation(
      onTap: () {
        AppRouteShop.goMembershipBottomSheet(
            context: context, model: membership, colors: widget.colors);
      },
      child: Padding(
        padding: EdgeInsets.only(right: 8.r),
        child: Container(
          height: 100.r,
          width: 200.r,
          padding: EdgeInsets.all(12.r),
          decoration: BoxDecoration(
              image: const DecorationImage(
                  image: AssetImage("assets/images/gift.png"),
                  fit: BoxFit.contain,
                  alignment: Alignment.topLeft),
              color: AppHelper.checkIfHex(membership.color)
                  ? Color(int.parse('0xFF${membership.color?.substring(1, 7)}'))
                  : AppConstants.serviceColors[index],
              border: Border.all(color: widget.colors.icon)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: 64.r,
                child: Text(
                  "${membership.sessionsCount ?? 0}",
                  style: CustomStyle.interNormal(
                      color: widget.colors.textBlack, size: 18),
                ),
              ),
              const Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 100.r,
                    child: Text(
                      membership.translation?.title ?? "",
                      style: CustomStyle.interNormal(
                          color: widget.colors.textBlack),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.right,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    "${AppHelper.getTrn(TrKeys.duration)}: ${membership.time ?? ""}",
                    style: CustomStyle.interRegular(
                        color: widget.colors.textBlack, size: 14),
                    textAlign: TextAlign.right,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
