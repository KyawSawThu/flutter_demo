import 'package:flutter_demo/core/network/network_helper.dart';

abstract class NetworkEndpoint {
  Endpoint endpoint();
}

abstract class Endpoint {
  String path();
  RequestMethod method();
  AuthType auth();
  bool mock();
}

/// GET ///
class Get implements Endpoint {
  String _path;
  AuthType _auth;
  bool _mock;

  Get._(this._path, this._auth, this._mock);

  factory Get({required String path, AuthType auth = AuthType.none, bool mock = false}) {
    return Get._(path, auth, mock);
  }

  @override
  String path() => _path;

  @override
  RequestMethod method() => RequestMethod.get;

  @override
  AuthType auth() => _auth;

  @override
  bool mock() {
    return _mock;
  }
}

/// POST ///
class Post implements Endpoint {
  String _path;
  AuthType _auth;
  bool _mock;

  Post._(this._path, this._auth, this._mock);

  factory Post({required String path, AuthType auth = AuthType.none, bool mock = false}) {
    return Post._(path, auth, mock);
  }

  @override
  String path() => _path;

  @override
  RequestMethod method() => RequestMethod.post;

  @override
  AuthType auth() => _auth;

  @override
  bool mock() {
    return _mock;
  }
}

/// PUT ///
class Put implements Endpoint {
  String _path;
  AuthType _auth;
  bool _mock;

  Put._(this._path, this._auth, this._mock);

  factory Put({required String path, AuthType auth = AuthType.none, bool mock = false}) {
    return Put._(path, auth, mock);
  }

  @override
  String path() => _path;

  @override
  RequestMethod method() => RequestMethod.put;

  @override
  AuthType auth() => _auth;

  @override
  bool mock() {
    return _mock;
  }
}

/// PATCH ///
class Patch implements Endpoint {
  String _path;
  AuthType _auth;
  bool _mock;

  Patch._(this._path, this._auth, this._mock);

  factory Patch({required String path, AuthType auth = AuthType.none, bool mock = false}) {
    return Patch._(path, auth, mock);
  }

  @override
  String path() => _path;

  @override
  RequestMethod method() => RequestMethod.patch;

  @override
  AuthType auth() => _auth;

  @override
  bool mock() {
    return _mock;
  }
}

/// DELETE ///
class Delete implements Endpoint {
  String _path;
  AuthType _auth;
  bool _mock;

  Delete._(this._path, this._auth, this._mock);

  factory Delete({required String path, AuthType auth = AuthType.none, bool mock = false}) {
    return Delete._(path, auth, mock);
  }

  @override
  String path() => _path;

  @override
  RequestMethod method() => RequestMethod.delete;

  @override
  AuthType auth() => _auth;

  @override
  bool mock() {
    return _mock;
  }
}