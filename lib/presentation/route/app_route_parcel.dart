import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ibeauty/application/checkout/checkout_bloc.dart';
import 'package:ibeauty/application/parcel/parcel_bloc.dart';
import 'package:ibeauty/application/parcels_list/parcels_list_bloc.dart';
import 'package:ibeauty/domain/di/dependency_manager.dart';
import 'package:ibeauty/domain/model/model/parcel_order_model.dart';
import 'package:ibeauty/domain/service/helper.dart';
import 'package:ibeauty/presentation/pages/parcel/parcel_list_page.dart';
import 'package:ibeauty/presentation/pages/parcel/parcel_order_page.dart';
import 'package:ibeauty/presentation/pages/parcel/parcel_page.dart';
import 'package:ibeauty/presentation/pages/parcel/widgets/info_screen.dart';
import 'package:ibeauty/presentation/style/theme/theme.dart';

abstract class AppRouteParcel {
  AppRouteParcel._();

  static goInfoScreen(
      {required BuildContext context,
      required int index,
      bool replace = false,
      required CustomColorSet colors}) {
    if (replace) {
      return Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (_) => InfoPage(index: index, colors: colors),
        ),
      );
    }
    return Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => InfoPage(index: index, colors: colors),
      ),
    );
  }

  static goParcel({required BuildContext context}) {
    return Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) =>
                  ParcelBloc(parcelRepository, paymentsRepository)
                    ..add(ParcelEvent.fetchTypes(context)),
            ),
            BlocProvider(
              create: (_) => CheckoutBloc(paymentsRepository, addressRepository)
                ..add(CheckoutEvent.fetchPayments(context: context)),
            ),
          ],
          child: const ParcelPage(),
        ),
      ),
    );
  }

  static goParcelOrderPage(
      BuildContext context, ParcelOrder? parcel, CustomColorSet colors) {
    return AppHelper.showCustomModalBottomSheetDrag(
      context: context,
      paddingTop: MediaQuery.sizeOf(context).height / 3,
      modal: (c) => BlocProvider(
        create: (context) => ParcelBloc(parcelRepository, paymentsRepository)
          ..add(ParcelEvent.showParcel(
              context: context, orderId: parcel?.id ?? 0, parcel: parcel)),
        child: ParcelOrderScreen(
          colors: colors,
          controller: c,
        ),
      ),
    );
  }

  static goParcelList({required BuildContext context}) {
    Navigator.popUntil(context, (route) {
      return route.isFirst;
    });
    return Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => BlocProvider(
          create: (context) => ParcelsListBloc(parcelRepository)
            ..add(ParcelsListEvent.fetchActiveParcel(
                context: context, isRefresh: true))
            ..add(ParcelsListEvent.fetchHistoryParcel(
                context: context, isRefresh: true)),
          child: const ParcelListPage(),
        ),
      ),
    );
  }
}
