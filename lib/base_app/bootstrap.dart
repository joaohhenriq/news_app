import 'package:news_app/features_core/injection_core/injection_core.dart';

class Bootstrap {
  static void start() async {
    _loadInjection();
  }

  static void _loadInjection() async {
    try {
      RegisterFeatureClient.instance.registerFeatures();
    } catch (error) {
      Exception('Error loading injection: $error');
    }
  }
}