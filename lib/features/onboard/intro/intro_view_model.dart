import 'package:rxdart/rxdart.dart';
import 'package:flutter_demo/app/app_dependency.dart';
import 'package:flutter_demo/core/base/base_view_model.dart';
import 'package:flutter_demo/core/utility/app_state/app_state.dart';

class IntroInput {
  Stream<void> onTapShoppingNow;

  IntroInput({required this.onTapShoppingNow});
}

class IntroOutput {
  Stream<void> navigateNext;

  IntroOutput({required this.navigateNext});
}

class IntroViewModel extends BaseViewModel {
  IntroOutput transform(IntroInput input) {
    final changeAppState = input.onTapShoppingNow
        .mapTo(AppState.unAuthed)
        .flatMap((appState) => app.onboardService.changeAppState(appState));

    return IntroOutput(navigateNext: changeAppState);
  }
}
