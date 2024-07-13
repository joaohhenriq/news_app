import 'package:news_app/features_core/injection_core/injection_core.dart';

class RegisterFeatureClient {
  RegisterFeatureClient._();

  static RegisterFeatureClient instance = RegisterFeatureClient._();

  void registerFeatures() async {
    for (final feature in appInjectionFeatures) {
      feature.registerDependencies(injector: Injector.I);
    }
  }
}
