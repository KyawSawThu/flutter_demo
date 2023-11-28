class NetworkError implements Exception {
  int? statusCode;
  String? data;
  String? message;

  NetworkError({
    this.statusCode,
    this.data,
    this.message,
  });

  static NetworkError get unknown => NetworkError(message: "Server Error: Something went wrong!");
}
