import 'package:news_app/features_core/injection_core/client/client.dart';
import 'package:news_app/features_core/local_storage_core/local_storage_core.dart';

class SharedPreferencesDI implements RegisterInjectionClient {
  @override
  void registerDependencies({required InjectionClient injector}) {
    injector.registerFactory<SharedPreferencesClient>(
      () => SharedPreferencesClientImpl(),
    );
  }
}
