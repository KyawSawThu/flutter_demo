import 'package:flutter_demo/core/rx/trackers/activity_tracker.dart';
import 'package:flutter_demo/core/rx/trackers/error_tracker.dart';

class BaseViewModel {
  final loading = ActivityTracker();
  final error = ErrorTracker();
  void init() {}
  void dispose() {
    loading.dispose();
    error.dispose();
  }
}