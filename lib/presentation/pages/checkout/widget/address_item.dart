import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibeauty/domain/model/response/user_address_response.dart';
import 'package:ibeauty/presentation/style/style.dart';
import 'package:ibeauty/presentation/style/theme/theme.dart';

class AddressItem extends StatelessWidget {
  final CustomColorSet colors;
  final UserAddress address;
  final bool active;
  final VoidCallback onTap;
  final VoidCallback delete;
  final VoidCallback edit;

  const AddressItem(
      {super.key,
      required this.colors,
      required this.address,
      required this.active,
      required this.onTap,
      required this.delete,
      required this.edit});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: 8.r),
        padding: EdgeInsets.symmetric(vertical: 16.r, horizontal: 10.r),
        decoration: BoxDecoration(
            color: colors.newBoxColor,
            border:
                Border.all(color: active ? colors.primary : colors.transparent),
            borderRadius: BorderRadius.circular(16.r)),
        child: Row(
          children: [
            10.horizontalSpace,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.sizeOf(context).width - 160.r,
                  child: RichText(
                      text: TextSpan(
                          text:
                              "${address.firstname ?? ""} ${address.lastname ?? ""}",
                          style: CustomStyle.interSemi(
                              color: colors.textBlack, size: 14),
                          children: [
                        if (address.cityModel?.translation?.title?.isNotEmpty ??
                            false)
                          TextSpan(
                            text:
                                "(${address.cityModel?.translation?.title ?? ""})",
                            style: CustomStyle.interSemi(
                                color: colors.textBlack, size: 14),
                          )
                      ])),
                ),
                SizedBox(
                  width: MediaQuery.sizeOf(context).width - 160.r,
                  child: RichText(
                      text: TextSpan(
                          text: address.streetHouseNumber ?? "",
                          style: CustomStyle.interRegular(
                              color: colors.textBlack, size: 12),
                          children: [
                        if (address.additionalDetails?.isNotEmpty ?? false)
                          TextSpan(
                            text: ", ${address.additionalDetails ?? ""}",
                            style: CustomStyle.interRegular(
                                color: colors.textBlack, size: 12),
                          ),
                        if (address.zipcode?.isNotEmpty ?? false)
                          TextSpan(
                            text: ", ${address.zipcode ?? ""}",
                            style: CustomStyle.interRegular(
                                color: colors.textBlack, size: 12),
                          ),
                      ])),
                ),
              ],
            ),
            const Spacer(),
            IconButton(
              onPressed: delete,
              icon: Icon(
                FlutterRemix.delete_bin_line,
                color: colors.textBlack,
              ),
            ),
            const Spacer(),
            IconButton(
                onPressed: edit,
                icon: Icon(
                  FlutterRemix.pencil_line,
                  color: colors.textBlack,
                )),
          ],
        ),
      ),
    );
  }
}
