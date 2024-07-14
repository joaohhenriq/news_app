abstract class BackgroundWorkerClient {
  void startWorker({
    required Duration duration,
    required void Function() onBackgroundTask,
  });

  void cancelWorker();
}
