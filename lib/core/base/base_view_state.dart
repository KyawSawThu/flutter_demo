import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/core/base/base_view.dart';
import 'package:flutter_demo/core/base/base_view_model.dart';
import 'package:flutter_demo/core/extensions/class_extensions.dart';
import 'package:flutter_demo/core/rx/view_event.dart';
import 'package:flutter_demo/core_ui/activity/activity_view.dart';
import 'package:flutter_demo/core_ui/alert_dialog/app_alert_dialog.dart';
import 'package:visibility_aware_state/visibility_aware_state.dart';

abstract class BaseViewState<T extends StatefulWidget>
    extends VisibilityAwareState<T> {
  BaseViewModel viewModel();

  ViewConfig viewConfig() => ViewConfig();

  Widget navigationView() => Container();

  Widget contentView(BuildContext context);

  bool _started = false;

  ViewEvent view = ViewEvent();

  late Size size;

  @mustCallSuper
  @override
  void initState() {
    super.initState();
    prepareInput();
    observeOutput();
  }

  @protected
  void prepareInput() {}

  @mustCallSuper
  @protected
  void observeOutput() {
    viewModel().loading.asStream().listen((loading) {
      ActivityView.handleLoading(loading);
    });
    viewModel().error.asStream().listen((error) {
      showAlert(title: error.title ?? "", message: error.message);
    });
  }

  @mustCallSuper
  @override
  void dispose() {
    view.dispose();
    viewModel().dispose();
    super.dispose();
  }

  void _onStartOrOnResume() {
    if (!_started) {
      onStart();
      _started = true;
    }
    onResume();
  }

  @protected
  void onStart() {
    view.emitOnStart();
    print("[$className] onStart.");
  }

  @protected
  void onResume() {
    view.emitOnResume();
    print("[$className] onResume.");
  }

  @protected
  void onPause() {
    view.emitOnPause();
    print("[$className] onPause.");
  }

  @protected
  void onDestroy() {
    view.emitOnDestroy();
    print("[$className] onDestroy.");
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return BaseView(
      viewConfig: viewConfig(),
      viewModel: viewModel(),
      navigationView: navigationView(),
      contentView: contentView(context),
    );
  }

  @override
  void onVisibilityChanged(WidgetVisibility visibility) {
    switch (visibility) {
      case WidgetVisibility.VISIBLE:
        // Like Android's Activity.onResume()
        _onStartOrOnResume();
        break;
      case WidgetVisibility.INVISIBLE:
        // Like Android's Activity.onPause()
        onPause();
        break;
      case WidgetVisibility.GONE:
        // Like Android's Activity.onDestroy()
        onDestroy();
        break;
    }
    super.onVisibilityChanged(visibility);
  }
}
