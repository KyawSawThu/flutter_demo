enum AppConfig {
  development,
  production;

  String get identifier {
    switch (this) {
      case AppConfig.development:
        return "flutter_demo_development";
      case AppConfig.production:
        return "flutter_demo_production";
    }
  }

  String get mockPath {
    switch (this) {
      case AppConfig.development:
        return "resources/mock";
      case AppConfig.production:
        return "resources/mock";
    }
  }

  String get baseUrl {
    switch (this) {
      case AppConfig.development:
        return "https://development.com";
      case AppConfig.production:
        return "https://production.com";
    }
  }

}