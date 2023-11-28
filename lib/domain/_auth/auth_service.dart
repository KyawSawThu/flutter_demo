import 'package:flutter_demo/core/preference/preference.dart';
import 'package:flutter_demo/domain/requests/auth/login_request.dart';
import 'package:flutter_demo/core/network/network_service.dart';
import 'package:flutter_demo/domain/_auth/auth_endpoint.dart';
import 'package:flutter_demo/domain/api/api.dart';
import 'package:flutter_demo/domain/objects/user_data.dart';

class AuthService {
  Preference _preference;
  NetworkService _network;

  AuthService._(this._preference, this._network);

  factory AuthService({required Preference preference, required NetworkService network}) {
    return AuthService._(preference, network);
  }

  Stream<UserData> login(LoginRequest request) async* {
    yield await _network.requestBase(
      endpoint: AuthEndpoint.login,
      fromJson: UserData.fromJson,
    );
  }

}
