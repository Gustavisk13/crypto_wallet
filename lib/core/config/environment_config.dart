class EnvironmentConfig {
  final String apiBaseUrl;

  EnvironmentConfig({
    required this.apiBaseUrl,
  });

  factory EnvironmentConfig.init() {
    const String url = String.fromEnvironment('API_URL', defaultValue: '');
    return EnvironmentConfig(
      apiBaseUrl: url,
    );
  }
}
