import 'package:flutter_demo/core/base/base_view_model.dart';
import 'package:rxdart/rxdart.dart';

class VerifyOTPInput {
  Stream<void> onStart;
  Stream<void> onTapResend;

  VerifyOTPInput({
    required this.onStart,
    required this.onTapResend,
  });
}

class VerifyOTPOutput {
  Stream<String> countDown;
  Stream<bool> didCountDownFinished;
  Stream<void> didVerify;

  VerifyOTPOutput({
    required this.countDown,
    required this.didCountDownFinished,
    required this.didVerify,
  });
}

class VerifyOTPViewModel extends BaseViewModel {
  @override
  void init() {}

  @override
  dispose() {}

  VerifyOTPOutput transform(VerifyOTPInput input) {
    const timeCount = 300;

    final timer = Rx.merge([input.onStart, input.onTapResend])
        .switchMap((_) => Stream<int>.periodic(
                Duration(seconds: 1), (seconds) => timeCount - seconds - 1)
            .startWith(timeCount)
            .where((value) => value >= 0))
        .share();

    final countDown = timer.map(_formatCountDown);

    final countDownFinish = timer.map((value) => value == 0);

    return VerifyOTPOutput(
      countDown: countDown,
      didCountDownFinished: countDownFinish,
      didVerify: Stream.value(()),
    );
  }

  String _formatCountDown(int value) {
    final minutes = (value ~/ 60).toString().padLeft(2, "0");
    final seconds = (value % 60).toString().padLeft(2, "0");
    return "Resend in $minutes:$seconds";
  }
}
