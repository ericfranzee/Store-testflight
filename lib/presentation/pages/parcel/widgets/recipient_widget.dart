import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibeauty/application/map/map_bloc.dart';
import 'package:ibeauty/application/parcel/parcel_bloc.dart';
import 'package:ibeauty/domain/model/model/location_model.dart';
import 'package:ibeauty/domain/service/helper.dart';
import 'package:ibeauty/domain/service/tr_keys.dart';
import 'package:ibeauty/infrastructure/local_storage/local_storage.dart';
import 'package:ibeauty/presentation/components/button/animation_button_effect.dart';
import 'package:ibeauty/presentation/components/custom_textformfield.dart';
import 'package:ibeauty/presentation/pages/map/map_page.dart';
import 'package:ibeauty/presentation/style/style.dart';
import 'package:ibeauty/presentation/style/theme/theme.dart';
import 'package:phone_text_field/phone_text_field.dart';
import 'custom_expanded.dart';

class RecipientWidget extends StatelessWidget {
  final ParcelState state;
  final TextEditingController username;
  final TextEditingController phone;
  final TextEditingController house;
  final TextEditingController flour;
  final TextEditingController description;
  final TextEditingController addInstruction;
  final TextEditingController value;
  final CustomColorSet colors;

  const RecipientWidget(
      {super.key,
      required this.state,
      required this.username,
      required this.phone,
      required this.house,
      required this.flour,
      required this.description,
      required this.addInstruction,
      required this.value,
      required this.colors});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (state.expand)
          Padding(
            padding: EdgeInsets.only(bottom: 16.r),
            child: Text(AppHelper.getTrn(TrKeys.recipient),
                style:
                    CustomStyle.interNoSemi(size: 16, color: colors.textBlack)),
          ),
        InkWell(
          onTap: () async {
            final data = await await Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => MultiBlocProvider(providers: [
                  BlocProvider(create: (context) => MapBloc()),
                ], child: const MapPage()),
              ),
            );
            if (data.runtimeType == LocationModel) {
              if (context.mounted) {
                context.read<ParcelBloc>().add(ParcelEvent.setToAddress(
                    title: (data as LocationModel).address,
                    location: data,
                    context: context));
              }
            }
          },
          child: ButtonEffectAnimation(
            child: Container(
              decoration: BoxDecoration(
                  color: colors.newBoxColor,
                  borderRadius: BorderRadius.circular(10.r)),
              padding: EdgeInsets.symmetric(horizontal: 20.r, vertical: 16.r),
              child: Row(
                children: [
                  Icon(FlutterRemix.map_pin_range_line,color: colors.textBlack,),
                  12.horizontalSpace,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (state.addressTo != null)
                        Text(
                          AppHelper.getTrn(TrKeys.deliveryTo),
                          style: CustomStyle.interRegular(
                              size: 12, color: colors.textBlack),
                        ),
                      SizedBox(
                        width: MediaQuery.sizeOf(context).width / 2 - 20.r,
                        child: Text(
                          state.addressTo ??
                              AppHelper.getTrn(TrKeys.deliveryTo),
                          style: CustomStyle.interSemi(
                              size: 16, color: colors.textBlack),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Icon(
                    FlutterRemix.arrow_right_s_line,
                    color: colors.textBlack,
                  )
                ],
              ),
            ),
          ),
        ),
        ExpandedSection(
          expand: state.expand,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              24.verticalSpace,
              _phoneTextFormField(colors),
              16.verticalSpace,
              CustomTextFormField(
                hint: AppHelper.getTrn(TrKeys.fullName),
                controller: username,
                validation: (s) {
                  if (s?.isNotEmpty ?? false) {
                    return null;
                  }
                  return AppHelper.getTrn(TrKeys.canNotBeEmpty);
                },
              ),
              16.verticalSpace,
              CustomTextFormField(
                hint: AppHelper.getTrn(TrKeys.house),
                controller: house,
              ),
              16.verticalSpace,
              CustomTextFormField(
                hint: AppHelper.getTrn(TrKeys.floor),
                controller: flour,
              ),
              16.verticalSpace,
              CustomTextFormField(
                hint: AppHelper.getTrn(TrKeys.addInstruction),
                controller: addInstruction,
              ),
              24.verticalSpace,
              Text(AppHelper.getTrn(TrKeys.itemDescription),
                  style: CustomStyle.interNoSemi(
                      size: 16, color: colors.textBlack)),
              16.verticalSpace,
              TextFormField(
                style: CustomStyle.interNormal(color: colors.textBlack),
                controller: description,
                decoration: InputDecoration(
                  fillColor: colors.newBoxColor,
                  filled: true,
                  hintText: AppHelper.getTrn(TrKeys.whatAreYouSending),
                  hintStyle: CustomStyle.interNormal(color: colors.icon),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                      borderSide: BorderSide.merge(
                           BorderSide(color: colors.transparent),
                           BorderSide(color: colors.transparent))),
                  errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                      borderSide: BorderSide.merge(
                           BorderSide(color: colors.transparent),
                           BorderSide(color: colors.transparent))),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                      borderSide: BorderSide.merge(
                           BorderSide(color: colors.transparent),
                           BorderSide(color: colors.transparent))),
                  focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                      borderSide: BorderSide.merge(
                           BorderSide(color: colors.transparent),
                           BorderSide(color: colors.transparent))),
                  disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                      borderSide: BorderSide.merge(
                           BorderSide(color: colors.transparent),
                           BorderSide(color: colors.transparent))),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                      borderSide: BorderSide.merge(
                           BorderSide(color: colors.transparent),
                           BorderSide(color: colors.transparent))),
                ),
              ),
              16.verticalSpace,
              if (state.types.isNotEmpty)
                if ((state.types[state.selectType]?.options?.isNotEmpty ??
                    false))
                  SizedBox(
                    height: 36.r,
                    child: ListView.builder(
                        padding: EdgeInsets.zero,
                        scrollDirection: Axis.horizontal,
                        itemCount:
                            state.types[state.selectType]?.options?.length ?? 0,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              if (description.text.contains((state
                                      .types[state.selectType]
                                      ?.options?[index]
                                      .translation
                                      ?.title ??
                                  ""))) {
                                return;
                              }
                              if (description.text.isNotEmpty) {
                                description.text = "${description.text}, ";
                              }
                              description.text = description.text +
                                  (state
                                          .types[state.selectType]
                                          ?.options?[index]
                                          .translation
                                          ?.title ??
                                      "");
                            },
                            child: ButtonEffectAnimation(
                              child: Container(
                                margin: EdgeInsets.only(right: 8.r),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 18.r, vertical: 10.r),
                                decoration: BoxDecoration(
                                  color: colors.textHint,
                                  borderRadius: BorderRadius.circular(10.r),
                                ),
                                child: Text(
                                  state.types[state.selectType]?.options?[index]
                                          .translation?.title ??
                                      "",
                                  style: CustomStyle.interNormal(size: 14, color: colors.textBlack),
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
              16.verticalSpace,
              TextFormField(
                controller: value,
                style: CustomStyle.interNormal(color: colors.textBlack),
                decoration: InputDecoration(
                  fillColor: colors.newBoxColor,
                  filled: true,
                  hintText: AppHelper.getTrn(TrKeys.itemValue),
                  hintStyle: CustomStyle.interNormal(color: colors.icon),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                      borderSide: BorderSide.merge(
                           BorderSide(color: colors.transparent),
                           BorderSide(color: colors.transparent))),
                  errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                      borderSide: BorderSide.merge(
                           BorderSide(color: colors.transparent),
                           BorderSide(color: colors.transparent))),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                      borderSide: BorderSide.merge(
                           BorderSide(color: colors.transparent),
                           BorderSide(color: colors.transparent))),
                  focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                      borderSide: BorderSide.merge(
                           BorderSide(color: colors.transparent),
                           BorderSide(color: colors.transparent))),
                  disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                      borderSide: BorderSide.merge(
                           BorderSide(color: colors.transparent),
                           BorderSide(color: colors.transparent))),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                      borderSide: BorderSide.merge(
                           BorderSide(color: colors.transparent),
                           BorderSide(color: colors.transparent))),
                ),
              ),
              16.verticalSpace,
            ],
          ),
        )
      ],
    );
  }

  PhoneTextField _phoneTextFormField(CustomColorSet colors) {
    return PhoneTextField(
      initialValue: phone.text,
      initialCountryCode: LocalStorage.getAddress()?.countryCode?.toUpperCase(),
      textStyle: CustomStyle.interNormal(color: colors.textBlack),
      decoration: InputDecoration(
        hintText: AppHelper.getTrn(TrKeys.phoneNumber),
        hintStyle: CustomStyle.interNormal(
          size: 14.sp,
          color: CustomStyle.textHint,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        fillColor: CustomStyle.black,
        filled: false,
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.merge(
                const BorderSide(color: CustomStyle.icon),
                const BorderSide(color: CustomStyle.icon)),
            borderRadius: BorderRadius.circular(16.r)),
        errorBorder: OutlineInputBorder(
            borderSide: BorderSide.merge(
                const BorderSide(color: CustomStyle.icon),
                const BorderSide(color: CustomStyle.icon)),
            borderRadius: BorderRadius.circular(16.r)),
        border: OutlineInputBorder(
            borderSide: BorderSide.merge(
                const BorderSide(color: CustomStyle.icon),
                const BorderSide(color: CustomStyle.icon)),
            borderRadius: BorderRadius.circular(16.r)),
        focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide.merge(
                const BorderSide(color: CustomStyle.icon),
                const BorderSide(color: CustomStyle.icon)),
            borderRadius: BorderRadius.circular(16.r)),
        disabledBorder: OutlineInputBorder(
            borderSide: BorderSide.merge(
                const BorderSide(color: CustomStyle.icon),
                const BorderSide(color: CustomStyle.icon)),
            borderRadius: BorderRadius.circular(16.r)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide.merge(
                const BorderSide(color: CustomStyle.icon),
                const BorderSide(color: CustomStyle.icon)),
            borderRadius: BorderRadius.circular(16.r)),
      ),
      onChanged: (s) {
        phone.text = s.completeNumber;
      },
    );
  }
}
