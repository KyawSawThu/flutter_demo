import 'dart:math';

import 'package:flutter_demo/core/rx/trackers/error_tracker.dart';
import 'package:rxdart/rxdart.dart';

class ActivityTracker {
  final _subject = BehaviorSubject<int>.seeded(0);

  Stream<T> _trackActivity<T>(Stream<T> source) {

    return source
        .doOnListen(() => _sendStartLoading())
        .doOnData((_) => _sendStopLoading())
        .doOnError((p0, p1) => _sendStopLoading());
  }

  void _sendStartLoading() {
    final count = _subject.value + 1;
    _subject.add(count);
  }

  void _sendStopLoading() {
    final count = _subject.value - 1;
    final safeCount = max(count, 0);
    _subject.add(safeCount);
  }

  Stream<bool> asStream() {
    return _subject.skip(1).map((count) => count > 0).distinct();
  }

  void dispose() {
    _subject.close();
  }

}

extension ActivityStreamSubscription<T> on Stream<T> {
  Stream<T> trackActivity(ActivityTracker activityTracker) {
    return activityTracker._trackActivity<T>(this);
  }

  Stream<T> track(ActivityTracker activityTracker, ErrorTracker errorTracker) {
    return activityTracker._trackActivity(this).trackError(errorTracker);
  }
}
