import 'package:flutter_demo/core/network/network_endpoint.dart';

enum AuthEndpoint implements NetworkEndpoint {
  login,
  register,
  verifyOTP,
  forgotPassword,
  changePassword,
  profile,
  updateProfile,
  logout;

  @override
  Endpoint endpoint() {
    switch (this) {
      case AuthEndpoint.login:
        return Get(path: "/auth/login");
      case AuthEndpoint.register:
        return Post(path: "/auth/register");
      case AuthEndpoint.verifyOTP:
        return Post(path: "/auth/verify_otp");
      case AuthEndpoint.forgotPassword:
        return Post(path: "/auth/forgot_password");
      case AuthEndpoint.changePassword:
        return Post(path: "/auth/change_password");
      case AuthEndpoint.profile:
        return Get(path: "/auth/profile");
      case AuthEndpoint.updateProfile:
        return Post(path: "/auth/update_profile");
      case AuthEndpoint.logout:
        return Post(path: "/auth/logout");
    }
  }
}
