import 'package:news_app/base_app/injection/injection.dart';
import 'package:news_app/features/top_articles_feature/top_articles_feature.dart';

class ArticlesFeatureDI implements RegisterInjectionClient {
  @override
  void registerDependencies({required InjectionClient injector}) {
    // data sources
    injector.registerFactory<ArticlesRemoteDatasource>(
        () => ArticlesRemoteDatasourceImpl(injector.get()));

    // repositories
    injector.registerFactory<ArticlesRepository>(
        () => ArticlesRepositoryImpl(remoteDatasource: injector.get()));

    // use cases
    injector.registerFactory<GetTopHeadlines>(
        () => GetTopHeadlinesImpl(injector.get()));
    injector.registerFactory<GetHeadlinesGroupedBySource>(
        () => GetHeadlinesGroupedBySourceImpl(injector.get()));
    injector
        .registerFactory<StartBackgroundFetch>(() => StartBackgroundFetchImpl(
              backgroundWorkerClient: injector.get(),
              getHeadlinesGroupedBySource: injector.get(),
            ));

    // state management
    injector.registerSingleton<TopArticlesStream>(TopArticlesStream());
  }
}
