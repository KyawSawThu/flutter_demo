import 'dart:convert';

import 'package:flutter_demo/core/network/network_endpoint.dart';
import 'package:flutter_demo/core/network/network_error.dart';
import 'package:flutter_demo/core/network/network_helper.dart';
import 'package:flutter_demo/core/network/network_response.dart';
import 'package:flutter_demo/core/network/network_service.dart';
import 'package:flutter_demo/core/utility/dart/dictionary.dart';
import 'package:flutter_demo/core/utility/error/app_error.dart';
import 'package:flutter_demo/core/utility/dart/result.dart';
import 'package:flutter_demo/domain/responses/base/base_response.dart';
import 'package:flutter_demo/domain/responses/error/error_response.dart';

extension NetworkRequest on NetworkService {
  Future<T> requestBase<T>({
    required NetworkEndpoint endpoint,
    RequestObject? body,
    Dictionary? parameters,
    Dictionary? headers,
    T Function(Dictionary)? fromJson,
    T Function(List<dynamic>)? fromListJson,
  }) async {
    try {
      NetworkResponse response = await request(endpoint: endpoint, body: body, parameters: parameters, headers: headers);
      print("response: ${response.data}");
      Dictionary json = jsonDecode(response.data ?? "");
      BaseResponse<T> baseResponse = BaseResponse.fromJson(json, fromJson, fromListJson);
      return baseResponse.validate();
    } on NetworkError catch (error) {
      Dictionary json = jsonDecode(error.data ?? "");
      ErrorResponse errorResponse = ErrorResponse.fromJson(json);
      throw errorResponse.asAppError();
    } on FormatException catch (_) {
      throw AppError.decodingError;
    } on AppError catch (_) {
      rethrow;
    } catch (error) {
      print(error.toString());
      throw AppError.unknownError;
    }
  }

  Future<Result<T>> result<T>({
    required NetworkEndpoint endpoint,
    RequestObject? body,
    Dictionary? parameters,
    Dictionary? headers,
    required T Function(Dictionary) fromJson,
  }) async {
    try {
      final data = await requestBase(endpoint: endpoint, body: body, parameters: parameters, headers: headers, fromJson: fromJson);
      return Success(data: data);
    } on AppError catch (error) {
      return Failure(error: error);
    }
  }
}