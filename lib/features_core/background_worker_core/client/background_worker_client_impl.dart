import 'dart:async';

import 'package:news_app/features_core/background_worker_core/background_worker_core.dart';

class BackgroundWorkerClientImpl implements BackgroundWorkerClient {
  Timer? _timer;

  @override
  void startWorker({
    required int secondsInterval,
    required void Function() onBackgroundTask,
  }) {
    final backgroundIntervalSeconds =
        secondsInterval >= 300 ? secondsInterval : 300;

    _timer ??=
        Timer.periodic(Duration(seconds: backgroundIntervalSeconds), (_) {
      onBackgroundTask();
    });
  }

  @override
  void cancelWorker() {
    _timer?.cancel();
    _timer = null;
  }
}
