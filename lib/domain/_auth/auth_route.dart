import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_demo/core/coordinator/route_provider.dart';
import 'package:flutter_demo/features/auth/forgot_password/forgot_password_view.dart';
import 'package:flutter_demo/features/auth/login/login_view.dart';
import 'package:flutter_demo/features/auth/new_password/new_password_view.dart';
import 'package:flutter_demo/features/auth/register/register_view.dart';
import 'package:flutter_demo/features/auth/verify_otp/verify_otp_view.dart';

class AuthRouteProvider implements RouteProvider {
  @override
  Widget? view(RouteSettings settings) {
    final route = settings.name;
    final arguments = settings.arguments;
    switch (route) {
      case AuthRoute.login:
        return const LoginView();
      case AuthRoute.register:
        return RegisterView();
      case AuthRoute.forgotPassword:
        return ForgotPasswordView();
      case AuthRoute.verifyOTP:
        return VerifyOTPView();
      case AuthRoute.newPassword:
        return NewPasswordView();
      default:
        return null;
    }
  }
}

class AuthRoute {
  AuthRoute._();
  static const login = "/login";
  static const register ="/register";
  static const forgotPassword = "/forgot_password";
  static const verifyOTP = "/verify_otp";
  static const newPassword = "/new_password";
}
