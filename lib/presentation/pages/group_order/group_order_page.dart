import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:ibeauty/app_constants.dart';
import 'package:ibeauty/application/cart/cart_bloc.dart';
import 'package:ibeauty/domain/service/helper.dart';
import 'package:ibeauty/domain/service/tr_keys.dart';
import 'package:ibeauty/infrastructure/local_storage/local_storage.dart';
import 'package:ibeauty/presentation/components/button/custom_button.dart';
import 'package:ibeauty/presentation/components/custom_network_image.dart';
import 'package:ibeauty/presentation/components/custom_textformfield.dart';
import 'package:ibeauty/presentation/components/keyboard_dismisser.dart';
import 'package:ibeauty/presentation/style/style.dart';
import 'package:ibeauty/presentation/style/theme/theme.dart';

class GroupOrderPage extends StatefulWidget {
  final CustomColorSet colors;

  const GroupOrderPage({
    super.key,
    required this.colors,
  });

  @override
  State<GroupOrderPage> createState() => _GroupOrderPageState();
}

class _GroupOrderPageState extends State<GroupOrderPage> {
  Timer? timer;

  @override
  void initState() {
    if (LocalStorage.getToken().isNotEmpty) {
      timer = Timer.periodic(
          Duration(seconds: AppConstants.timeRefresh.inSeconds), (Timer t) {
        context.read<CartBloc>().add(CartEvent.getCart(context: context));
      });
    }
    super.initState();
  }

  @override
  void deactivate() {
    timer?.cancel();
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
      isLtr: LocalStorage.getLangLtr(),
      child: Container(
        margin: MediaQuery.viewInsetsOf(context),
        width: double.infinity,
        decoration: BoxDecoration(
          color: widget.colors.newBoxColor,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(24.r),
            topLeft: Radius.circular(24.r),
          ),
        ),
        padding: EdgeInsets.only(left: 16.r, right: 16.r, bottom: 24.r),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              24.verticalSpace,
              Text(
                AppHelper.getTrn(TrKeys.groupOrder),
                style: CustomStyle.interNoSemi(
                    color: widget.colors.textBlack, size: 24),
              ),
              8.verticalSpace,
              Text(
                AppHelper.getTrn(TrKeys.groupOrderText),
                style: CustomStyle.interNormal(color: widget.colors.textBlack),
              ),
              16.verticalSpace,
              BlocBuilder<CartBloc, CartState>(
                builder: (context, state) {
                  return (state.cart?.group ?? false)
                      ? _members(context, state)
                      : CustomButton(
                          isLoading: state.isButtonLoading,
                          title: AppHelper.getTrn(TrKeys.start),
                          bgColor: widget.colors.primary,
                          titleColor: widget.colors.white,
                          onTap: () {
                            context
                                .read<CartBloc>()
                                .add(CartEvent.startGroupOrder(
                                    context: context,
                                    onSuccess: () {
                                      context.read<CartBloc>().add(
                                          CartEvent.createLink(
                                              context: context));
                                    }));
                          });
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Column _members(BuildContext context, CartState state) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (LocalStorage.getGroupOrder().id == null)
          CustomTextFormField(
            hint: state.groupOrderLink,
            suffixIcon: IconButton(
              onPressed: ()  {
                FlutterShare.share(
                    title: AppHelper.getTrn(TrKeys.groupOrder),
                    linkUrl: state.groupOrderLink ?? "");
              },
              icon: Icon(
                FlutterRemix.share_fill,
                color: widget.colors.textBlack,
              ),
            ),
          ),
        16.verticalSpace,
        Text(
          AppHelper.getTrn(TrKeys.members),
          style: CustomStyle.interNormal(color: widget.colors.textBlack),
        ),
        6.verticalSpace,
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          itemCount: state.cart?.userCarts?.length ?? 0,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(4.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      CustomNetworkImage(
                        url: "",
                        height: 36,
                        width: 36,
                        radius: 18,
                        name: state.cart?.userCarts?[index].name,
                      ),
                      16.horizontalSpace,
                      Text(
                        state.cart?.userCarts?[index].name ?? "",
                        style: CustomStyle.interNormal(
                            color: widget.colors.textBlack, size: 14),
                      ),
                      const Spacer(),
                      if (state.cart?.userCarts?[index].userId !=
                              state.cart?.ownerId &&
                          LocalStorage.getGroupOrder().id == null)
                        IconButton(
                            onPressed: () {
                              context.read<CartBloc>().add(CartEvent.deleteUser(
                                  context: context,
                                  uuid:
                                      state.cart?.userCarts?[index].uuid ?? "",
                                  onSuccess: () {
                                    context.read<CartBloc>().add(
                                        CartEvent.getCart(
                                            context: context, refresh: true));
                                  }));
                            },
                            icon: Icon(
                              FlutterRemix.close_line,
                              color: widget.colors.textBlack,
                            )),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
        16.verticalSpace,
        CustomButton(
            changeColor: true,
            isLoading: state.isButtonLoading,
            title: LocalStorage.getGroupOrder().id == null
                ? AppHelper.getTrn(TrKeys.cancel)
                : AppHelper.getTrn(TrKeys.leave),
            bgColor: widget.colors.textBlack,
            titleColor: widget.colors.textWhite,
            onTap: () {
              if (LocalStorage.getGroupOrder().id != null) {
                LocalStorage.deleteGroupOrder();
                return;
              }
              context
                  .read<CartBloc>()
                  .add(CartEvent.deleteCart(context: context));
            })
      ],
    );
  }
}
