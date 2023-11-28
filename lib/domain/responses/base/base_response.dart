import 'package:flutter_demo/core/utility/dart/dictionary.dart';
import 'package:flutter_demo/core/utility/error/app_error.dart';

class BaseResponse<T> {
  String code;
  String message;
  T? data;

  BaseResponse._({
    required this.code,
    required this.message,
    required this.data,
  });

  factory BaseResponse.fromJson(
    Dictionary json,
    T Function(Dictionary)? fromJson,
    T Function(List<dynamic>)? fromListJson,
  ) {
    if (fromJson != null) {
      return BaseResponse._(
        code: json["code"],
        message: json["message"],
        data: json["data"] == null ? null : fromJson(json["data"]),
      );
    } else if (fromListJson != null) {
      return BaseResponse._(
        code: json["code"],
        message: json["message"],
        data: json["data"] == null ? null : fromListJson(json["data"] as List<dynamic>),
      );
    } else {
      return BaseResponse._(
        code: json["code"],
        message: json["message"],
        data: null,
      );
    }
  }

  T validate() {
    if (code == "0") {
      if (data == null) {
        throw AppError.dataMissing(code: code);
      } else {
        return data!;
      }
    } else {
      throw AppError(code: code, message: message);
    }
  }
}
