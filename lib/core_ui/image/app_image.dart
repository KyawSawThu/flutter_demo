import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppImage extends StatelessWidget {
  String assets;
  double? width;
  double? height;
  Color? color;

  AppImage({
    super.key,
    required this.assets,
    this.width,
    this.height,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      assets,
      width: width,
      height: height,
      color: color,
    );
  }
}
