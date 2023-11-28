import 'package:flutter_demo/core/utility/error/app_error.dart';
import 'package:flutter_demo/core/utility/dart/dictionary.dart';

class ErrorResponse {
  String errorCode;
  String errorMessage;

  ErrorResponse({
    required this.errorCode,
    required this.errorMessage,
  });

  factory ErrorResponse.fromJson(Dictionary json) {
    return ErrorResponse(
      errorCode: json["errorCode"],
      errorMessage: json["errorMessage"],
    );
  }
}

extension ErrorResponseHelper on ErrorResponse {
  AppError asAppError() {
    return AppError(code: errorCode, message: errorMessage);
  }
}