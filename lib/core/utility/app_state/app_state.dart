enum AppState {
  unLaunched._("un_launched"), // app is in first time launch
  unAuthed._("un_authed"), // app is not login
  authed._("authed"); // app is login

  final String value;
  const AppState._(this.value);

  static AppState fromString(String? value) {
    if (value == AppState.unAuthed.value) {
      return AppState.unAuthed;
    } else if (value == AppState.authed.value) {
      return AppState.authed;
    } else {
      return AppState.unLaunched;
    }
  }
}