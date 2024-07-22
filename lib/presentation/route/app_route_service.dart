import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ibeauty/application/booking/booking_bloc.dart';
import 'package:ibeauty/application/cart/cart_bloc.dart';
import 'package:ibeauty/application/form_option/form_bloc.dart';
import 'package:ibeauty/application/gift_cart/gift_cart_bloc.dart';
import 'package:ibeauty/application/main/main_bloc.dart';
import 'package:ibeauty/application/master/master_bloc.dart';
import 'package:ibeauty/application/membership/membership_bloc.dart';
import 'package:ibeauty/application/review/review_bloc.dart';
import 'package:ibeauty/application/service/service_bloc.dart';
import 'package:ibeauty/application/shop/shop_bloc.dart';
import 'package:ibeauty/domain/di/dependency_manager.dart';
import 'package:ibeauty/domain/model/model/master_model.dart';
import 'package:ibeauty/domain/model/model/service_model.dart';
import 'package:ibeauty/domain/model/model/shop_model.dart';
import 'package:ibeauty/domain/model/response/booking_response.dart';
import 'package:ibeauty/domain/model/response/form_options_response.dart';
import 'package:ibeauty/domain/service/helper.dart';
import 'package:ibeauty/presentation/pages/booking/add_note_page.dart';
import 'package:ibeauty/presentation/pages/booking/booking_payment_page.dart';
import 'package:ibeauty/presentation/pages/booking/booking_screen.dart';
import 'package:ibeauty/presentation/pages/booking/confirm_page.dart';
import 'package:ibeauty/presentation/pages/booking/form_page.dart';
import 'package:ibeauty/presentation/pages/booking/select_book_time.dart';
import 'package:ibeauty/presentation/pages/booking/select_master.dart';
import 'package:ibeauty/presentation/pages/booking/widget/add_review_booking.dart';
import 'package:ibeauty/presentation/pages/booking/widget/select_gift_screen.dart';
import 'package:ibeauty/presentation/pages/booking/widget/select_master_bottom.dart';
import 'package:ibeauty/presentation/pages/master_page/master_page.dart';
import 'package:ibeauty/presentation/pages/booking/widget/select_membership_screen.dart';
import 'package:ibeauty/presentation/pages/service/service_list_page.dart';

import '../pages/service/service_bottom_sheet.dart';
import '../style/theme/theme.dart';

abstract class AppRouteService {
  AppRouteService._();

