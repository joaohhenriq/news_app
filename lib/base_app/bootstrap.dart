import 'dart:math';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:news_app/base_app/injection/injection.dart';
import 'package:news_app/features_core/background_worker_core/background_worker_core.dart';
import 'package:news_app/features_core/stream_service_core/articles_stream/articles_stream.dart';
import 'package:news_app/util/config.dart';

class Bootstrap {
  static Future<void> start() async {
    await _loadEnvironmentConfigs();
    _loadInjection();
    _startBackgroundWorker();
  }

  static Future<void> _loadEnvironmentConfigs() async {
    await dotenv.load(fileName: '.env');
  }

  static void _loadInjection() {
    try {
      RegisterFeatureClient.instance.registerFeatures();
    } catch (error) {
      Exception('Error loading injection: $error');
    }
  }

  static void _startBackgroundWorker() {
    final worker = Injector.I.get<BackgroundWorkerClient>();
    final backgroundIntervalSeconds = Config.backgroundFetchInterval >= 300
        ? Config.backgroundFetchInterval
        : 300;
    worker.startWorker(
      duration: Duration(seconds: backgroundIntervalSeconds),
      onBackgroundTask: () {
        final articleStreamService = Injector.I.get<ArticleStreamService>();
        articleStreamService
            .updateArticles([Random().nextInt(1000).toString()]);
      },
    );
  }
}
