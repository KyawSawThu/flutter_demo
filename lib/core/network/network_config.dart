class NetworkConfig {
  String baseUrl;
  String mockPath;
  int timeOut;
  bool enableLog;
  Map<String, dynamic>? headers;

  NetworkConfig({
    required this.baseUrl,
    required this.mockPath,
    required this.timeOut,
    this.enableLog = false,
  }) : headers = NetworkConfig.defaultHeader;

  static Map<String, dynamic> get defaultHeader {
    return {
      "Accept": "application/json",
      "Content-Type": "application/json; charset=utf-8",
    };
  }
}
