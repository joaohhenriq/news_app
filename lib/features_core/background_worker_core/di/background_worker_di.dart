import 'package:news_app/base_app/injection/injection.dart';
import 'package:news_app/features_core/background_worker_core/background_worker_core.dart';

class BackgroundWorkerDI implements RegisterInjectionClient {
  @override
  void registerDependencies({required InjectionClient injector}) {
    injector.registerSingleton<BackgroundWorkerClient>(
        BackgroundWorkerClientImpl());
  }
}
