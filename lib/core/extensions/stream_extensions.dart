import 'package:flutter_demo/core/utility/error/app_error.dart';

extension StreamExtensions<T> on Stream<T> {
  Stream<T> mapError(AppError error) {
    return handleError((e) => throw error);
  }

  Stream<void> mapToVoid() {
    return map((v) => ());
  }
}

extension BoolStreamExtensions on Stream<bool> {
  Stream<bool> filterTrue() {
    return where((v) => v);
  }

  Stream<bool> filterFalse() {
    return where((v) => !v);
  }
}

extension StringStreamExtensions on Stream<String?> {
  Stream<String> orEmpty() {
    return map((v) => v == null ? "" : (v));
  }
}