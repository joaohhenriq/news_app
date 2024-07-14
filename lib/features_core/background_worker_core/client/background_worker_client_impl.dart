import 'dart:async';

import 'package:news_app/features_core/background_worker_core/background_worker_core.dart';

class BackgroundWorkerClientImpl implements BackgroundWorkerClient {
  Timer? _timer;

  @override
  void startWorker({
    required Duration duration,
    required void Function() onBackgroundTask,
  }) {
    _timer ??= Timer.periodic(duration, (_) {
      onBackgroundTask();
    });
  }

  @override
  void cancelWorker() {
    _timer?.cancel();
    _timer = null;
  }
}
