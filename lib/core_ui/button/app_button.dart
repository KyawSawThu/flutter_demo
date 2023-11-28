import 'package:flutter/material.dart';
import 'package:flutter_demo/core/rx/controllers/button_controller.dart';
import 'package:flutter_demo/resources/app_color.dart';
import 'package:flutter_demo/resources/app_text_style.dart';

class AppButton extends StatefulWidget {
  final String title;
  final Color? foregroundColor;
  final Color? backgroundColor;
  final Color? borderColor;
  final ButtonController? controller;
  final Function? onPressed;
  final bool isEnabled;

  const AppButton({
    super.key,
    required this.title,
    this.foregroundColor,
    this.backgroundColor,
    this.borderColor,
    this.controller,
    this.onPressed,
    this.isEnabled = true,
  });

  @override
  State<AppButton> createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    final foregroundColor = widget.foregroundColor ?? AppColor.white;
    final backgroundColor = widget.backgroundColor ?? AppColor.black;
    final borderColor = widget.borderColor ?? AppColor.transparent;

    return GestureDetector(
      onTap: () {
        if (widget.onPressed != null && widget.isEnabled) {
          widget.onPressed!();
        }
        if (widget.isEnabled) {
          widget.controller?.handleOnTap();
        }
      },
      onTapDown: (_) {
        setState(() {
          if (widget.isEnabled) {
            _isPressed = true;
          }
        });
      },
      onTapUp: (_) {
        setState(() {
          if (widget.isEnabled) {
            _isPressed = false;
          }
        });
      },
      onTapCancel: () {
        setState(() {
          if (widget.isEnabled) {
            _isPressed = false;
          }
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 150),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
          decoration: BoxDecoration(
            color: _isPressed ? backgroundColor.withOpacity(0.5) : backgroundColor,
            border: Border.all(color: borderColor, width: 1),
            borderRadius: BorderRadius.circular(27),
          ),
          child: Text(
            widget.title,
            style: AppTextStyle.osM16.copyWith(color: foregroundColor),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
