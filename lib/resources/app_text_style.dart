import 'package:flutter/material.dart';
import 'package:flutter_demo/resources/app_color.dart';

class AppTextStyle {

  static TextStyle get osL10 => openSans.copyWith(fontSize: 10, fontWeight: FontWeight.w300);
  static TextStyle get osL12 => openSans.copyWith(fontSize: 12, fontWeight: FontWeight.w300);
  static TextStyle get osL14 => openSans.copyWith(fontSize: 14, fontWeight: FontWeight.w300);
  static TextStyle get osL16 => openSans.copyWith(fontSize: 16, fontWeight: FontWeight.w300);
  static TextStyle get osL18 => openSans.copyWith(fontSize: 18, fontWeight: FontWeight.w300);
  static TextStyle get osL20 => openSans.copyWith(fontSize: 20, fontWeight: FontWeight.w300);
  static TextStyle get osL22 => openSans.copyWith(fontSize: 22, fontWeight: FontWeight.w300);
  static TextStyle get osL24 => openSans.copyWith(fontSize: 24, fontWeight: FontWeight.w300);
  static TextStyle get osL26 => openSans.copyWith(fontSize: 26, fontWeight: FontWeight.w300);

  static TextStyle get osR10 => openSans.copyWith(fontSize: 10, fontWeight: FontWeight.w400);
  static TextStyle get osR12 => openSans.copyWith(fontSize: 12, fontWeight: FontWeight.w400);
  static TextStyle get osR14 => openSans.copyWith(fontSize: 14, fontWeight: FontWeight.w400);
  static TextStyle get osR16 => openSans.copyWith(fontSize: 16, fontWeight: FontWeight.w400);
  static TextStyle get osR18 => openSans.copyWith(fontSize: 18, fontWeight: FontWeight.w400);
  static TextStyle get osR20 => openSans.copyWith(fontSize: 20, fontWeight: FontWeight.w400);
  static TextStyle get osR22 => openSans.copyWith(fontSize: 22, fontWeight: FontWeight.w400);
  static TextStyle get osR24 => openSans.copyWith(fontSize: 24, fontWeight: FontWeight.w400);
  static TextStyle get osR26 => openSans.copyWith(fontSize: 26, fontWeight: FontWeight.w400);

  static TextStyle get osM10 => openSans.copyWith(fontSize: 10, fontWeight: FontWeight.w500);
  static TextStyle get osM12 => openSans.copyWith(fontSize: 12, fontWeight: FontWeight.w500);
  static TextStyle get osM14 => openSans.copyWith(fontSize: 14, fontWeight: FontWeight.w500);
  static TextStyle get osM16 => openSans.copyWith(fontSize: 16, fontWeight: FontWeight.w500);
  static TextStyle get osM18 => openSans.copyWith(fontSize: 18, fontWeight: FontWeight.w500);
  static TextStyle get osM20 => openSans.copyWith(fontSize: 20, fontWeight: FontWeight.w500);
  static TextStyle get osM22 => openSans.copyWith(fontSize: 22, fontWeight: FontWeight.w500);
  static TextStyle get osM24 => openSans.copyWith(fontSize: 24, fontWeight: FontWeight.w500);
  static TextStyle get osM26 => openSans.copyWith(fontSize: 26, fontWeight: FontWeight.w500);

  static TextStyle get osSB10 => openSans.copyWith(fontSize: 10, fontWeight: FontWeight.w600);
  static TextStyle get osSB12 => openSans.copyWith(fontSize: 12, fontWeight: FontWeight.w600);
  static TextStyle get osSB14 => openSans.copyWith(fontSize: 14, fontWeight: FontWeight.w600);
  static TextStyle get osSB16 => openSans.copyWith(fontSize: 16, fontWeight: FontWeight.w600);
  static TextStyle get osSB18 => openSans.copyWith(fontSize: 18, fontWeight: FontWeight.w600);
  static TextStyle get osSB20 => openSans.copyWith(fontSize: 20, fontWeight: FontWeight.w600);
  static TextStyle get osSB22 => openSans.copyWith(fontSize: 22, fontWeight: FontWeight.w600);
  static TextStyle get osSB24 => openSans.copyWith(fontSize: 24, fontWeight: FontWeight.w600);
  static TextStyle get osSB26 => openSans.copyWith(fontSize: 26, fontWeight: FontWeight.w600);

  static TextStyle get osB10 => openSans.copyWith(fontSize: 10, fontWeight: FontWeight.w700);
  static TextStyle get osB12 => openSans.copyWith(fontSize: 12, fontWeight: FontWeight.w700);
  static TextStyle get osB14 => openSans.copyWith(fontSize: 14, fontWeight: FontWeight.w700);
  static TextStyle get osB16 => openSans.copyWith(fontSize: 16, fontWeight: FontWeight.w700);
  static TextStyle get osB18 => openSans.copyWith(fontSize: 18, fontWeight: FontWeight.w700);
  static TextStyle get osB20 => openSans.copyWith(fontSize: 20, fontWeight: FontWeight.w700);
  static TextStyle get osB22 => openSans.copyWith(fontSize: 22, fontWeight: FontWeight.w700);
  static TextStyle get osB24 => openSans.copyWith(fontSize: 24, fontWeight: FontWeight.w700);
  static TextStyle get osB26 => openSans.copyWith(fontSize: 26, fontWeight: FontWeight.w700);

  static TextStyle get openSans => TextStyle(
    fontFamily: "OpenSans",
    fontWeight: FontWeight.w700,
    fontSize: 12,
  );
}

extension AppTextStyleColor on TextStyle {
  TextStyle get black => copyWith(color: AppColor.black);
  TextStyle get darkBlack => copyWith(color: AppColor.darkBlack);

  TextStyle get white => copyWith(color: AppColor.white);
  TextStyle get alphaWhite => copyWith(color: AppColor.alphaWhite);

  TextStyle get grey => copyWith(color: AppColor.grey);
  TextStyle get darkGrey => copyWith(color: AppColor.darkGrey);
  TextStyle get lightGrey => copyWith(color: AppColor.lightGrey);
  TextStyle get smokeGrey => copyWith(color: AppColor.smokeGrey);


  TextStyle get red => copyWith(color: AppColor.red);
  TextStyle get darkRed => copyWith(color: AppColor.darkRed);
  TextStyle get lightRed => copyWith(color: AppColor.lightRed);

  TextStyle get green => copyWith(color: AppColor.green);
  TextStyle get darkGreen => copyWith(color: AppColor.darkGreen);

  TextStyle get orange => copyWith(color: AppColor.orange);
}
