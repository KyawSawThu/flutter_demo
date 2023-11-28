import 'package:flutter_demo/app/app_dependency.dart';
import 'package:flutter_demo/core/base/base_view_model.dart';
import 'package:flutter_demo/core/utility/app_state/app_state.dart';
import 'package:rxdart/rxdart.dart';

class LaunchInput {
  Stream<void> onStart;

  LaunchInput({required this.onStart});
}

class LaunchOutput {
  Stream<AppState> appState;

  LaunchOutput({required this.appState});
}

class LaunchViewModel extends BaseViewModel {
  LaunchOutput transform(LaunchInput input) {
    final appState = input.onStart
        .flatMap((_) => app.onboardService.appState());
        // .mapTo(AppState.authed);

    return LaunchOutput(appState: appState);
  }
}
