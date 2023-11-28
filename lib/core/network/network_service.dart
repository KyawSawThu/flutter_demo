import 'package:dio/dio.dart';
import 'package:flutter_demo/core/network/network_config.dart';
import 'package:flutter_demo/core/network/network_endpoint.dart';
import 'package:flutter_demo/core/network/network_error.dart';
import 'package:flutter_demo/core/network/network_helper.dart';
import 'package:flutter_demo/core/network/network_mock_interceptor.dart';
import 'package:flutter_demo/core/network/network_response.dart';

class NetworkService {
  final Dio _dio;
  final NetworkMockInterceptor _mock;

  const NetworkService._(this._dio, this._mock);

  factory NetworkService({required NetworkConfig config}) {
    final mockInterceptor = NetworkMockInterceptor(path: config.mockPath);
    final logInterceptor = LogInterceptor(
      request: true,
      requestHeader: true,
      requestBody: true,
      responseBody: true,
    );

    final dio = Dio();
    dio
      ..options.baseUrl = config.baseUrl
      ..options.connectTimeout = Duration(seconds: config.timeOut)
      ..options.receiveTimeout = Duration(seconds: config.timeOut)
      ..options.headers = config.headers
      ..interceptors.add(mockInterceptor);
    if (config.enableLog) {
      dio.interceptors.add(logInterceptor);
    }
    return NetworkService._(dio, mockInterceptor);
  }

  Future<NetworkResponse> request({
    required NetworkEndpoint endpoint,
    RequestObject? body,
    Map<String, dynamic>? parameters,
    Map<String, dynamic>? headers,
  }) async {
    final path = endpoint.endpoint().path();
    final method = endpoint.endpoint().method();
    final mocked = endpoint.endpoint().mock();

    /*
    if (mocked) {
      _dio.interceptors.add(_mock);
    } else {
      _dio.interceptors.removeWhere((e) => e == _mock);
    }
     */

    try {
      Response response;
      switch (method) {
        case RequestMethod.get:
          response = await _get(path,
              body: body, parameters: parameters, headers: headers);
        case RequestMethod.post:
          response = await _post(path,
              body: body, parameters: parameters, headers: headers);
        case RequestMethod.put:
          response = await _put(path,
              body: body, parameters: parameters, headers: headers);
        case RequestMethod.patch:
          response = await _patch(path,
              body: body, parameters: parameters, headers: headers);
        case RequestMethod.delete:
          response = await _delete(path,
              body: body, parameters: parameters, headers: headers);
      }
      return response.asNetworkResponse();
    } on DioException catch (error) {
      throw error.asNetworkError();
    } catch (error) {
      throw NetworkError(message: error.toString());
    }
  }

  Future<Response> _get(
    String path, {
    RequestObject? body,
    Map<String, dynamic>? parameters,
    Map<String, dynamic>? headers,
  }) async {
    Response response = await _dio.get(path,
        data: body?.encodedString(), queryParameters: parameters);
    return response;
  }

  Future<Response> _post(
    String path, {
    RequestObject? body,
    Map<String, dynamic>? parameters,
    Map<String, dynamic>? headers,
  }) async {
    Response response = await _dio.post(
      path,
      data: body?.encodedString(),
      queryParameters: parameters,
      options: Options(headers: headers),
    );
    return response;
  }

  Future<Response> _put(
    String path, {
    RequestObject? body,
    Map<String, dynamic>? parameters,
    Map<String, dynamic>? headers,
  }) async {
    Response response = await _dio.put(
      path,
      data: body?.encodedString(),
      queryParameters: parameters,
      options: Options(headers: headers),
    );
    return response;
  }

  Future<Response> _patch(
    String path, {
    RequestObject? body,
    Map<String, dynamic>? parameters,
    Map<String, dynamic>? headers,
  }) async {
    Response response = await _dio.patch(
      path,
      data: body?.encodedString(),
      queryParameters: parameters,
      options: Options(headers: headers),
    );
    return response;
  }

  Future<Response> _delete(
    String path, {
    RequestObject? body,
    Map<String, dynamic>? parameters,
    Map<String, dynamic>? headers,
  }) async {
    Response response = await _dio.delete(
      path,
      data: body?.encodedString(),
      queryParameters: parameters,
      options: Options(headers: headers),
    );
    return response;
  }
}
