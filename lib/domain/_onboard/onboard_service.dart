import 'package:flutter_demo/core/preference/preference.dart';
import 'package:flutter_demo/core/utility/app_state/app_state.dart';
import 'package:flutter_demo/domain/keys/keys.dart';

class OnboardService {
  Preference _preference;

  OnboardService._(this._preference);

  factory OnboardService({required Preference preference}) {
    return OnboardService._(preference);
  }

  Stream<AppState> appState() async* {
    final appStateValue = await _preference.stringValue(Keys.appState);
    yield AppState.fromString(appStateValue);
  }

  Stream<void> changeAppState(AppState state) async* {
    yield await _preference.saveString(Keys.appState, state.value);
  }

}
