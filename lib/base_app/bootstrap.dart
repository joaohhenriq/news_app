import 'package:news_app/base_app/injection/injection.dart';
import 'package:news_app/features_core/background_worker_core/background_worker_core.dart';
import 'package:news_app/features_core/stream_service_core/articles_stream/articles_stream.dart';

class Bootstrap {
  static void start() async {
    _loadInjection();
    _startBackgroundWorker();
  }

  static void _loadInjection() async {
    try {
      RegisterFeatureClient.instance.registerFeatures();
    } catch (error) {
      Exception('Error loading injection: $error');
    }
  }

  static void _startBackgroundWorker() {
    final worker = Injector.I.get<BackgroundWorkerClient>();
    worker.startWorker(
      duration: const Duration(seconds: 1),
      onBackgroundTask: () {
        final articleStreamService = Injector.I.get<ArticleStreamService>();
        articleStreamService.updateArticles([]);
      },
    );
  }
}
