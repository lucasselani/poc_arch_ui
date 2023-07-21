abstract class Analytics {
  static late final Analytics instance;

  void logEvent({required String name});
  void logScreen({required String name});
}

class AnalyticsImpl implements Analytics {
  @override
  void logEvent({required String name}) => print('event: $name');

  @override
  void logScreen({required String name}) => print('screen: $name');
}
