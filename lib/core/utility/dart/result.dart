import 'package:flutter_demo/core/utility/error/app_error.dart';

sealed class Result<T> {
  const Result();
}

class Success<T> extends Result<T> {
  final T data;
  const Success({required this.data});
}

class Failure<T> extends Result<T> {
  final AppError error;
  const Failure({required this.error});
}