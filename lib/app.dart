import 'package:flutter/material.dart';
import 'package:flutter_demo/app/app_dependency.dart';
import 'package:flutter_demo/app/app_config.dart';
import 'package:flutter_demo/core_ui/activity/activity_view.dart';
import 'package:flutter_demo/features/onboard/launch/launch_view.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        _dismissKeyboard(currentFocus);
      },
      child: _app(),
    );
  }

  Widget _app() {
    return MaterialApp(
      navigatorKey: app.coordinator.navigatorKey,
      debugShowCheckedModeBanner: app.config == AppConfig.development,
      home: LaunchView(),
      builder: ActivityView.initLoading(),
    );
  }

  void _dismissKeyboard(FocusScopeNode focus) {
    if (!focus.hasPrimaryFocus &&
        focus.focusedChild != null) {
      FocusManager.instance.primaryFocus?.unfocus();
    }
  }
}
