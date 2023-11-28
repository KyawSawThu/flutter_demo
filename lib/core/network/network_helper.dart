import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter_demo/core/network/network_error.dart';
import 'package:flutter_demo/core/network/network_response.dart';

enum RequestMethod {
  get, post, put, patch, delete;
}

enum AuthType {
  basic, bearer, none;
}

abstract class RequestObject {
  Map<String, dynamic> toJson();
}

extension EncodedRequestObject on RequestObject? {
  String? encodedString() {
    return this == null ? null : jsonEncode(this!.toJson());
  }
}

extension NetworkResponseHelper on Response {
  NetworkResponse asNetworkResponse() {
    return NetworkResponse(
      statusCode: statusCode,
      headers: headers.map,
      data: toString(),
    );
  }
}

extension NetworkErrorHelper on DioException {
  NetworkError asNetworkError() {
    return NetworkError(
      statusCode: response?.statusCode,
      data: response?.toString(),
      message: message,
    );
  }
}

extension DictionaryHelper on Map<String, dynamic> {
  void append(Map<String, dynamic> value) {

  }
}