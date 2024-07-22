import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibeauty/domain/model/model/order_model.dart';
import 'package:ibeauty/domain/model/response/refund_pagination_response.dart';
import 'package:ibeauty/domain/service/helper.dart';
import 'package:ibeauty/domain/service/time_service.dart';
import 'package:ibeauty/presentation/components/button/animation_button_effect.dart';
import 'package:ibeauty/presentation/route/app_route.dart';
import 'package:ibeauty/presentation/style/style.dart';
import 'package:ibeauty/presentation/style/theme/theme.dart';

class OrderItem extends StatelessWidget {
  final CustomColorSet colors;
  final OrderShops? order;

  final RefundModel? refundModel;
  final int index;
  final bool active;

  const OrderItem({
    super.key,
    required this.colors,
    this.order,
    required this.index,
    this.active = true,
    this.refundModel,
  });

  @override
  Widget build(BuildContext context) {
    return ButtonEffectAnimation(
      onTap: () {
        if (refundModel != null) {
          AppRoute.goRefundOrderPage(context, colors, refundModel);
          return;
        }
        AppRoute.goOrderPage(context, order ?? OrderShops());
      },
      child: SizedBox(
        height: 82.r,
        child: Row(
          children: [
            if (active)
              Container(
                height: 60.r,
                width: 14.r,
                decoration: BoxDecoration(
                  color: colors.primary,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(16.r),
                      bottomRight: Radius.circular(16.r)),
                ),
              ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  index == 0
                      ? Padding(
                          padding: EdgeInsets.only(right: 16.r),
                          child: const Divider(),
                        )
                      : SizedBox(
                          height: 2.r,
                        ),
                  const Spacer(),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 16.r),
                            child: Text(
                              refundModel == null
                                  ? "#${order?.id ?? 0}"
                                  : "#${refundModel?.order?.id ?? 0}",
                              style: CustomStyle.interBold(
                                  color: colors.textBlack, size: 16),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 16.r, top: 8.r),
                            child: Row(
                              children: [
                                Text(
                                  AppHelper.numberFormat(
                                      number: refundModel == null
                                          ? order?.totalPriceByParent ??
                                              order?.totalPrice
                                          : refundModel?.order?.totalPrice),
                                  style: CustomStyle.interBold(
                                      color: colors.textBlack, size: 16),
                                ),
                                12.horizontalSpace,
                                Container(
                                  width: 4.r,
                                  height: 4.r,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: colors.textHint,
                                  ),
                                ),
                                12.horizontalSpace,
                                Text(
                                  TimeService.dateFormatMDYHm(refundModel == null
                                      ? order?.deliveryDate
                                      : refundModel?.createdAt),
                                  style: CustomStyle.interNormal(
                                      color: colors.textBlack, size: 14),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Padding(
                        padding: EdgeInsets.only(right: 16.r),
                        child: Icon(
                          FlutterRemix.arrow_right_s_line,
                          color: colors.textBlack,
                        ),
                      )
                    ],
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
