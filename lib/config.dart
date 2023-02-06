class Environments {
  static const String PRODUCTION = 'prod';
}

class ConfigEnvironments {
  static const String apiUrl = 'https://hajjmanagment.online/';
  static const int productPaginationLimit = 10;

  static const String currentEnvironments = Environments.PRODUCTION;

  static final List<Map<String, String>> _availableEnvironments = [
    {
      'env': Environments.PRODUCTION,
      'url': apiUrl,
    },
  ];

  static Map<String, String> getEnvironments() {
    return _availableEnvironments.firstWhere(
      (d) => d['env'] == currentEnvironments,
      orElse: () => _availableEnvironments[1],
    );
  }
}
