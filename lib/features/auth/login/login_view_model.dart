import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'package:flutter_demo/app/app_dependency.dart';
import 'package:flutter_demo/core/utility/validation/validation.dart';
import 'package:flutter_demo/core/utility/validation/validation_result.dart';
import 'package:flutter_demo/core/utility/validation/validation_rule.dart';
import 'package:flutter_demo/features/auth/login/login_form.dart';
import 'package:flutter_demo/core/rx/trackers/activity_tracker.dart';
import 'package:flutter_demo/core/base/base_view_model.dart';
import 'package:flutter_demo/domain/requests/auth/login_request.dart';

class LoginInput {
  Stream<void> didTapLogin;
  Stream<LoginForm> form;

  LoginInput({
    required this.didTapLogin,
    required this.form,
  });
}

class LoginOutput {
  Stream<bool> isValidForm;
  Stream<List<LoginFormError>?> formError;
  Stream<void> success;

  LoginOutput({
    required this.isValidForm,
    required this.formError,
    required this.success,
  });
}

class LoginViewModel extends BaseViewModel {
  @override
  void init() {}

  @override
  dispose() {}

  LoginOutput transform(LoginInput input) {
    final validation = input.didTapLogin
        .withLatestFrom(input.form, (_, form) => form)
        .map(_validate)
        .share();

    final isValidForm = validation.map((e) => e.value != null);

    final formError = validation.map((e) => e.error);

    final login = validation
        .mapNotNull((e) => e.value)
        .map(_toLoginRequest)
        .flatMap((req) => app.authService.login(req).track(loading, error));

    return LoginOutput(
      isValidForm: isValidForm,
      formError: formError,
      success: login,
    );
  }

  LoginRequest _toLoginRequest(LoginForm form) {
    return LoginRequest(
      email: form.email,
      password: form.password,
    );
  }

  ValidationResult<LoginForm, List<LoginFormError>> _validate(LoginForm form) {
    List<ValidationResult> validation = [];

    final emailValidation = Validation(value: form.email)
        .apply(
          (e) => EmptyRule(value: e).check(),
          LoginFormError.emptyEmail(),
        )
        .apply(
          (e) => EmailRule(email: e).check(),
          LoginFormError.invalidEmail(),
        );

    final passwordValidation = Validation(value: form.password)
        .apply(
          (e) => PasswordLengthRule(password: e).check(),
          LoginFormError.emptyPassword(),
        )
        .apply(
          (e) => PasswordCapitalizeRule(password: e).check(),
          LoginFormError.invalidCapitalizePassword(),
        )
        .apply(
          (e) => PasswordNumberRule(password: e).check(),
          LoginFormError.invalidNumberPassword(),
        );

    validation.addAll([emailValidation, passwordValidation]);
    return validation.validate<LoginForm, LoginFormError>(form);
  }
}
