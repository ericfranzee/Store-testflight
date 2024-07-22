// ignore_for_file: unused_result

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibeauty/application/checkout/checkout_bloc.dart';
import 'package:ibeauty/application/parcel/parcel_bloc.dart';
import 'package:ibeauty/domain/model/response/payments_response.dart';
import 'package:ibeauty/domain/service/helper.dart';
import 'package:ibeauty/domain/service/tr_keys.dart';
import 'package:ibeauty/infrastructure/local_storage/local_storage.dart';
import 'package:ibeauty/presentation/components/button/custom_button.dart';
import 'package:ibeauty/presentation/components/button/pop_button.dart';
import 'package:ibeauty/presentation/components/custom_scaffold.dart';
import 'package:ibeauty/presentation/components/keyboard_dismisser.dart';
import 'package:ibeauty/presentation/pages/checkout/payment_screen.dart';
import 'package:ibeauty/presentation/style/style.dart';
import 'package:ibeauty/presentation/style/theme/theme.dart';
import 'package:lottie/lottie.dart';
import 'widgets/info_item.dart';
import 'widgets/recipient_widget.dart';
import 'widgets/sender_widget.dart';
import 'widgets/time_and_type.dart';

class ParcelPage extends StatefulWidget {
  const ParcelPage({super.key});

  @override
  State<ParcelPage> createState() => _ParcelPageState();
}

