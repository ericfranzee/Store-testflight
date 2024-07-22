import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomStyle {
  CustomStyle._();

  /// colors.
  static const Color primary = Color(0xffBB9B6A);

  static const Color black = Colors.black;

  static const Color starColor = Color(0xffFFA826);

  static const Color reviewColor = Color(0xffF19204);

  static const Color greenColor = Color(0xff16AA16);


  static const Color unselectColor = Color(0xffF4F8F4);

  static const Color white = Colors.white;

  static const Color whiteWithOpacity = Color(0x30ffffff);

  static const Color red = Color(0xffFE0000);

  static const Color success = Color(0xff31D0AA);

  static const Color icon = Color(0x30B1B1B1);

  static const Color textHint = Color(0xff939393);

  static const Color transparent = Colors.transparent;

  static const Color bgDark = Color(0xff18191D);

  static const Color socialButtonDark = Color(0xff33393F);

  static const Color socialButtonLight = Color(0x40ffffff);

  static const Color bottomBarColorDark = Color(0xff444444);

  static const Color bottomBarColorLight = Color(0xff000000);

  static const Color categoryDark = Color(0xff33393F);

  static const Color dividerColor = Color(0xffF3F3F3);

  static const Color reviewBoxColor = Color(0xffF7F7F9);

  static const Color seeAllColor = Color(0xff289AB3);

  static const Color subCategory = Color(0xffF6F6F6);

  static const Color unselectLayout = Color(0xffAEAEAE);

  static const Color unselectTabBar = Color(0xffA0A09C);

  static const Color service1 = Color(0xffFFEDD7);
  static const Color service2 = Color(0xffD6FFD2);
  static const Color service3 = Color(0xffF1D2D2);
  static const Color service4 = Color(0xffD8DCFF);
  static const Color service5 = Color(0xffF7D8FF);
  static const Color service6 = Color(0xffC3F8FF);
  static const Color service7 = Color(0xffE8E8E8);
  static const Color service8 = Color(0xffFFE6B4);
  static const Color service9 = Color(0xffFFD2E8);
  static const Color service10 = Color(0xffC6F4E4);
  static const Color service11 = Color(0xffC1E8FF);
  static const Color service12 = Color(0xffC2B6A4);

  static Color shimmerBase = Colors.grey.shade300;

  ///fonsts.
  static interBold(
          {double size = 18,
          required Color color,
          FontStyle fontStyle = FontStyle.normal,
          double letterSpacing = 0}) =>
      GoogleFonts.inter(
          fontSize: size.sp,
          fontWeight: FontWeight.bold,
          color: color,
          fontStyle: fontStyle,
          letterSpacing: letterSpacing.sp,
          decoration: TextDecoration.none);

  static interSemi(
          {double size = 18,
          required Color color,
          FontStyle fontStyle = FontStyle.normal,
          TextDecoration decoration = TextDecoration.none,
          double letterSpacing = 0}) =>
      GoogleFonts.inter(
          fontSize: size.sp,
          fontWeight: FontWeight.w700,
          color: color,
          fontStyle: fontStyle,
          letterSpacing: letterSpacing.sp,
          decoration: decoration);

  static interNoSemi(
          {double size = 18,
          required Color color,
          FontStyle fontStyle = FontStyle.normal,
          TextDecoration decoration = TextDecoration.none,
          double letterSpacing = 0}) =>
      GoogleFonts.inter(
          fontSize: size.sp,
          fontWeight: FontWeight.w600,
          color: color,
          fontStyle: fontStyle,
          letterSpacing: letterSpacing.sp,
          decoration: decoration);

  static interNormal(
          {double size = 16,
          required Color color,
          FontStyle fontStyle = FontStyle.normal,
          TextDecoration textDecoration = TextDecoration.none,
          double letterSpacing = 0}) =>
      GoogleFonts.inter(
          fontSize: size.sp,
          fontWeight: FontWeight.w500,
          color: color,
          fontStyle: fontStyle,
          letterSpacing: letterSpacing.sp,
          decoration: textDecoration);

  static interRegular(
          {double size = 16,
          FontStyle fontStyle = FontStyle.normal,
          required Color color,
          TextDecoration textDecoration = TextDecoration.none,
          double letterSpacing = 0}) =>
      GoogleFonts.inter(
          fontSize: size,
          fontWeight: FontWeight.w400,
          color: color,
          fontStyle: fontStyle,
          letterSpacing: letterSpacing.sp,
          decoration: textDecoration);

  ///InputDecoration.
  static InputDecoration customDropDownDecoration({required String hintText}) {
    return InputDecoration(
      hintText: hintText,
      hintStyle: CustomStyle.interNormal(
        size: 14.sp,
        color: CustomStyle.textHint,
      ),
      floatingLabelBehavior: FloatingLabelBehavior.always,
      fillColor: CustomStyle.black,
      filled: false,
      enabledBorder: OutlineInputBorder(
          borderSide: BorderSide.merge(
              const BorderSide(color: CustomStyle.icon),
              const BorderSide(color: CustomStyle.icon)),
          borderRadius: BorderRadius.circular(10.r)),
      errorBorder: OutlineInputBorder(
          borderSide: BorderSide.merge(
              const BorderSide(color: CustomStyle.icon),
              const BorderSide(color: CustomStyle.icon)),
          borderRadius: BorderRadius.circular(10.r)),
      border: OutlineInputBorder(
          borderSide: BorderSide.merge(
              const BorderSide(color: CustomStyle.icon),
              const BorderSide(color: CustomStyle.icon)),
          borderRadius: BorderRadius.circular(10.r)),
      focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide.merge(
              const BorderSide(color: CustomStyle.icon),
              const BorderSide(color: CustomStyle.icon)),
          borderRadius: BorderRadius.circular(10.r)),
      disabledBorder: OutlineInputBorder(
          borderSide: BorderSide.merge(
              const BorderSide(color: CustomStyle.icon),
              const BorderSide(color: CustomStyle.icon)),
          borderRadius: BorderRadius.circular(10.r)),
      focusedBorder: OutlineInputBorder(
          borderSide: BorderSide.merge(
              const BorderSide(color: CustomStyle.icon),
              const BorderSide(color: CustomStyle.icon)),
          borderRadius: BorderRadius.circular(10.r)),
    );
  }
}
