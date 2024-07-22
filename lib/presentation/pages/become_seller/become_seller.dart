import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibeauty/app_constants.dart';
import 'package:ibeauty/application/become_seller/become_seller_bloc.dart';
import 'package:ibeauty/application/map/map_bloc.dart';
import 'package:ibeauty/domain/model/model/location_model.dart';
import 'package:ibeauty/domain/service/helper.dart';
import 'package:ibeauty/domain/service/tr_keys.dart';
import 'package:ibeauty/domain/service/validators.dart';
import 'package:ibeauty/infrastructure/local_storage/local_storage.dart';
import 'package:ibeauty/presentation/components/button/custom_button.dart';
import 'package:ibeauty/presentation/components/button/pop_button.dart';
import 'package:ibeauty/presentation/components/custom_scaffold.dart';
import 'package:ibeauty/presentation/components/custom_textformfield.dart';
import 'package:ibeauty/presentation/components/keyboard_dismisser.dart';
import 'package:ibeauty/presentation/pages/become_seller/widgets/bg_image_screen.dart';
import 'package:ibeauty/presentation/pages/become_seller/widgets/delivery_info.dart';
import 'package:ibeauty/presentation/pages/become_seller/widgets/logo_screen.dart';
import 'package:ibeauty/presentation/pages/map/map_page.dart';
import 'package:ibeauty/presentation/style/style.dart';
import 'package:ibeauty/presentation/style/theme/theme.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:io' show Platform;

class BecomeSellerPage extends StatefulWidget {
  const BecomeSellerPage({super.key});

  @override
  State<BecomeSellerPage> createState() => _BecomeSellerPageState();
}

