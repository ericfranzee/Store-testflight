import 'dart:io' show Platform;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ibeauty/presentation/style/theme/theme_warpper.dart';

class Loading extends StatelessWidget {
  final bool changeColor;

  const Loading({
    Key? key,
    this.changeColor = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ThemeWrapper(builder: (colors, c) {
      return Center(
        child: Platform.isAndroid
            ? CircularProgressIndicator(
                color: changeColor ? colors.white : colors.textBlack,
              )
            : CupertinoActivityIndicator(
                color: changeColor ? colors.white : colors.textBlack,
              ),
      );
    });
  }
}
