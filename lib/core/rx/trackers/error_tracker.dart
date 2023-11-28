import 'package:flutter_demo/core/utility/error/app_error.dart';
import 'package:rxdart/rxdart.dart';

class ErrorTracker {
  final _subject = PublishSubject<AppError>();
  Stream<T> _trackError<T>(Stream<T> source) {
    return source
        .doOnError((p0, p1) => _onError(p0 as AppError, p1))
        .doOnCancel(() => _onCancel)
        .doOnDone(() {})
        .onErrorResumeNext(const Stream.empty());
  }

  void _onError(AppError error, StackTrace track) {
    _subject.add(error);
  }

  Stream<AppError> asStream() {
    return _subject;
  }

  void _onCancel() {
    _subject.close();
  }

  void dispose() {
    _subject.close();
  }
}

extension ErrorStreamSubscription<T> on Stream<T> {
  Stream<T> trackError(ErrorTracker errorTracker) {
    return errorTracker._trackError<T>(this);
  }
}
