import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ibeauty/application/address/address_bloc.dart';
import 'package:ibeauty/application/auth/auth_bloc.dart';
import 'package:ibeauty/application/banner/banner_bloc.dart';
import 'package:ibeauty/application/blog/blog_bloc.dart';
import 'package:ibeauty/application/brand/brand_bloc.dart';
import 'package:ibeauty/application/cart/cart_bloc.dart';
import 'package:ibeauty/application/category/category_bloc.dart';
import 'package:ibeauty/application/chat/chat_bloc.dart';
import 'package:ibeauty/application/game/game_bloc.dart';
import 'package:ibeauty/application/gift_cart/gift_cart_bloc.dart';
import 'package:ibeauty/application/main/main_bloc.dart';
import 'package:ibeauty/application/membership/membership_bloc.dart';
import 'package:ibeauty/application/notification/notification_bloc.dart';
import 'package:ibeauty/application/order/order_bloc.dart';
import 'package:ibeauty/application/products/product_bloc.dart';
import 'package:ibeauty/application/profile/profile_bloc.dart';
import 'package:ibeauty/application/shop/shop_bloc.dart';
import 'package:ibeauty/application/story/story_bloc.dart';
import 'package:ibeauty/application/wallet/wallet_bloc.dart';
import 'package:ibeauty/domain/di/dependency_manager.dart';
import 'package:ibeauty/domain/model/response/notification_response.dart';
import 'package:ibeauty/domain/service/helper.dart';
import 'package:ibeauty/game/game.dart';
import 'package:ibeauty/infrastructure/local_storage/local_storage.dart';
import 'package:ibeauty/presentation/components/select_ui_type.dart';
import 'package:ibeauty/presentation/pages/app_setting/app_setting.dart';
import 'package:ibeauty/presentation/pages/app_setting/widgets/currency.dart';
import 'package:ibeauty/presentation/pages/app_setting/widgets/language.dart';
import 'package:ibeauty/presentation/pages/blog/blog_list_page.dart';
import 'package:ibeauty/presentation/pages/chat/chat_list_page.dart';
import 'package:ibeauty/presentation/pages/chat/chat_page.dart';
import 'package:ibeauty/presentation/pages/country/city_page.dart';
import 'package:ibeauty/presentation/pages/country/country_page.dart';
import 'package:ibeauty/presentation/pages/gift_cart/my_gift_cart.dart';
import 'package:ibeauty/presentation/pages/group_order/group_order_page.dart';
import 'package:ibeauty/presentation/pages/help_policy_term/help_page.dart';
import 'package:ibeauty/presentation/pages/help_policy_term/policy_page.dart';
import 'package:ibeauty/presentation/pages/help_policy_term/term_page.dart';
import 'package:ibeauty/presentation/pages/membership/my_memberships.dart';
import 'package:ibeauty/presentation/pages/notification/notification_page.dart';
import 'package:ibeauty/presentation/pages/notification/widgets/notification_bottom_sheet.dart';
import 'package:ibeauty/presentation/pages/profile/change_password.dart';
import 'package:ibeauty/presentation/pages/profile/edit_account.dart';
import 'package:ibeauty/presentation/pages/profile/my_account.dart';
import 'package:ibeauty/presentation/pages/profile/referral_page.dart';
import 'package:ibeauty/presentation/pages/transactions/transaction_list.dart';
import 'package:ibeauty/presentation/style/theme/theme.dart';

abstract class AppRouteSetting {
  AppRouteSetting._();

