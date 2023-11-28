import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/core/coordinator/route_provider.dart';

class Coordinator {
  final GlobalKey<NavigatorState> navigatorKey;
  final List<RouteProvider> providers;

  Coordinator({
    required this.navigatorKey,
    required this.providers,
  });

  BuildContext get _currentContext => navigatorKey.currentContext!;

  Widget _viewFactory(RouteSettings settings) {
    final provider = providers
        .where((provider) => provider.view(settings) != null)
        .toList()
        .firstOrNull;
    return provider?.view(settings) ?? Container(color: Colors.red);
  }

  PageRoute _generatePageRoute(
    String route, {
    Object? arguments,
    bool modalPresent = false,
  }) {
    final routeSettings = RouteSettings(name: route, arguments: arguments);
    return CupertinoPageRoute(
      fullscreenDialog: modalPresent,
      settings: routeSettings,
      builder: (context) => _viewFactory(routeSettings),
    );
  }

}

extension CoordinatorPresent on Coordinator {
  present(String route, {Object? arguments}) async {
    final pageRoute = _generatePageRoute(route, arguments: arguments, modalPresent: true);
    return await Navigator.push(_currentContext, pageRoute);
  }

  replacePresent(String route, {Object? arguments}) async {
    final pageRoute = _generatePageRoute(route, arguments: arguments, modalPresent: true);
    return await Navigator.pushReplacement(_currentContext, pageRoute);
  }

  removePresent(String route, {Object? arguments, required List<String> routes}) async {
    final pageRoute = _generatePageRoute(route, arguments: arguments, modalPresent: true);
    return await Navigator.pushAndRemoveUntil(_currentContext, pageRoute, (r) => !routes.contains(r.settings.name));
  }
}

extension CoordinatorPush on Coordinator {
  push(String route, {Object? arguments}) async {
    final pageRoute = _generatePageRoute(route, arguments: arguments);
    return await Navigator.push(_currentContext, pageRoute);
  }

  replacePush(String route, {Object? arguments}) async {
    final pageRoute = _generatePageRoute(route, arguments: arguments);
    return await Navigator.pushReplacement(_currentContext, pageRoute);
  }

  removePush(String route, {Object? arguments, required List<String> routes}) async {
    final pageRoute = _generatePageRoute(route, arguments: arguments);
    return await Navigator.pushAndRemoveUntil(_currentContext, pageRoute, (r) => !routes.contains(r.settings.name));
  }
}

extension CoordinatorDismiss on Coordinator {
  dismiss({Object? arguments}) {
    Navigator.of(_currentContext).pop(arguments);
  }

  popUntil(String route, {Object? arguments}) {
    Navigator.of(_currentContext).popUntil(ModalRoute.withName(route));
  }
}
