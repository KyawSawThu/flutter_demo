import 'package:flutter/cupertino.dart';
import 'package:flutter_demo/app/app_config.dart';
import 'package:flutter_demo/core/coordinator/coordinator.dart';
import 'package:flutter_demo/core/network/network_config.dart';
import 'package:flutter_demo/core/network/network_service.dart';
import 'package:flutter_demo/core/preference/preference.dart';
import 'package:flutter_demo/domain/_auth/auth_route.dart';
import 'package:flutter_demo/domain/_auth/auth_service.dart';
import 'package:flutter_demo/domain/_onboard/onboard_route.dart';
import 'package:flutter_demo/domain/_onboard/onboard_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

late AppDependency app;

class AppDependency {
  final AppConfig config;
  final Coordinator coordinator;
  final OnboardService onboardService;
  final AuthService authService;

  const AppDependency._({
    required this.config,
    required this.coordinator,
    required this.onboardService,
    required this.authService,
  });

  factory AppDependency(AppConfig config) {
    // Coordinator
    final navigatorKey = GlobalKey<NavigatorState>();
    final providers = [OnboardRouteProvider(), AuthRouteProvider()];
    final coordinator = Coordinator(navigatorKey: navigatorKey, providers: providers);

    // Preference
    final identifier = config.identifier;
    final prefs = SharedPreferences.getInstance();
    final preference = Preference(identifier: identifier, prefs: prefs);

    // Network
    final networkConfig = NetworkConfig(baseUrl: config.baseUrl, mockPath: config.mockPath, timeOut: 60);
    final networkService = NetworkService(config: networkConfig);

    // Auth
    final onboardService = OnboardService(preference: preference);
    final authService = AuthService(preference: preference, network: networkService);

    return AppDependency._(
      config: config,
      coordinator: coordinator,
      onboardService: onboardService,
      authService: authService,
    );
  }
}
