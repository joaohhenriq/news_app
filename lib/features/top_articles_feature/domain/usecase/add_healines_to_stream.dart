import 'package:news_app/features/top_articles_feature/top_articles_feature.dart';
import 'package:news_app/features_core/background_worker_core/background_worker_core.dart';
import 'package:news_app/features_core/stream_service_core/articles_stream/articles_stream.dart';
import 'package:news_app/features_util/config.dart';

abstract class AddHeadlinesToStream {
  Future<void> call();
}

class AddHeadlinesToStreamImpl implements AddHeadlinesToStream {
  AddHeadlinesToStreamImpl({
    required this.getHeadlinesGroupedBySource,
    required this.backgroundWorkerClient,
    required this.articleStreamService,
  });

  final GetHeadlinesGroupedBySource getHeadlinesGroupedBySource;
  final BackgroundWorkerClient backgroundWorkerClient;
  final ArticleStreamService articleStreamService;

  @override
  Future<void> call() async {
    final articles = await getHeadlinesGroupedBySource();
    if(articles.isRight) {

    }
  }

  // void _startBackgroundWorker() {
  //   backgroundWorkerClient.startWorker(
  //     secondsInterval: Config.backgroundFetchInterval,
  //     onBackgroundTask: () {
  //       final articleStreamService = Injector.I.get<ArticleStreamService>();
  //       articleStreamService
  //           .updateArticles([Random().nextInt(1000).toString()]);
  //     },
  //   );
  // }
}
