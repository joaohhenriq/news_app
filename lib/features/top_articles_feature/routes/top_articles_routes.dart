import 'package:flutter/material.dart';
import 'package:news_app/base_app/injection/client/client.dart';
import 'package:news_app/base_app/router/router.dart';
import 'package:news_app/features/top_articles_feature/top_articles_feature.dart';
import 'package:provider/provider.dart';

class TopArticleRouter implements RouterClient {
  @override
  Map<String, dynamic> getRoutes(RouteSettings settings) => {
    TopArticleRoutes.topArticles: MaterialPageRoute(
      settings: settings,
      builder: (_) => ChangeNotifierProvider(
        create: (_) => TopArticlesState(),
        child: TopArticlesPage(
          startBackgroundFetch: Injector.I.get(),
          topArticlesState: Injector.I.get(),
          getHeadlinesGroupedBySource: Injector.I.get(),
        ),
      )
    ),
  };
}

class TopArticleRoutes {
  static const topArticles = 'top_articles';
}