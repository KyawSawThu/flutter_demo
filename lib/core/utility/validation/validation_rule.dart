abstract class ValidationRule {
  bool check();
}

class EmptyRule implements ValidationRule {
  String? value;
  EmptyRule({this.value});

  @override
  bool check() {
    if (value?.isEmpty ?? true) {
      return false;
    } else {
      return true;
    }
  }
}

class EmailRule implements ValidationRule {
  String? email;
  EmailRule({this.email});

  @override
  bool check() {
    if (email?.isEmpty ?? true) {
      return false;
    } else {
      return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email!);
    }
  }
}

class PasswordLengthRule implements ValidationRule {
  String? password;
  PasswordLengthRule({this.password});

  @override
  bool check() {
    if (password?.isEmpty ?? true) {
      return false;
    } else {
      return RegExp(r'^.{8,}$').hasMatch(password!);
    }
  }
}

class PasswordCapitalizeRule implements ValidationRule {
  String? password;
  PasswordCapitalizeRule({this.password});

  @override
  bool check() {
    if (password?.isEmpty ?? true) {
      return false;
    } else {
      return RegExp(r'^[A-Z]').hasMatch(password!);
    }
  }
}

class PasswordNumberRule implements ValidationRule {
  String? password;
  PasswordNumberRule({this.password});

  @override
  bool check() {
    if (password?.isEmpty ?? true) {
      return false;
    } else {
      return RegExp(r'[0-9]').hasMatch(password!);
    }
  }
}