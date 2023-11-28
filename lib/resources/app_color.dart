import 'package:flutter/material.dart';
import 'package:flutter_demo/core/utility/dart/hex_color.dart';

class AppColor {
  AppColor._();
  static Color get transparent => Colors.transparent;

  static Color get black => HexColor("#000000");
  static Color get darkBlack => HexColor("#332218");

  static Color get white => HexColor("#FFFFFF");
  static Color get alphaWhite => HexColor("#FFFFFF").withOpacity(0.25);

  static Color get grey => HexColor("#B9B9B9");
  static Color get darkGrey => HexColor("#464447");
  static Color get lightGrey => HexColor("#E7E8E9");
  static Color get smokeGrey => HexColor("#A6ABC4");

  static Color get red => HexColor("#C50000");
  static Color get darkRed => HexColor("#981B1F");
  static Color get lightRed => HexColor("#F20000");

  static Color get green => HexColor("#009254");
  static Color get darkGreen => HexColor("#508A7B");

  static Color get orange => HexColor("#CF6212");
}