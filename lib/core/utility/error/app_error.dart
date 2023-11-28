class AppError implements Exception {
  String code;
  String? title;
  String message;

  AppError({
    required this.code,
    this.title,
    required this.message,
  });

  static AppError get unknownError => AppError(code: "999", message: "Something went wrong!");
  static AppError get decodingError => AppError(code: "0", message: "An error occurs in decoding.");

  factory AppError.dataMissing({required String code}) {
    return AppError(code: code, message: "An error occurs in response. Data missing.");
  }

  factory AppError.error({required String message}) {
    return AppError(code: "", message: message);
  }
}
