import 'package:flutter/material.dart';
import 'package:flutter_demo/app/app_dependency.dart';
import 'package:flutter_demo/core/base/base_view_model.dart';
import 'package:flutter_demo/core/base/base_view_state.dart';
import 'package:flutter_demo/core/coordinator/coordinator.dart';
import 'package:flutter_demo/core/utility/app_state/app_state.dart';
import 'package:flutter_demo/domain/_auth/auth_route.dart';
import 'package:flutter_demo/domain/_onboard/onboard_route.dart';
import 'package:flutter_demo/features/onboard/launch/launch_view_model.dart';
import 'package:flutter_demo/resources/app_text_style.dart';

class LaunchView extends StatefulWidget {
  const LaunchView({super.key});

  @override
  State<LaunchView> createState() => _LaunchViewState();
}

class _LaunchViewState extends BaseViewState<LaunchView> {
  final _viewModel = LaunchViewModel();
  late LaunchOutput _output;

  @override
  BaseViewModel viewModel() => _viewModel;

  @override
  void prepareInput() {
    super.prepareInput();
    final input = LaunchInput(onStart: view.onStart);
    _output = _viewModel.transform(input);
  }

  @override
  void observeOutput() {
    super.observeOutput();
    _output.appState.listen((value) {
      _delayAndRoute(value);
    });
  }

  @override
  Widget contentView(BuildContext context) {
    return Center(
      child: Text(
        "Fluxstore",
        style: AppTextStyle.osB26.black,
      ),
    );
  }

  _delayAndRoute(AppState state) {
    Future.delayed(
      Duration(milliseconds: 1000),
    ).then((_) {
      final route = state == AppState.unLaunched
          ? OnboardRoute.welcome
          : state == AppState.authed
              ? OnboardRoute.tab
              : AuthRoute.login;
      app.coordinator.replacePresent(route);
    });
  }
}
