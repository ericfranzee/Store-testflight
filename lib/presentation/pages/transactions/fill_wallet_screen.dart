import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibeauty/application/profile/profile_bloc.dart';
import 'package:ibeauty/application/wallet/wallet_bloc.dart';
import 'package:ibeauty/domain/service/helper.dart';
import 'package:ibeauty/domain/service/tr_keys.dart';
import 'package:ibeauty/domain/service/validators.dart';
import 'package:ibeauty/infrastructure/local_storage/local_storage.dart';
import 'package:ibeauty/presentation/components/button/custom_button.dart';
import 'package:ibeauty/presentation/components/custom_textformfield.dart';
import 'package:ibeauty/presentation/components/keyboard_dismisser.dart';
import 'package:ibeauty/presentation/style/style.dart';
import 'package:ibeauty/presentation/style/theme/theme.dart';

class FillWalletScreen extends StatefulWidget {
  final CustomColorSet colors;

  const FillWalletScreen({super.key, required this.colors});

  @override
  State<FillWalletScreen> createState() => _FillWalletScreenState();
}

class _FillWalletScreenState extends State<FillWalletScreen> {
  final GlobalKey<FormState> form = GlobalKey<FormState>();
  late TextEditingController priceController;

  @override
  void initState() {
    priceController = TextEditingController();
    super.initState();
  }

  @override
  void deactivate() {
    priceController.dispose();
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
      isLtr: LocalStorage.getLangLtr(),
      child: Container(
        padding: EdgeInsets.all(16.r),
        decoration: BoxDecoration(
          color: widget.colors.backgroundColor,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(16.r),
            topLeft: Radius.circular(16.r),
          ),
        ),
        child: Form(
          key: form,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              24.verticalSpace,
              Text(
                AppHelper.getTrn(TrKeys.fillWallet),
                style: CustomStyle.interNoSemi(color: widget.colors.textBlack),
              ),
              16.verticalSpace,
              CustomTextFormField(
                hint:
                    "${AppHelper.getTrn(TrKeys.price)} ${AppHelper.getTrn(LocalStorage.getSelectedCurrency()?.symbol ?? "")}",
                validation: AppValidators.isNotEmptyValidator,
                controller: priceController,
                inputType: TextInputType.number,
              ),
              16.verticalSpace,
              BlocBuilder<WalletBloc, WalletState>(
                builder: (context, state) {
                  return Expanded(
                    child: ListView.builder(
                        padding: EdgeInsets.zero,
                        itemCount: state.list?.length ?? 0,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              WidgetsBinding.instance.focusManager.primaryFocus
                                  ?.unfocus();
                              context
                                  .read<WalletBloc>()
                                  .add(WalletEvent.selectPayment(index: index));
                            },
                            child: Column(
                              children: [
                                8.verticalSpace,
                                Row(
                                  children: [
                                    Icon(
                                      state.selectPayment == index
                                          ? FlutterRemix.checkbox_circle_fill
                                          : FlutterRemix
                                              .checkbox_blank_circle_line,
                                      color: state.selectPayment == index
                                          ? widget.colors.primary
                                          : CustomStyle.black,
                                    ),
                                    10.horizontalSpace,
                                    Text(
                                      state.list?[index].tag ?? "",
                                      style: CustomStyle.interNormal(
                                        size: 14,
                                        color: widget.colors.textBlack,
                                      ),
                                    )
                                  ],
                                ),
                                Divider(
                                  color: widget.colors.newBoxColor,
                                ),
                                8.verticalSpace
                              ],
                            ),
                          );
                        }),
                  );
                },
              ),
              16.verticalSpace,
              BlocBuilder<WalletBloc, WalletState>(
                buildWhen: (p, n) {
                  return p.isButtonLoading != n.isButtonLoading;
                },
                builder: (context, state) {
                  return CustomButton(
                      isLoading: state.isButtonLoading,
                      title: AppHelper.getTrn(TrKeys.pay),
                      bgColor: widget.colors.primary,
                      titleColor: widget.colors.white,
                      onTap: () {
                        if (form.currentState?.validate() ?? false) {
                          if (state.list?.isEmpty ?? true) {
                            AppHelper.openDialog(
                                context: context,
                                title: AppHelper.getTrn(
                                    TrKeys.thereAreNoPaymentTypesHere));
                            return;
                          }
                          context.read<WalletBloc>().add(WalletEvent.fillWallet(
                              context: context,
                              walletId: LocalStorage.getUser().wallet?.id ?? 0,
                              price: priceController.text,
                              onSuccess: () {
                                context.read<WalletBloc>().add(
                                    WalletEvent.fetchTransactions(
                                        context: context, isRefresh: true));
                                context.read<ProfileBloc>().add(
                                    ProfileEvent.fetchProfile(
                                        context: context));
                                Navigator.pop(context);
                              }));
                        }
                      });
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
