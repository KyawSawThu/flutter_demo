import 'package:flutter/material.dart';
import 'package:flutter_demo/core/rx/controllers/button_controller.dart';
import 'package:flutter_demo/resources/app_color.dart';
import 'package:flutter_demo/resources/app_text_style.dart';

class AppTextButton extends StatefulWidget {
  final String title;
  final TextStyle? style;
  final ButtonController? controller;
  final Function? onPressed;

  const AppTextButton({
    super.key,
    required this.title,
    this.style,
    this.controller,
    this.onPressed,
  });

  @override
  State<AppTextButton> createState() => _AppButtonState();
}

class _AppButtonState extends State<AppTextButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    final textStyle = widget.style == null ? AppTextStyle.osL16 : widget.style!;
    final foregroundColor = _isPressed ? AppColor.black.withOpacity(0.5) : AppColor.black;

    return GestureDetector(
      onTap: () {
        if (widget.onPressed != null) {
          widget.onPressed!();
        }
        widget.controller?.handleOnTap();
      },
      onTapDown: (_) {
        setState(() {
          _isPressed = true;
        });
      },
      onTapUp: (_) {
        setState(() {
          _isPressed = false;
        });
      },
      onTapCancel: () {
        setState(() {
          _isPressed = false;
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 150),
        child: Text(
          widget.title,
          style: textStyle.copyWith(color: foregroundColor),
        ),
      ),
    );
  }
}
