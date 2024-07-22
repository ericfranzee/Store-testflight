import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibeauty/domain/service/helper.dart';
import 'package:ibeauty/domain/service/tr_keys.dart';
import 'package:ibeauty/presentation/components/button/custom_button.dart';
import 'package:ibeauty/presentation/components/button/pop_button.dart';
import 'package:ibeauty/presentation/components/custom_scaffold.dart';
import 'package:ibeauty/presentation/style/style.dart';

class SelectTimePage extends StatefulWidget {
  const SelectTimePage({super.key});

  @override
  State<SelectTimePage> createState() => _SelectTimePageState();
}

class _SelectTimePageState extends State<SelectTimePage> {
  String start = "";
  String? end;

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: (colors) => SafeArea(
        bottom: false,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.r),
          child: Column(
            children: [
              Text(
                AppHelper.getTrn(TrKeys.time),
                style:
                    CustomStyle.interNoSemi(color: colors.textBlack, size: 22),
              ),
              24.verticalSpace,
              Row(
                children: [
                  Expanded(
                    child: DropdownButtonFormField(
                      borderRadius: BorderRadius.circular(10.r),
                      items: List.generate(
                          24,
                          (index) => DropdownMenuItem(
                                value: "$index:00",
                                child: Text("$index:00"),
                              )),
                      onChanged: (s) {
                        if (s != null) {
                          start = s;
                          end =
                              "${(int.tryParse(start.substring(0, start.indexOf(":"))) ?? 1) + 1}:00";
                          setState(() {});
                        }
                      },
                      decoration: CustomStyle.customDropDownDecoration(
                          hintText: AppHelper.getTrn(TrKeys.form)),
                    ),
                  ),
                  10.horizontalSpace,
                  Expanded(
                    child: DropdownButtonFormField(
                      items: List.generate(
                          start.isEmpty
                              ? 24
                              : 24 -
                                  (int.tryParse(start.substring(
                                          0, start.indexOf(":"))) ??
                                      1) -
                                  1,
                          (index) => DropdownMenuItem(
                                value:
                                    "${start.isEmpty ? index : index + 1 + (int.tryParse(start.substring(0, start.indexOf(":"))) ?? 0)}:00",
                                child: Text(
                                    "${start.isEmpty ? index : index + 1 + (int.tryParse(start.substring(0, start.indexOf(":"))) ?? 0)}:00"),
                              )),
                      onChanged: (s) {
                        if (s != null) {
                          end = s;
                        }
                      },
                      borderRadius: BorderRadius.circular(10.r),
                      decoration: CustomStyle.customDropDownDecoration(
                          hintText: AppHelper.getTrn(TrKeys.to)),
                      value: end,
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
          padding: EdgeInsets.symmetric(horizontal: 16.r),
          child: Row(
            children: [
              PopButton(colors: colors),
              10.horizontalSpace,
              Expanded(
                child: SizedBox(
                  height: 54.r,
                  child: CustomButton(
                      title: AppHelper.getTrn(TrKeys.apply),
                      bgColor: colors.primary,
                      titleColor: colors.white,
                      onTap: () {
                        Navigator.pop(context, [start, end]);
                      }),
                ),
              )
            ],
          )),
    );
  }
}
