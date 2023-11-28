import 'app.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_demo/app/app_config.dart';
import 'package:flutter_demo/app/app_dependency.dart';
import 'package:flutter_demo/core_ui/activity/activity_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  app = AppDependency(AppConfig.development);
  runApp(const App());
  ActivityView.configLoading();
}