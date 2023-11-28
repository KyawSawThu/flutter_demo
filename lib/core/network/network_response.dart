class NetworkResponse {
  int? statusCode;
  Map<String, dynamic>? headers;
  String? data;

  NetworkResponse({
    this.statusCode,
    this.headers,
    this.data,
  });
}
