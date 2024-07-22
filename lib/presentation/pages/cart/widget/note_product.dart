import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibeauty/application/cart/cart_bloc.dart';
import 'package:ibeauty/domain/model/response/cart_response.dart';
import 'package:ibeauty/domain/service/helper.dart';
import 'package:ibeauty/domain/service/tr_keys.dart';
import 'package:ibeauty/domain/service/validators.dart';
import 'package:ibeauty/infrastructure/local_storage/local_storage.dart';

import 'package:ibeauty/presentation/components/button/custom_button.dart';
import 'package:ibeauty/presentation/components/custom_network_image.dart';
import 'package:ibeauty/presentation/components/custom_textformfield.dart';
import 'package:ibeauty/presentation/components/keyboard_dismisser.dart';
import 'package:ibeauty/presentation/style/style.dart';
import 'package:ibeauty/presentation/style/theme/theme.dart';
import 'package:ibeauty/presentation/style/theme/theme_warpper.dart';

class NoteProduct extends StatefulWidget {
  final CartDetailProduct? cartItem;
  final String? note;

  const NoteProduct({super.key, required this.cartItem, required this.note});

  @override
  State<NoteProduct> createState() => _NoteProductState();
}

class _NoteProductState extends State<NoteProduct> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController controller;

  @override
  void initState() {
    controller = TextEditingController(text: widget.note);
    super.initState();
  }

  @override
  void deactivate() {
    controller.dispose();
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(builder: (colors, c) {
      return KeyboardDismisser(
        isLtr: LocalStorage.getLangLtr(),
        child: Container(
          margin: MediaQuery.of(context).viewInsets,
          padding: EdgeInsets.symmetric(horizontal: 16.r, vertical: 16.r),
          width: double.infinity,
          decoration: BoxDecoration(
            color: colors.backgroundColor,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(24.r),
              topLeft: Radius.circular(24.r),
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppHelper.getTrn(TrKeys.commentForProduct),
                  style:
                      CustomStyle.interSemi(color: colors.textBlack, size: 22),
                ),
                30.verticalSpace,
                _productInfo(colors),
                24.verticalSpace,
                Form(
                  key: _formKey,
                  child: CustomTextFormField(
                    hint: AppHelper.getTrn(TrKeys.commentForProduct),
                    controller: controller,
                    validation: AppValidators.isNotEmptyValidator,
                  ),
                ),
                24.verticalSpace,
                CustomButton(
                    title: AppHelper.getTrn(TrKeys.save),
                    bgColor: colors.primary,
                    titleColor: colors.white,
                    onTap: () {
                      if (_formKey.currentState?.validate() ?? false) {
                        context.read<CartBloc>().add(CartEvent.setNotes(
                            stockId: widget.cartItem?.stocks?.id ?? 0,
                            note: controller.text));
                        Navigator.pop(context);
                      }
                    }),
                24.verticalSpace,
              ],
            ),
          ),
        ),
      );
    });
  }

  Widget _productInfo(CustomColorSet colors) {
    return Row(
      children: [
        CustomNetworkImage(
            url: widget.cartItem?.stocks?.product?.img ?? "",
            height: 56,
            width: 56,
            radius: 4),
        16.horizontalSpace,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.cartItem?.stocks?.product?.translation?.title ?? "",
              style: CustomStyle.interNormal(color: colors.textBlack, size: 14),
            ),
            4.verticalSpace,
            Text(
              AppHelper.numberFormat(
                  number: widget.cartItem?.price ?? 0),
              style: CustomStyle.interBold(color: colors.textBlack, size: 16),
            ),
          ],
        )
      ],
    );
  }
}
