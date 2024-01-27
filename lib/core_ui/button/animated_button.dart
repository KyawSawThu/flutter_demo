import 'package:flutter/material.dart';

class AnimatedButton extends StatefulWidget {
  final Widget child;
  final VoidCallback onPressed;

  const AnimatedButton({Key? key, required this.child, required this.onPressed})
      : super(key: key);

  @override
  _AnimatedButtonState createState() => _AnimatedButtonState();
}

class _AnimatedButtonState extends State<AnimatedButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 200),
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.9).animate(_controller);
    _opacityAnimation = Tween<double>(begin: 1.0, end: 0.5).animate(_controller);

    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        _controller.forward();
      },
      onTapUp: (_) {
        _controller.reverse();
      },
      onTapCancel: () {
        _controller.reverse();
      },
      child: Opacity(
        opacity: _opacityAnimation.value,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                blurRadius: 5.0,
                spreadRadius: 1.0,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: widget.child,
        ),
      ),
    );
  }
}
