class LoginForm {
  String email;
  String password;

  LoginForm({
    required this.email,
    required this.password,
  });
}

enum LoginFormField {
  email,
  password;
}

class LoginFormError {
  final LoginFormField field;
  final String error;

  LoginFormError.emptyEmail()
      : field = LoginFormField.email,
        error = "Email address cannot be empty.";

  LoginFormError.invalidEmail()
      : field = LoginFormField.email,
        error = "Invalid email address.";

  LoginFormError.emptyPassword()
      : field = LoginFormField.password,
        error = "Password cannot be empty.";

  LoginFormError.invalidCapitalizePassword()
      : field = LoginFormField.password,
        error = "Password must start with capital letter.";

  LoginFormError.invalidNumberPassword()
      : field = LoginFormField.password,
        error = "Password must contain at least one number.";
}

extension LoginFormErrorExt on List<LoginFormError> {
  String? error(LoginFormField field) {
    return where((e) => e.field == field).firstOrNull?.error;
  }
}