class _ParcelPageState extends State<ParcelPage> {
  final TextEditingController fromUsername =
      TextEditingController(text: LocalStorage.getUser().firstname);
  final TextEditingController fromPhone = TextEditingController();
  final TextEditingController fromHouse = TextEditingController();
  final TextEditingController fromFloor = TextEditingController();
  final TextEditingController toUsername = TextEditingController();
  final TextEditingController toPhone = TextEditingController();
  final TextEditingController toHouse = TextEditingController();
  final TextEditingController toFloor = TextEditingController();
  final TextEditingController note = TextEditingController();
  final TextEditingController comment = TextEditingController();
  final TextEditingController itemValue = TextEditingController();
  final TextEditingController instruction = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: (colors) => SafeArea(
        child: KeyboardDismisser(
          isLtr: LocalStorage.getLangLtr(),
          child: Column(
            children: [
              Text(
                AppHelper.getTrn(TrKeys.parcel),
                style: CustomStyle.interNoSemi(
                    color: colors.textBlack, size: 18),
              ),
              AppHelper.getParcel()
                  ? Expanded(
                      child: BlocBuilder<ParcelBloc, ParcelState>(
                        builder: (context, state) {
                          return SingleChildScrollView(
                            padding: EdgeInsets.all(16.r),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Form(
                                  key: formKey,
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                SenderWidget(
                                                  state: state,
                                                  username: fromUsername,
                                                  phone: fromPhone,
                                                  house: fromHouse,
                                                  flour: fromFloor,
                                                  comment: comment,
                                                  colors: colors,
                                                ),
                                                10.verticalSpace,
                                                RecipientWidget(
                                                  state: state,
                                                  colors: colors,
                                                  username: toUsername,
                                                  phone: toPhone,
                                                  house: toHouse,
                                                  flour: toFloor,
                                                  description: note,
                                                  addInstruction: instruction,
                                                  value: itemValue,
                                                ),
                                              ],
                                            ),
                                          ),
                                          if (state.addressTo != null &&
                                              state.addressFrom != null &&
                                              !state.expand)
                                            InkWell(
                                              onTap: () => context
                                                  .read<ParcelBloc>()
                                                  .add(
                                                      ParcelEvent.switchAddress(
                                                          context: context)),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Icon(
                                                  FlutterRemix
                                                      .arrow_up_down_line,
                                                  color: colors.textBlack,
                                                ),
                                              ),
                                            )
                                        ],
                                      ),
                                      if (state.addressTo == null &&
                                          state.addressFrom == null)
                                        _infoWidget(colors),
                                    ],
                                  ),
                                ),
                                if (state.expand)
                                  BlocBuilder<CheckoutBloc, CheckoutState>(
                                    buildWhen: (p, n) {
                                      return p.selectId != n.selectId;
                                    },
                                    builder: (context, stateCheckout) {
                                      return PaymentMethodsScreen(
                                        parcel: true,
                                        colors: colors,
                                        list: stateCheckout.list ?? [],
                                        selectId: stateCheckout.selectId,
                                        select: (int id) {
                                          context.read<CheckoutBloc>().add(
                                              CheckoutEvent.changePayment(
                                                  id: id));
                                        },
                                      );
                                    },
                                  ),
                                if (state.addressTo != null ||
                                    state.addressFrom != null)
                                  TypeAndTime(
                                    colors: colors,
                                    state: state,
                                  ),
                                96.verticalSpace
                              ],
                            ),
                          );
                        },
                      ),
                    )
                  : Column(
                      children: [
                        32.verticalSpace,
                        Lottie.asset("assets/lottie/notification_empty.json"),
                        24.verticalSpace,
                        Padding(
                          padding: EdgeInsets.all(16.r),
                          child: Text(
                            AppHelper.getTrn(TrKeys.ifYouWantToUseThisService),
                            style: CustomStyle.interNormal(
                                color: colors.textBlack),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    )
            ],
          ),
        ),
      ),
      floatingButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingButton: (colors) => Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Row(
          children: [
            PopButton(colors: colors),
            16.horizontalSpace,
            Expanded(
              child: SizedBox(
                height: 60.r,
                child: BlocBuilder<ParcelBloc, ParcelState>(
                  builder: (context, state) {
                    return state.addressTo != null &&
                            state.addressFrom != null &&
                            state.types.isNotEmpty
                        ? BlocBuilder<CheckoutBloc, CheckoutState>(
                            builder: (context, stateCheckout) {
                              return CustomButton(
                                bgColor:
                                    !state.error ? colors.primary : colors.textHint,
                                titleColor:
                                    !state.error ? colors.white : colors.textWhite,
                                title:
                                    "${state.expand ? AppHelper.getTrn(TrKeys.order) : AppHelper.getTrn(TrKeys.continueText)} ${AppHelper.numberFormat(number: state.calculate?.data?.price ?? 0)}",
                                onTap: () {
                                  if (state.error) {
                                    return;
                                  }
                                  if (!state.expand) {
                                    context
                                        .read<ParcelBloc>()
                                        .add(const ParcelEvent.changeExpand());
                                  } else {
                                    if (formKey.currentState?.validate() ?? false) {
                                      context.read<ParcelBloc>().add(
                                          ParcelEvent.orderParcel(
                                              context: context,
                                              note: note.text,
                                              usernameTo: toUsername.text,
                                              usernameFrom: fromUsername.text,
                                              phoneTo: toPhone.text,
                                              phoneFrom: fromPhone.text,
                                              houseFrom: fromHouse.text,
                                              houseTo: toHouse.text,
                                              floorTo: toFloor.text,
                                              floorFrom: fromFloor.text,
                                              comment: comment.text,
                                              value: itemValue.text,
                                              instruction: instruction.text,
                                              paymentData: stateCheckout
                                                      .list
                                                      ?.firstWhere(
                                                          (element) =>
                                                              element.id ==
                                                              stateCheckout.selectId,
                                                          orElse: () =>
                                                              PaymentData()) ??
                                                  PaymentData()));
                                    }
                                  }
                                },
                                isLoading: state.isLoading,
                              );
                            },
                          )
                        : const SizedBox.shrink();
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _infoWidget(CustomColorSet colors) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        24.verticalSpace,
        Text(
          AppHelper.getTrn(TrKeys.howItWorks),
          style: CustomStyle.interNoSemi(
            size: 20,
            color: colors.textBlack,
          ),
        ),
        12.verticalSpace,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                InfoItem(
                  isLarge: true,
                  index: 0,
                  colors: colors,
                ),
                InfoItem(
                  index: 1,
                  colors: colors,
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InfoItem(
                  index: 2,
                  colors: colors,
                ),
                InfoItem(
                  isLarge: true,
                  index: 3,
                  colors: colors,
                ),
              ],
            )
          ],
        )
      ],
    );
  }
}
