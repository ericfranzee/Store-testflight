import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:ibeauty/app_constants.dart';
import 'package:ibeauty/application/notification/notification_bloc.dart';
import 'package:ibeauty/domain/model/model/blog_model.dart';
import 'package:ibeauty/domain/model/model/order_model.dart';
import 'package:ibeauty/domain/model/model/parcel_order_model.dart';
import 'package:ibeauty/domain/model/model/shop_model.dart';
import 'package:ibeauty/domain/model/response/notification_response.dart';
import 'package:ibeauty/domain/service/time_service.dart';
import 'package:ibeauty/presentation/components/button/animation_button_effect.dart';
import 'package:ibeauty/presentation/route/app_route.dart';
import 'package:ibeauty/presentation/route/app_route_parcel.dart';
import 'package:ibeauty/presentation/route/app_route_service.dart';
import 'package:ibeauty/presentation/route/app_route_setting.dart';
import 'package:ibeauty/presentation/style/style.dart';
import 'package:ibeauty/presentation/style/theme/theme.dart';

class NotificationItem extends StatelessWidget {
  final CustomColorSet colors;
  final NotificationModel notification;

  const NotificationItem(
      {Key? key, required this.colors, required this.notification})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Slidable(
      startActionPane: ActionPane(
        extentRatio: 0.12,
        motion: const ScrollMotion(),
        children: [
          Expanded(
            child: Builder(
              builder: (context) {
                return GestureDetector(
                  onTap: () {
                    Slidable.of(context)?.close();
                    context.read<NotificationBloc>().add(
                        NotificationEvent.readOne(
                            context: context, id: notification.id));
                  },
                  child: Container(
                    width: 50.r,
                    height: 72.r,
                    decoration: BoxDecoration(
                      color: colors.textBlack,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(16.r),
                        bottomRight: Radius.circular(16.r),
                      ),
                    ),
                    alignment: Alignment.center,
                    child: Icon(
                      FlutterRemix.mail_open_fill,
                      color: colors.textWhite,
                      size: 24.r,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      endActionPane: ActionPane(
        extentRatio: 0.12,
        motion: const ScrollMotion(),
        children: [
          Expanded(
            child: Builder(
              builder: (context) {
                return GestureDetector(
                  onTap: () {
                    context.read<NotificationBloc>().add(
                        NotificationEvent.removeItem(
                            context: context, id: notification.id));
                    Slidable.of(context)?.close();
                  },
                  child: Container(
                    width: 50.r,
                    height: 72.r,
                    decoration: BoxDecoration(
                      color: CustomStyle.red,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16.r),
                        bottomLeft: Radius.circular(16.r),
                      ),
                    ),
                    alignment: Alignment.center,
                    child: Icon(
                      FlutterRemix.delete_bin_line,
                      color: CustomStyle.white,
                      size: 24.r,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      child: ButtonEffectAnimation(
        onTap: () {
          if (notification.data?.type?.toLowerCase() == AppConstants.newOrder ||
              notification.data?.type?.toLowerCase() ==
                  AppConstants.statusChanged) {
            context.read<NotificationBloc>().add(NotificationEvent.readOne(
                context: context, id: notification.id));
            AppRoute.goOrderPage(
                context,
                OrderShops(
                    id: notification.type == "order"
                        ? notification.orderData?.parentId ??
                        notification.orderData?.id
                        : notification.modelId));
            return;
          }
          if (notification.data?.type?.toLowerCase() ==
              AppConstants.newParcelOrder) {
            context.read<NotificationBloc>().add(NotificationEvent.readOne(
                context: context, id: notification.id));
            AppRouteParcel.goParcelOrderPage(
                context, ParcelOrder(id: notification.modelId), colors);
            return;
          }
          if (notification.data?.type?.toLowerCase() ==
              AppConstants.newsPublish) {
            context.read<NotificationBloc>().add(NotificationEvent.readOne(
                context: context, id: notification.id));
            AppRoute.goBlogBottomSheet(
                context, BlogData(id: notification.modelId));
            return;
          }
          if (notification.data?.type?.toLowerCase() ==
              AppConstants.bookingStatusChanged) {
            context.read<NotificationBloc>().add(NotificationEvent.readOne(
                context: context, id: notification.id));
            AppRouteService.goBookingPage(context: context, shop: ShopData(id: notification.shopId ?? 0), id: notification.modelId ?? 0);
            return;
          }
          context.read<NotificationBloc>().add(
              NotificationEvent.readOne(context: context, id: notification.id));
          AppRouteSetting.goNotificationBottomSheet(context, notification, colors);
        },
        child: Container(
          margin: EdgeInsets.only(bottom: 8.r, left: 16.r, right: 16.r),
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 20.r, horizontal: 22.r),
          decoration: BoxDecoration(
            color: colors.newBoxColor,
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    TimeService.dateFormatForNotification(notification.createdAt),
                    style: CustomStyle.interNormal(
                        color: colors.textHint, size: 12),
                  ),
                  if (notification.readAt == null)
                    Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: colors.primary),
                      width: 10.r,
                      height: 10.r,
                    )
                ],
              ),
              10.verticalSpace,
              Text(
                notification.body ?? "",
                style:
                CustomStyle.interNormal(color: colors.textBlack, size: 16),
                maxLines: 2,
              )
            ],
          ),
        ),
      ),
    );
  }
}
