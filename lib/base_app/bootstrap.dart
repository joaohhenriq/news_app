import 'package:news_app/base_app/injection/injection.dart';

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