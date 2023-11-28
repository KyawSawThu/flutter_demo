import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

typedef ActivityViewBuilder = Widget Function(BuildContext, Widget?);
class ActivityView {
  static ActivityViewBuilder initLoading() {
    return EasyLoading.init();
  }
  static configLoading() {
    EasyLoading.instance
      ..radius = 8.0
      ..indicatorSize = 24.0
      ..dismissOnTap = false
      ..userInteractions = true
      ..maskType = EasyLoadingMaskType.black
      ..indicatorType = EasyLoadingIndicatorType.chasingDots
      ..displayDuration = const Duration(milliseconds: 2000);
  }

  static void handleLoading(bool loading) {
    print("loading: $loading");
    if (loading) {
      EasyLoading.show();
    } else {
      EasyLoading.dismiss();
    }
  }
}

