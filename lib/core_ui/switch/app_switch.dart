import 'package:flutter/material.dart';

class AppSwitch extends StatefulWidget {
  final bool value;
  final ValueChanged<bool>? onChanged;
  final Color? foregroundColor;
  final Color? backgroundColor;
  final Color? selectedColor;
  final double? width;
  final double? height;
  final double? padding;

  const AppSwitch({
    super.key,
    required this.value,
    required this.onChanged,
    this.foregroundColor,
    this.backgroundColor,
    this.selectedColor,
    this.width,
    this.height,
    this.padding,
  });

  @override
  State<AppSwitch> createState() => _AppSwitchState();
}

class _AppSwitchState extends State<AppSwitch> {
  bool _value = false;

  @override
  void initState() {
    super.initState();
    _value = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    final foregroundColor = widget.foregroundColor ?? Colors.white;
    final backgroundColor = widget.backgroundColor ?? Colors.grey;
    final selectedColor = widget.selectedColor ?? Colors.green;

    final width = widget.width ?? 50;
    final height = widget.height ?? 30;
    final padding = widget.padding ?? 2;
    final circleHeight = height - 2 * padding;

    return GestureDetector(
      onTap: () {
        setState(() {
          _value = !_value;
          widget.onChanged?.call(_value);
        });
      },
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(height / 2),
          color: _value ? selectedColor : backgroundColor,
        ),
        child: Stack(
          children: [
            AnimatedPositioned(
              duration: Duration(milliseconds: 300),
              curve: Curves.ease,
              left: _value ? width - height : 0.0,
              child: Container(
                width: circleHeight,
                height: circleHeight,
                margin: EdgeInsets.all(padding),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: foregroundColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