class _BecomeSellerPageState extends State<BecomeSellerPage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late TextEditingController title;
  late TextEditingController description;
  late TextEditingController phone;
  late TextEditingController deliveryType;
  late TextEditingController deliveryFrom;
  late TextEditingController deliveryTo;
  late TextEditingController minAmount;
  late TextEditingController tax;
  late TextEditingController address;
  LocationModel? location;

  List<String> types = [
    TrKeys.month,
    TrKeys.week,
    TrKeys.day,
    TrKeys.hour,
    TrKeys.minute,
  ];

  @override
  void initState() {
    title = TextEditingController();
    description = TextEditingController();
    phone = TextEditingController();
    deliveryFrom = TextEditingController();
    deliveryTo = TextEditingController();
    minAmount = TextEditingController();
    tax = TextEditingController();
    address = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    title.dispose();
    description.dispose();
    phone.dispose();
    deliveryFrom.dispose();
    deliveryTo.dispose();
    minAmount.dispose();
    tax.dispose();
    address.dispose();
    super.dispose();
  }

  createShop(BecomeSellerState state) {
    if (formKey.currentState?.validate() ?? false) {
      if (state.logoPath?.isEmpty ?? true) {
        AppHelper.errorSnackBar(
            context: context, message: AppHelper.getTrn(TrKeys.logoIsNotEmpty));
        return;
      }
      if (state.bgPath?.isEmpty ?? true) {
        AppHelper.errorSnackBar(
            context: context,
            message: AppHelper.getTrn(TrKeys.bgImageIsNotEmpty));
        return;
      }
      context.read<BecomeSellerBloc>().add(BecomeSellerEvent.createShop(
          context: context,
          shopName: title.text,
          description: description.text,
          phone: phone.text,
          deliveryTo: deliveryTo.text,
          deliveryFrom: deliveryFrom.text,
          minAmount: minAmount.text,
          tax: tax.text,
          location: location));
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: (colors) => SafeArea(
        bottom: false,
        child: KeyboardDismisser(
          isLtr: LocalStorage.getLangLtr(),
          child: Column(
            children: [
              Text(
                AppHelper.getTrn(TrKeys.becomeSeller),
                style: CustomStyle.interNoSemi(
                    color: colors.textBlack, size: 18),
              ),
              BlocBuilder<BecomeSellerBloc, BecomeSellerState>(
                builder: (context, state) {
                  return state.isSuccess ||
                          LocalStorage.getUser().shop?.status == "new"
                      ? _processing(colors)
                      : LocalStorage.getUser().shop?.status == "approved"
                          ? _approved(colors)
                          : Form(
                              key: formKey,
                              child: Expanded(
                                child: ListView(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 16.r, vertical: 24.r),
                                  shrinkWrap: true,
                                  children: [
                                    LogoScreen(colors: colors),
                                    16.verticalSpace,
                                    BgImageScreen(colors: colors),
                                    16.verticalSpace,
                                    CustomTextFormField(
                                      hint: AppHelper.getTrn(TrKeys.shopName),
                                      controller: title,
                                      validation:
                                          AppValidators.isNotEmptyValidator,
                                    ),
                                    16.verticalSpace,
                                    CustomTextFormField(
                                      hint:
                                          AppHelper.getTrn(TrKeys.description),
                                      controller: description,
                                      validation:
                                          AppValidators.isNotEmptyValidator,
                                    ),
                                    16.verticalSpace,
                                    CustomTextFormField(
                                      hint:
                                          AppHelper.getTrn(TrKeys.phoneNumber),
                                      controller: phone,
                                      validation:
                                          AppValidators.isNotEmptyValidator,
                                      inputType: TextInputType.phone,
                                    ),
                                    16.verticalSpace,
                                    DeliveryInfo(
                                        colors: colors,
                                        types: types,
                                        deliveryFrom: deliveryFrom,
                                        deliveryTo: deliveryTo),
                                    16.verticalSpace,
                                    _orderInfo(colors),
                                    16.verticalSpace,
                                    CustomTextFormField(
                                      hint: AppHelper.getTrn(TrKeys.address),
                                      controller: address,
                                      validation:
                                          AppValidators.isNotEmptyValidator,
                                      readOnly: true,
                                      onTap: () async {
                                        final data =
                                            await Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (_) =>
                                                MultiBlocProvider(providers: [
                                              BlocProvider(
                                                  create: (context) =>
                                                      MapBloc()),
                                            ], child: const MapPage()),
                                          ),
                                        );
                                        if (data.runtimeType == LocationModel) {
                                          address.text =
                                              (data as LocationModel).address ??
                                                  "";
                                          location = data;
                                        }
                                      },
                                    ),
                                    24.verticalSpace,
                                    BlocBuilder<BecomeSellerBloc,
                                        BecomeSellerState>(
                                      builder: (context, state) {
                                        return Padding(
                                          padding: EdgeInsets.only(
                                              bottom: MediaQuery.viewInsetsOf(
                                                      context)
                                                  .bottom),
                                          child: CustomButton(
                                              isLoading: state.isLoading,
                                              title:
                                                  AppHelper.getTrn(TrKeys.save),
                                              bgColor: colors.primary,
                                              titleColor: colors.white,
                                              onTap: () => createShop(state)),
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            );
                },
              )
            ],
          ),
        ),
      ),
      floatingButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingButton: (colors) => PopButton(colors: colors),
    );
  }

  Padding _approved(CustomColorSet colors) {
    return Padding(
      padding: EdgeInsets.all(24.r),
      child: Column(
        children: [
          CustomButton(
            title: AppHelper.getTrn(TrKeys.goToAdminPanel),
            bgColor: colors.primary,
            titleColor: colors.white,
            onTap: () async {
              final Uri launchUri = Uri.parse(AppConstants.adminPageUrl);
              await launchUrl(launchUri);
            },
          ),
          24.verticalSpace,
          CustomButton(
            title: AppHelper.getTrn(Platform.isAndroid
                ? TrKeys.goToSellerAppOnAndroid
                : TrKeys.goToSellerAppOnIos),
            bgColor: colors.primary,
            titleColor: colors.white,
            onTap: () async {
              final Uri launchUri = Uri.parse(Platform.isAndroid
                  ? AppConstants.sellerAppAndroid
                  : AppConstants.sellerAppIos);
              await launchUrl(launchUri, mode: LaunchMode.externalApplication);
            },
          ),
        ],
      ),
    );
  }

  Column _processing(CustomColorSet colors) {
    return Column(
      children: [
        Lottie.asset('assets/lottie/processing.json'),
        Text(
          AppHelper.getTrn(TrKeys.yourRequest),
          style: CustomStyle.interNoSemi(
            size: 18,
            color: colors.textBlack,
          ),
        ),
      ],
    );
  }

  Column _orderInfo(CustomColorSet colors) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppHelper.getTrn(TrKeys.orderInfo),
          style: CustomStyle.interNormal(color: colors.textBlack),
        ),
        16.verticalSpace,
        Row(
          children: [
            Expanded(
              child: CustomTextFormField(
                hint: AppHelper.getTrn(TrKeys.minAmount),
                controller: minAmount,
                validation: AppValidators.isNumberValidator,
                inputType: TextInputType.number,
              ),
            ),
            16.horizontalSpace,
            Expanded(
              child: CustomTextFormField(
                hint: AppHelper.getTrn(TrKeys.tax),
                controller: tax,
                inputType: TextInputType.number,
                validation: AppValidators.isNumberValidator,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
