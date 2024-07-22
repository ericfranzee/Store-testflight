import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibeauty/application/booking/booking_bloc.dart';
import 'package:ibeauty/application/form_option/form_bloc.dart';
import 'package:ibeauty/domain/model/response/form_options_response.dart';
import 'package:ibeauty/domain/service/helper.dart';
import 'package:ibeauty/domain/service/tr_keys.dart';
import 'package:ibeauty/domain/service/validators.dart';
import 'package:ibeauty/presentation/components/button/custom_button.dart';
import 'package:ibeauty/presentation/components/button/pop_button.dart';
import 'package:ibeauty/presentation/components/custom_scaffold.dart';
import 'package:ibeauty/presentation/components/custom_textformfield.dart';
import 'package:ibeauty/presentation/components/loading.dart';
import 'package:ibeauty/presentation/style/style.dart';
import 'package:ibeauty/presentation/style/theme/theme.dart';

class FormOptionsPage extends StatefulWidget {
  const FormOptionsPage({super.key});

  @override
  State<FormOptionsPage> createState() => _FormOptionsPageState();
}

class _FormOptionsPageState extends State<FormOptionsPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FormBloc, FormOptionsState>(
      builder: (context, state) {
        return CustomScaffold(
          body: (colors) => SafeArea(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 16.r),
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 16.r),
                  child: Column(
                    children: [
                      Text(
                        AppHelper.getTrn(TrKeys.form),
                        style: CustomStyle.interSemi(
                            color: colors.textBlack, size: 22),
                      ),
                    ],
                  ),
                ),
                24.verticalSpace,
                Text(
                  state.formOptions?.translation?.title ?? "",
                  style: CustomStyle.interNoSemi(
                      color: colors.textBlack, size: 18),
                ),
                8.verticalSpace,
                Text(
                  state.formOptions?.translation?.description ?? "",
                  style: CustomStyle.interNormal(
                      color: colors.textBlack, size: 16),
                ),
                state.isLoading
                    ? const Loading()
                    : Form(
                        key: _formKey,
                        child: ListView.builder(
                            padding: EdgeInsets.only(top: 16.r, bottom: 100.r),
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: state.formOptions?.data?.length ?? 0,
                            itemBuilder: (context, index) {
                              final form = state.formOptions?.data?[index];
                              return _questions(
                                  colors, form, state, index, context);
                            }),
                      )
              ],
            ),
          ),
          floatingButtonLocation: FloatingActionButtonLocation.centerFloat,
          floatingButton: (colors) => Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.r),
            child: Row(
              children: [
                PopButton(colors: colors),
                16.horizontalSpace,
                Expanded(
                  child: SizedBox(
                    height: 60.r,
                    child: BlocBuilder<BookingBloc, BookingState>(
                      builder: (context, stateBooking) {
                        return CustomButton(
                          isLoading: stateBooking.isButtonLoading,
                          title: AppHelper.getTrn(TrKeys.save),
                          bgColor: colors.primary,
                          titleColor: colors.white,
                          onTap: () {
                            if (_formKey.currentState?.validate() ?? false) {
                              context
                                  .read<BookingBloc>()
                                  .add(BookingEvent.saveForm(
                                      context: context,
                                      form: state.formOptions,
                                      onSuccess: () {
                                        context.read<BookingBloc>().add(
                                            BookingEvent.fetchBookingById(
                                                context: context,
                                                id: stateBooking
                                                        .upcoming.first.id ??
                                                    0));
                                      }));
                              Navigator.pop(context);
                            }
                          },
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _questions(CustomColorSet colors, FormOption? form,
      FormOptionsState state, int index, BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.r),
      decoration: BoxDecoration(
          color: colors.socialButtonColor,
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(color: colors.icon)),
      padding: EdgeInsets.all(16.r),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            form?.question ?? "",
            style: CustomStyle.interNormal(color: colors.textBlack),
          ),
          16.verticalSpace,
          if (form?.answerType == TrKeys.shortAnswer)
            CustomTextFormField(
              initialText: form?.userAnswer?.join(),
              hint: AppHelper.getTrn(TrKeys.shortAnswer),
              validation: form?.required == null
                  ? null
                  : AppValidators.isNotEmptyValidator,
              onChanged: (s) {
                final newForm = form?.copyWith(userAnswer: [s]) ?? FormOption();
                List<FormOption> list =
                    List.from(state.formOptions?.data ?? []);
                list.removeAt(index);
                list.insert(index, newForm);

                final data = state.formOptions?.copyWith(data: list);
                context.read<FormBloc>().add(FormEvent.setFormOption(
                    context: context, formOptions: data));
              },
            ),
          if (form?.answerType == TrKeys.longAnswer)
            CustomTextFormField(
              initialText: form?.userAnswer?.join(),
              hint: AppHelper.getTrn(TrKeys.longAnswer),
              maxLines: 4,
              validation: form?.required == null
                  ? null
                  : AppValidators.isNotEmptyValidator,
              onChanged: (s) {
                final newForm = form?.copyWith(userAnswer: [s]) ?? FormOption();
                List<FormOption> list =
                    List.from(state.formOptions?.data ?? []);
                list.removeAt(index);
                list.insert(index, newForm);

                final data = state.formOptions?.copyWith(data: list);
                context.read<FormBloc>().add(FormEvent.setFormOption(
                    context: context, formOptions: data));
              },
            ),
          if (form?.answerType == TrKeys.singleAnswer)
            ListView.builder(
                padding: EdgeInsets.zero,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: form?.answer?.length ?? 0,
                itemBuilder: (context, answerIndex) {
                  return Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            final newForm = form?.copyWith(userAnswer: [
                                  form.answer?[answerIndex] ?? ""
                                ]) ??
                                FormOption();
                            List<FormOption> list =
                                List.from(state.formOptions?.data ?? []);
                            list.removeAt(index);
                            list.insert(index, newForm);

                            final data =
                                state.formOptions?.copyWith(data: list);
                            context.read<FormBloc>().add(
                                FormEvent.setFormOption(
                                    context: context, formOptions: data));
                          },
                          icon: Icon(
                            form?.userAnswer?.contains(
                                        form.answer?[answerIndex] ?? "") ??
                                    false
                                ? FlutterRemix.checkbox_blank_circle_fill
                                : FlutterRemix.checkbox_blank_circle_line,
                            color: colors.textBlack,
                          )),
                      8.horizontalSpace,
                      Text(
                        form?.answer?[answerIndex] ?? "",
                        style:
                            CustomStyle.interRegular(color: colors.textBlack),
                      )
                    ],
                  );
                }),
          if (form?.answerType == TrKeys.multipleChoice)
            ListView.builder(
                padding: EdgeInsets.zero,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: form?.answer?.length ?? 0,
                itemBuilder: (context, answerIndex) {
                  return Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            FormOption newForm = FormOption();
                            if (form?.userAnswer?.contains(
                                    form.answer?[answerIndex] ?? "") ??
                                false) {
                              form?.userAnswer
                                  ?.remove(form.answer?[answerIndex] ?? "");
                              newForm =
                                  form?.copyWith(userAnswer: form.userAnswer) ??
                                      FormOption();
                            } else {
                              newForm = form?.copyWith(
                                      userAnswer: form.userAnswer == null
                                          ? ([form.answer?[answerIndex] ?? ""])
                                          : (form.userAnswer
                                            ?..add(form.answer?[answerIndex] ??
                                                ""))) ??
                                  FormOption();
                            }

                            List<FormOption> list =
                                List.from(state.formOptions?.data ?? []);
                            list.removeAt(index);
                            list.insert(index, newForm);

                            final data =
                                state.formOptions?.copyWith(data: list);
                            context.read<FormBloc>().add(
                                FormEvent.setFormOption(
                                    context: context, formOptions: data));
                          },
                          icon: Icon(
                            form?.userAnswer?.contains(
                                        form.answer?[answerIndex] ?? "") ??
                                    false
                                ? FlutterRemix.checkbox_blank_circle_fill
                                : FlutterRemix.checkbox_blank_circle_line,
                            color: colors.textBlack,
                          )),
                      8.horizontalSpace,
                      Text(
                        form?.answer?[answerIndex] ?? "",
                        style:
                            CustomStyle.interRegular(color: colors.textBlack),
                      )
                    ],
                  );
                }),
          if (form?.answerType == TrKeys.dropDown)
            SizedBox(
              width: MediaQuery.sizeOf(context).width,
              height: 80.r,
              child: DropdownButtonFormField(
                value: (form?.userAnswer?.isEmpty ?? true)
                    ? null
                    : form?.userAnswer?.first,
                validator: form?.required == null
                    ? null
                    : AppValidators.isNotEmptyValidator,
                borderRadius: BorderRadius.circular(10.r),
                items: form?.answer
                    ?.map((e) => DropdownMenuItem(
                          value: e,
                          child: Text(e,
                              style: CustomStyle.interRegular(
                                  color: colors.textBlack)),
                        ))
                    .toList(),
                onChanged: (s) {
                  if (s != null) {
                    final newForm =
                        form?.copyWith(userAnswer: [s]) ?? FormOption();
                    List<FormOption> list =
                        List.from(state.formOptions?.data ?? []);
                    list.removeAt(index);
                    list.insert(index, newForm);

                    final data = state.formOptions?.copyWith(data: list);
                    context.read<FormBloc>().add(FormEvent.setFormOption(
                        context: context, formOptions: data));
                  }
                },
                decoration: CustomStyle.customDropDownDecoration(
                    hintText: AppHelper.getTrn(TrKeys.selectAnswer)),
              ),
            ),
          if (form?.answerType == TrKeys.yesOrNo)
            ListView.builder(
                padding: EdgeInsets.zero,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 2,
                itemBuilder: (context, answerIndex) {
                  return Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            List<FormOption> list =
                                List.from(state.formOptions?.data ?? []);
                            final newForm = form?.copyWith(userAnswer: [
                                  answerIndex == 0 ? TrKeys.yes : TrKeys.no
                                ]) ??
                                FormOption();
                            list.removeAt(index);
                            list.insert(index, newForm);

                            final data =
                                state.formOptions?.copyWith(data: list);
                            context.read<FormBloc>().add(
                                FormEvent.setFormOption(
                                    context: context, formOptions: data));
                          },
                          icon: Icon(
                            form?.userAnswer?.contains(answerIndex == 0
                                        ? TrKeys.yes
                                        : TrKeys.no) ??
                                    false
                                ? FlutterRemix.checkbox_blank_circle_fill
                                : FlutterRemix.checkbox_blank_circle_line,
                            color: colors.textBlack,
                          )),
                      8.horizontalSpace,
                      Text(
                        answerIndex == 0
                            ? AppHelper.getTrn(TrKeys.yes)
                            : AppHelper.getTrn(TrKeys.no),
                        style:
                            CustomStyle.interRegular(color: colors.textBlack),
                      )
                    ],
                  );
                }),
        ],
      ),
    );
  }
}
