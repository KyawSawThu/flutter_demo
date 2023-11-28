class Keys {
  Keys._();

  static const appState = "app_state";
  static const accessToken = "access_token";
  static const refreshToken = "refresh_token";

  static List<String> get keysToFormatOnLogout {
    return [
      Keys.accessToken,
      Keys.refreshToken,
    ];
  }
}
