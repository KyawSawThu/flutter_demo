import 'package:flutter/cupertino.dart';

abstract class NavigationView extends StatelessWidget {
  const NavigationView({super.key});

  Widget navigationView();

  @override
  Widget build(BuildContext context) {
    return navigationView();
  }
}
