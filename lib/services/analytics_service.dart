import 'package:firebase_analytics/firebase_analytics.dart';

class AnalyticsService {
  static final FirebaseAnalytics _analytics = FirebaseAnalytics.instance;

  static Future<void> logEvent(
    String name,
    Map<String, dynamic>? params,
  ) async {
    //await _analytics.logEvent(name: name, parameters: params);
  }

  // События игры
  static Future<void> logTap(int tapCount) async {
    await logEvent('tap', {'count': tapCount});
  }

  static Future<void> logGeneratorPurchased(
    String generatorId,
    int level,
  ) async {
    await logEvent('generator_purchased', {
      'generator_id': generatorId,
      'level': level,
    });
  }

  static Future<void> logUpgradePurchased(String upgradeId) async {
    await logEvent('upgrade_purchased', {'upgrade_id': upgradeId});
  }

  static Future<void> logAdWatched(String adType) async {
    await logEvent('ad_watched', {'ad_type': adType});
  }
}
