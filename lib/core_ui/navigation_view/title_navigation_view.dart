import 'package:flutter/material.dart';
import 'package:flutter_demo/core_ui/navigation_view/navigation_view.dart';

class TitleNavigationView extends NavigationView {
  final String title;

  const TitleNavigationView({
    super.key,
    required this.title,
  });

  @override
  Widget navigationView() {
    return Container(
      height: 60,
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      color: Colors.red,
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white,
          decoration: TextDecoration.none,
        ),
      ),
    );
  }
}
