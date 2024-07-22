import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibeauty/app_constants.dart';
import 'package:ibeauty/domain/model/model/order_model.dart';
import 'package:ibeauty/domain/model/model/stepper_steps.dart';
import 'package:ibeauty/domain/service/helper.dart';
import 'package:ibeauty/domain/service/time_service.dart';
import 'package:ibeauty/domain/service/tr_keys.dart';
import 'package:ibeauty/infrastructure/local_storage/local_storage.dart';
import 'package:ibeauty/presentation/components/casa_vertical_stepper_view.dart';
import 'package:ibeauty/presentation/style/style.dart';
import 'package:ibeauty/presentation/style/theme/theme.dart';

class OrderStatus extends StatelessWidget {
  final CustomColorSet colors;
  final String? status;
  final DateTime? createAt;
  final List<Notes>? notes;

  const OrderStatus(
      {super.key,
      required this.colors,
      required this.status,
      required this.createAt,
      required this.notes});

  @override
  Widget build(BuildContext context) {
    List statusList = [];
    if (status != TrKeys.canceled) {
      statusList = AppConstants.listOrderStatus.toList();
      statusList.removeAt(0);
    } else {
      statusList = AppConstants.listOrderStatus;
    }

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.r, vertical: 22.r),
      decoration: BoxDecoration(
          color: colors.backgroundColor,
          borderRadius: BorderRadius.circular(16.r)),
      child: CasaVerticalStepperView(
        backgroundColor: colors.transparent,
        completeColor: CustomStyle.greenColor,
        upComingColor: colors.icon,
        inProgressColor: colors.error,
        steps: statusList.map((e) {
          List<NoteNote>? list = notes?.firstWhere((element) {
            return element.status == e;
          }, orElse: () => Notes()).notes;
          return StepperStep(
            title: Text(
              AppHelper.getTrn(e),
              style: CustomStyle.interNormal(color: colors.textBlack, size: 16),
            ),
            leading: Icon(
              AppConstants.listOrderStatus.indexOf(e) == 0
                  ? FlutterRemix.spam_2_line
                  : AppConstants.listOrderStatus.indexOf(e) == 1
                      ? FlutterRemix.survey_line
                      : AppConstants.listOrderStatus.indexOf(e) == 2
                          ? FlutterRemix.pause_circle_line
                          : AppConstants.listOrderStatus.indexOf(e) == 3
                              ? FlutterRemix.truck_line
                              : AppConstants.listOrderStatus.indexOf(e) == 4
                                  ? FlutterRemix.archive_line
                                  : AppConstants.listOrderStatus.indexOf(e) == 5
                                      ? FlutterRemix.check_double_line
                                      : FlutterRemix.inbox_unarchive_line,
              color: AppHelper.getOrderStatusForNumber(status) == 0
                  ? colors.error
                  : AppHelper.getOrderStatusForNumber(status) <=
                          AppConstants.listOrderStatus.indexOf(e)
                      ? CustomStyle.greenColor
                      : colors.icon,
            ),
            trailing: Text(
              notes?.firstWhere((element) {
                        return element.status == e;
                      }, orElse: () => Notes()).updatedAt !=
                      null
                  ? TimeService.dateFormatDMY(notes?.firstWhere((element) {
                      return element.status == e;
                    }, orElse: () => Notes()).updatedAt)
                  : e == TrKeys.newKey
                      ? TimeService.dateFormatDMY(createAt)
                      : "",
              style: CustomStyle.interRegular(color: colors.textHint, size: 14),
            ),
            isExpanded: e == status,
            isExpandedShow: list?.isNotEmpty ?? false,
            status: AppHelper.getOrderStatusForNumber(status) == 0
                ? StepStatus.inprogress
                : AppHelper.getOrderStatusForNumber(status) <=
                        AppConstants.listOrderStatus.indexOf(e)
                    ? StepStatus.complete
                    : StepStatus.upcoming,
            view: Column(
              children: [
                (list?.isEmpty ?? true)
                    ? const SizedBox(width: double.infinity)
                    : ListView.builder(
                        itemCount: list?.length ?? 0,
                        shrinkWrap: true,
                        padding: EdgeInsets.only(bottom: 8.r),
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 4.r),
                                width: 6.r,
                                height: 6.r,
                                decoration: const BoxDecoration(
                                    color: CustomStyle.greenColor,
                                    shape: BoxShape.circle),
                              ),
                              8.horizontalSpace,
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    list?[index].title?[
                                            LocalStorage.getLanguage()
                                                ?.locale] ??
                                        "",
                                    style: CustomStyle.interRegular(
                                        color: colors.textBlack, size: 14),
                                  ),
                                  Text(
                                    TimeService.dateFormatMDYHm(
                                        list?[index].createdAt),
                                    style: CustomStyle.interRegular(
                                        color: colors.textHint, size: 14),
                                  ),
                                  8.verticalSpace,
                                ],
                              ),
                            ],
                          );
                        })
              ],
            ),
          );
        }).toList(),
        isExpandable: true,
      ),
    );
  }
}
