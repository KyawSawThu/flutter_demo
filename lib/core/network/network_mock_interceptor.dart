import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/services.dart';

class NetworkMockInterceptor extends Interceptor {
  final String path;
  final String _fileType = ".json";

  const NetworkMockInterceptor({required this.path});

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final resourcePath = "$path${options.path}_mock$_fileType";
    final jsonData = await rootBundle.load(resourcePath);

    final unit8 = jsonData.buffer.asUint8List(jsonData.offsetInBytes, jsonData.lengthInBytes);
    final decodedUtf8 = utf8.decode(unit8);
    final data = jsonDecode(decodedUtf8);

    final response = Response(
      requestOptions: options,
      statusCode: 200,
      data: data,
    );

    await Future.delayed(Duration(seconds: 2));

    handler.resolve(response);
  }
}
