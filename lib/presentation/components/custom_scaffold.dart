import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:ibeauty/infrastructure/local_storage/local_storage.dart';
import 'package:ibeauty/presentation/pages/no_internet/no_internet.dart';
import 'package:ibeauty/presentation/style/theme/theme.dart';
import 'package:ibeauty/presentation/style/theme/theme_warpper.dart';

import '../../app_constants.dart';
import 'keyboard_dismisser.dart';

class CustomScaffold extends StatefulWidget {
  final Widget Function(CustomColorSet colors) body;
  final Widget? Function(CustomColorSet colors)? floatingButton;
  final Widget? Function(CustomColorSet colors)? bottomNavigationBar;
  final Widget? Function(CustomColorSet colors)? drawer;
  final FloatingActionButtonLocation? floatingButtonLocation;
  final PreferredSizeWidget? Function(CustomColorSet colors)? appBar;
  final Color? bgColor;
  final bool bgImage;

  const CustomScaffold(
      {Key? key,
      required this.body,
      this.appBar,
      this.floatingButton,
      this.floatingButtonLocation,
      this.bgColor,
      this.bottomNavigationBar,
      this.bgImage = false,
      this.drawer})
      : super(key: key);

  @override
  State<CustomScaffold> createState() => _CustomScaffoldState();
}

class _CustomScaffoldState extends State<CustomScaffold>
    with WidgetsBindingObserver {
  StreamSubscription? connectivitySubscription;
  ValueNotifier<bool> isNetworkDisabled = ValueNotifier(false);

  void _checkCurrentNetworkState() {
    Connectivity().checkConnectivity().then((connectivityResult) {
      isNetworkDisabled.value = connectivityResult == ConnectivityResult.none;
    });
  }

  initStateFunc() {
    _checkCurrentNetworkState();
    connectivitySubscription = Connectivity().onConnectivityChanged.listen(
      (ConnectivityResult result) {
        isNetworkDisabled.value = result == ConnectivityResult.none;
      },
    );
  }

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    initStateFunc();
    super.initState();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.resumed) {
      _checkCurrentNetworkState();
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    connectivitySubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ValueListenableBuilder(
            valueListenable: isNetworkDisabled,
            builder: (_, bool networkDisabled, __) => Visibility(
                  visible: !networkDisabled,
                  child: ThemeWrapper(builder: (colors, controller) {
                    return KeyboardDismisser(
                      isLtr: LocalStorage.getLangLtr(),
                      child: Container(
                        decoration: widget.bgImage
                            ? BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(controller.isDark
                                      ? AppConstants.darkBgChat
                                      : AppConstants.lightBgChat),
                                  fit: BoxFit.cover,
                                ),
                              )
                            : null,
                        child: Scaffold(
                          resizeToAvoidBottomInset: false,
                          appBar: widget.appBar?.call(colors),
                          backgroundColor:
                              widget.bgColor ?? colors.backgroundColor,
                          body: widget.body(colors),
                          drawer: widget.drawer?.call((colors)),
                          floatingActionButton:
                              widget.floatingButton?.call(colors),
                          floatingActionButtonLocation:
                              widget.floatingButtonLocation,
                          bottomNavigationBar:
                              widget.bottomNavigationBar?.call(colors),
                        ),
                      ),
                    );
                  }),
                )),
        ValueListenableBuilder(
          valueListenable: isNetworkDisabled,
          builder: (_, bool networkDisabled, __) => Visibility(
            visible: networkDisabled,
            child: const NoInternetPage(),
          ),
        ),
      ],
    );
  }
}