  static goNotification({required BuildContext context}) {
    return Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => MultiBlocProvider(
          providers: [
            BlocProvider.value(
                value: context.read<NotificationBloc>()
                  ..add(NotificationEvent.fetchNotification(
                      context: context, isRefresh: true))
                  ..add(NotificationEvent.fetchCount(context: context))),
            BlocProvider.value(value: context.read<BlogBloc>()),
            BlocProvider(
              create: (context) => OrderBloc(
                  ordersRepository, paymentsRepository, cartRepository),
            ),
            BlocProvider.value(value: context.read<ProductBloc>()),
            BlocProvider.value(value: context.read<MainBloc>()),
            BlocProvider.value(value: context.read<CartBloc>()),
          ],
          child: const NotificationPage(),
        ),
      ),
    );
  }

  static goNotificationBottomSheet(BuildContext context,
      NotificationModel notification, CustomColorSet colors) {
    return AppHelper.showCustomModalBottomSheet(
      context: context,
      modal: NotificationBottomSheetSheet(
        notification: notification,
        colors: colors,
      ),
    );
  }

  static goHelp({required BuildContext context}) {
    return Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => BlocProvider.value(
          value: context.read<ProfileBloc>()
            ..add(ProfileEvent.getHelps(context: context)),
          child: const HelpPage(),
        ),
      ),
    );
  }

  static goPolicy({required BuildContext context}) {
    return Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => BlocProvider.value(
          value: context.read<ProfileBloc>()
            ..add(ProfileEvent.getPolicy(context: context)),
          child: const PolicyPage(),
        ),
      ),
    );
  }

  static goTerm({required BuildContext context}) {
    return Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => BlocProvider.value(
          value: context.read<ProfileBloc>()
            ..add(ProfileEvent.getTerm(context: context)),
          child: const TermPage(),
        ),
      ),
    );
  }

  static goBlog({required BuildContext context}) {
    return Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => BlocProvider.value(
          value: context.read<BlogBloc>(),
          child: const BlogListPage(),
        ),
      ),
    );
  }

  static goLanguage({
    required BuildContext context,
  }) {
    return AppHelper.showCustomModalBottomSheet(
      context: context,
      modal: MultiBlocProvider(
        providers: [
          BlocProvider.value(value: context.read<ProductBloc>()),
          BlocProvider.value(value: context.read<CategoryBloc>()),
          BlocProvider.value(value: context.read<BannerBloc>()),
          BlocProvider.value(value: context.read<ProfileBloc>()),
          BlocProvider.value(value: context.read<BlogBloc>()),
          BlocProvider.value(value: context.read<BrandBloc>()),
          BlocProvider.value(value: context.read<ShopBloc>()),
          BlocProvider.value(value: context.read<StoryBloc>()),
        ],
        child: const LanguagePage(),
      ),
    );
  }

  static goCurrency({
    required BuildContext context,
  }) {
    return AppHelper.showCustomModalBottomSheetDrag(
      context: context,
      maxChildSize: 0.8,
      modal: (c) => MultiBlocProvider(
        providers: [
          BlocProvider.value(value: context.read<ProductBloc>()),
          BlocProvider.value(value: context.read<CategoryBloc>()),
          BlocProvider.value(value: context.read<BannerBloc>()),
          BlocProvider.value(value: context.read<ProfileBloc>()),
          BlocProvider.value(value: context.read<BlogBloc>()),
          BlocProvider.value(value: context.read<BrandBloc>()),
          BlocProvider.value(value: context.read<ShopBloc>()),
          BlocProvider.value(value: context.read<StoryBloc>()),
        ],
        child: CurrencyPage(controller: c),
      ),
    );
  }

  static goMyAccount({required BuildContext context}) {
    return Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => MultiBlocProvider(
          providers: [
            BlocProvider.value(
              value: context.read<ProfileBloc>(),
            ),
            BlocProvider.value(
              value: context.read<NotificationBloc>(),
            ),
            BlocProvider.value(value: context.read<BlogBloc>()),
            BlocProvider(
              create: (context) => OrderBloc(
                  ordersRepository, paymentsRepository, cartRepository),
            ),
            BlocProvider.value(value: context.read<ProductBloc>()),
            BlocProvider.value(value: context.read<MainBloc>()),
            BlocProvider.value(value: context.read<CartBloc>()),
          ],
          child: const MyAccount(),
        ),
      ),
    );
  }

  static goAppSetting({required BuildContext context}) {
    return Navigator.of(context).push(
      MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
                providers: [
                  BlocProvider.value(value: context.read<ProductBloc>()),
                  BlocProvider.value(value: context.read<BannerBloc>()),
                  BlocProvider.value(value: context.read<ProfileBloc>()),
                  BlocProvider.value(value: context.read<BlogBloc>()),
                  BlocProvider.value(value: context.read<ShopBloc>()),
                  BlocProvider.value(value: context.read<StoryBloc>()),
                  BlocProvider.value(value: context.read<BrandBloc>()),
                  BlocProvider.value(value: context.read<CategoryBloc>()),
                ],
                child: const AppSettingPage(),
              )),
    );
  }

  static goSelectCountry({required BuildContext context}) {
    return Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => BlocProvider(
          create: (context) => AddressBloc(addressRepository)
            ..add(AddressEvent.fetchCountry(context: context, isRefresh: true)),
          child: const CountryPage(),
        ),
      ),
    );
  }

  static goSelectCity(
      {required BuildContext context,
      required int countryId,
      bool pushAddress = false}) {
    return Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => BlocProvider(
          create: (context) => AddressBloc(addressRepository)
            ..add(AddressEvent.fetchCity(
                context: context, isRefresh: true, countyId: countryId)),
          child: CityPage(
            countryId: countryId,
            pushAddress: pushAddress,
          ),
        ),
      ),
    );
  }

  static goTransactionList({required BuildContext context}) {
    return Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => MultiBlocProvider(
          providers: [
            BlocProvider.value(value: context.read<ProfileBloc>()),
            BlocProvider(
              create: (context) =>
                  WalletBloc(userRepository, paymentsRepository)
                    ..add(WalletEvent.fetchTransactions(
                        context: context, isRefresh: true))
                    ..add(WalletEvent.fetchPayments(context: context)),
            )
          ],
          child: const TransactionList(),
        ),
      ),
    );
  }

  static goMyReferral({required BuildContext context}) {
    return Navigator.of(context).push(MaterialPageRoute(
        builder: (_) => BlocProvider.value(
              value: context.read<ProfileBloc>()
                ..add(ProfileEvent.fetchReferral(context: context)),
              child: const ReferralPage(),
            )));
  }

  static goSelectUIType({required BuildContext context}) {
    return Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => const SelectUITypePage()),
    );
  }

  static goGamePage({required BuildContext context}) {
    return Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => BlocProvider(
          create: (context) => GameBloc()..add(const GameEvent.init()),
          child: const Game(),
        ),
      ),
    );
  }

  static goGroupOrder(BuildContext context, CustomColorSet colors) {
    return AppHelper.showCustomModalBottomSheet(
      context: context,
      modal: BlocProvider.value(
        value: LocalStorage.getGroupOrder().id == null
            ? (context.read<CartBloc>()
              ..add(CartEvent.createLink(context: context)))
            : (context.read<CartBloc>()
              ..add(CartEvent.getCart(context: context))),
        child: GroupOrderPage(
          colors: colors,
        ),
      ),
    );
  }

  static goChatsList({required BuildContext context}) {
    return Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => BlocProvider(
          create: (context) => ChatBloc(chatRepository, galleryRepository),
          child: const ChatListPage(),
        ),
      ),
    );
  }

  static goChat(
      {required BuildContext context, required int senderId, String? chatId}) {
    return Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => BlocProvider(
          create: (context) => ChatBloc(chatRepository, galleryRepository)
            ..add(ChatEvent.checkChatId(context: context, sellerId: senderId)),
          child: ChatPage(
            senderId: senderId,
            chatId: chatId,
          ),
        ),
      ),
    );
  }

  static goEditProfile(
      {required BuildContext context, required CustomColorSet colors}) {
    return AppHelper.showCustomModalBottomSheet(
      context: context,
      modal: MultiBlocProvider(
        providers: [
          BlocProvider.value(
            value: context.read<ProfileBloc>(),
          ),
          BlocProvider(
            create: (context) => AuthBloc(authRepository),
          ),
        ],
        child: EditAccountScreen(colors: colors),
      ),
    );
  }

  static goChangePassword(
      {required BuildContext context, required CustomColorSet colors}) {
    return AppHelper.showCustomModalBottomSheet(
      context: context,
      modal: BlocProvider.value(
        value: context.read<ProfileBloc>(),
        child: ChangePassword(colors: colors),
      ),
    );
  }

  static goMyMemberships({required BuildContext context}) {
    return Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => BlocProvider(
          create: (context) =>
              MembershipBloc(shopsRepository, paymentsRepository)
                ..add(MembershipEvent.myMemberships(context: context)),
          child: const MyMembershipsPage(),
        ),
      ),
    );
  }

  static goMyGiftCart({required BuildContext context}) {
    return Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => BlocProvider(
          create: (context) => GiftCartBloc(shopsRepository, paymentsRepository)
            ..add(GiftCartEvent.myGiftCart(context: context)),
          child: const MyGiftCartPage(),
        ),
      ),
    );
  }
}