  static goMasterPage(
      {required BuildContext context, required MasterModel master}) {
    return Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => MultiBlocProvider(
          providers: [
            BlocProvider.value(value: context.read<MainBloc>()),
            BlocProvider.value(value: context.read<CartBloc>()),
            BlocProvider(
              create: (context) => MasterBloc(masterRepository)
                ..add(MasterEvent.fetchMasterById(
                    context: context, master: master))
                ..add(MasterEvent.fetchMasterImage(
                    context: context, id: master.id ?? 0)),
            ),
            BlocProvider(
              create: (context) =>
                  ReviewBloc(reviewRepository, galleryRepository)
                    ..add(ReviewEvent.fetchReviewList(
                        context: context, masterId: master.id)),
            ),
          ],
          child: const MasterPage(),
        ),
      ),
    );
  }

  static goServiceListPage(
      {required BuildContext context,
      MasterModel? master,
      int? shopId,
      int? categoryId}) {
    return Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => BlocProvider(
          create: (context) => ServiceBloc(serviceRepository)
            ..add(ServiceEvent.fetchCategoryServices(
                context: context,
                isRefresh: true,
                shopId: shopId,
                categoryId: categoryId,
                masterId: master?.id)),
          child: ServiceListPage(shopId: shopId, master: master),
        ),
      ),
    );
  }

  static goServiceBottomSheet(
      {required BuildContext context,
      required ServiceModel service,
      required bool bookButton,
      required int? shopId,
      required CustomColorSet colors}) {
    return AppHelper.showCustomModalBottomSheetDrag(
      initialChildSize: 0.5,
      context: context,
      modal: (c) => BlocProvider.value(
          value: context.read<ServiceBloc>(),
          child: ServiceBottomSheet(
            colors: colors,
            controller: c,
            service: service,
            bookButton: bookButton,
            shopId: shopId,
          )),
    );
  }

  static goSelectMasterBottomSheet(
      {required BuildContext context,
      int? serviceId,
      List<int>? serviceIds,
      required String? title,
      required int? shopId,
      required CustomColorSet colors}) {
    return AppHelper.showCustomModalBottomSheetDrag(
      initialChildSize: 0.7,
      context: context,
      modal: (c) => MultiBlocProvider(
          providers: [
            BlocProvider.value(
              value: context.read<MasterBloc>()
                ..add(MasterEvent.fetchMasters(
                    context: context,
                    shopId: shopId,
                    serviceIds: serviceIds,
                    serviceId: serviceId,
                    isRefresh: true)),
            ),
            BlocProvider.value(value: context.read<BookingBloc>()),
          ],
          child: SelectMasterBottomSheet(
            colors: colors,
            controller: c,
            title: title,
            shopId: shopId,
            serviceId: serviceId,
          )),
    );
  }

  static goSelectOptionsMaster(
      {required BuildContext context,
      List<ServiceModel>? serviceIds,
      required String? title,
      required int? shopId,
      required CustomColorSet colors}) {
    return AppHelper.showCustomModalBottomSheetDrag(
      initialChildSize: 0.7,
      context: context,
      modal: (c) => MultiBlocProvider(
          providers: [
            BlocProvider(
                create: (context) =>
                    BookingBloc(bookingRepository, paymentsRepository)),
            BlocProvider(
                create: (context) => MasterBloc(masterRepository)
                  ..add(MasterEvent.fetchMasters(
                      context: context,
                      shopId: shopId,
                      serviceIds: serviceIds?.map((e) => e.id ?? 0).toList(),
                      isRefresh: true))),
          ],
          child: SelectMasterBottomSheet(
              colors: colors,
              controller: c,
              title: title,
              serviceIds: serviceIds,
              shopId: shopId,
              selectAll: true)),
    );
  }

  static goSelectMaster(
      {required BuildContext context,
      required int? shopId,
      required List<ServiceModel> services,
      MasterModel? master}) {
    return Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => MasterBloc(masterRepository)),
            BlocProvider(
              create: (context) =>
                  BookingBloc(bookingRepository, paymentsRepository)
                    ..add(BookingEvent.setServices(
                        services: services, master: master)),
            ),
          ],
          child: SelectMasterPage(shopId: shopId),
        ),
      ),
    );
  }

  static Future goBookingPage(
      {required BuildContext context,
      required ShopData? shop,
      required int id}) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => ShopBloc(shopsRepository)
                ..add(ShopEvent.fetchShopById(context: context, shop: shop))
                ..add(ShopEvent.generateLink(context: context)),
            ),
            BlocProvider(
                create: (context) => BookingBloc(
                    bookingRepository, paymentsRepository)
                  ..add(
                      BookingEvent.fetchBookingById(context: context, id: id))),
            BlocProvider(create: (context) => FormBloc())
          ],
          child: BookingPage(shopId: shop?.id ?? 0),
        ),
      ),
    );
  }

  static goAddNotePage(
      {required BuildContext context,
      required int shopId,
      required DateTime startTime}) {
    return Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => MultiBlocProvider(
          providers: [
            BlocProvider(
                create: (context) =>
                    MembershipBloc(shopsRepository, paymentsRepository)
                      ..add(MembershipEvent.myMemberships(
                          context: context, shopId: shopId))),
            BlocProvider(
                create: (context) =>
                    GiftCartBloc(shopsRepository, paymentsRepository)
                      ..add(GiftCartEvent.myGiftCart(
                          context: context, shopId: shopId))),
            BlocProvider.value(
              value: context.read<BookingBloc>()
                ..add(BookingEvent.fetchPayments(context: context))
                ..add(BookingEvent.calculateBooking(
                    startTime: startTime, context: context)),
            ),
          ],
          child: AddNotePage(startTime: startTime),
        ),
      ),
    );
  }

  static goSelectBookTimePage(
      {required BuildContext context,
      required Map<int, MasterModel> selectMasters}) {
    return Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => MultiBlocProvider(
          providers: [
            BlocProvider.value(
                value: context.read<BookingBloc>()
                  ..add(
                    BookingEvent.checkTime(
                        context: context, startTime: DateTime.now()),
                  )),
          ],
          child: SelectBookTime(selectMasters: selectMasters),
        ),
      ),
    );
  }

  static goPaymentBottomSheet(
      {required BuildContext context,
      required List<MasterModel>? serviceMasters,
      required num? totalPrice,
      required DateTime startTime,
      required CustomColorSet colors}) {
    return AppHelper.showCustomModalBottomSheetDrag(
      context: context,
      maxChildSize: 1,
      modal: (c) => MultiBlocProvider(
          providers: [
            BlocProvider.value(value: context.read<BookingBloc>()),
          ],
          child: BookingPaymentBottomSheet(
            colors: colors,
            controller: c,
            serviceMasters: serviceMasters,
            totalPrice: totalPrice,
            startTime: startTime,
          )),
    );
  }

  static goConfirmPage(BuildContext context) {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const ConfirmPage()),
        (route) => route.isFirst);
  }

  static goAddReviewBookingPage(
      {required BuildContext context,
      required int? shopId,
      required BookingModel? booking}) {
    return Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => MultiBlocProvider(
          providers: [
            BlocProvider.value(value: context.read<BookingBloc>()),
            BlocProvider(
              create: (context) => booking?.review == null
                  ? ReviewBloc(reviewRepository, galleryRepository)
                  : ReviewBloc(reviewRepository, galleryRepository)
                ..add(ReviewEvent.selectOfTypeFromReview(
                    review: booking?.review)),
            )
          ],
          child: AddReviewBooking(
            shopId: shopId,
            bookingModel: booking,
            review: booking?.review,
          ),
        ),
      ),
    );
  }

  static goFormOptionPage(
      {required BuildContext context, required int? formOptionId, FormOptionsData? form}) {
    return Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => MultiBlocProvider(
          providers: [
            BlocProvider.value(
              value: context.read<FormBloc>()
                ..add(
                  FormEvent.fetchSingleForms(
                      context: context, id: formOptionId,form: form),
                ),
            ),
            BlocProvider.value(value: context.read<BookingBloc>()),
          ],
          child: const FormOptionsPage(),
        ),
      ),
    );
  }

  static void goSelectMemberships(
      {required BuildContext context,
      required CustomColorSet colors,
      required int? serviceId,
      required int? shopId,
      required DateTime startTime,
      required MasterModel? selectMaster}) {
    return AppHelper.showCustomModalBottomSheetDrag(
      context: context,
      maxChildSize: 1,
      modal: (c) => MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) =>
                  MembershipBloc(shopsRepository, paymentsRepository)
                    ..add(MembershipEvent.myMemberships(
                      context: context,
                      serviceId: serviceId,
                      shopId: shopId,
                    ))),
          BlocProvider.value(value: context.read<BookingBloc>()),
        ],
        child: SelectMembershipScreen(
          colors: colors,
          controller: c,
          serviceId: serviceId,
          startTime: startTime,
          selectMaster: selectMaster,
        ),
      ),
    );
  }

  static void goSelectGiftCart(
      {required BuildContext context,
      required CustomColorSet colors,
      required DateTime startTime,
      required int? shopId}) {
    return AppHelper.showCustomModalBottomSheetDrag(
      context: context,
      maxChildSize: 1,
      modal: (c) => MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) =>
                  GiftCartBloc(shopsRepository, paymentsRepository)
                    ..add(GiftCartEvent.myGiftCart(
                        context: context, shopId: shopId, valid: true))),
          BlocProvider.value(value: context.read<BookingBloc>()),
        ],
        child: SelectGiftCartScreen(
          colors: colors,
          controller: c,
          startTime: startTime,
        ),
      ),
    );
  }
}
