import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/navigator.dart';
import 'package:flutter_demo/core/coordinator/route_provider.dart';
import 'package:flutter_demo/features/onboard/intro/intro_view.dart';
import 'package:flutter_demo/features/onboard/launch/launch_view.dart';
import 'package:flutter_demo/features/onboard/welcome/welcome_view.dart';
import 'package:flutter_demo/features/tab/tab_view.dart';

class OnboardRouteProvider implements RouteProvider {
  @override
  Widget? view(RouteSettings settings) {
    final route = settings.name;
    switch (route) {
      case OnboardRoute.launch:
        return LaunchView();
      case OnboardRoute.welcome:
        return WelcomeView();
      case OnboardRoute.intro:
        return IntroView();
      case OnboardRoute.tab:
        return TabView();
      default:
        return null;
    }
  }
}

class OnboardRoute {
  OnboardRoute._();

  static const launch = "/launch";
  static const welcome = "/welcome";
  static const intro = "/intro";
  static const tab = "/tab";
}