import 'package:either_dart/either.dart';
import 'package:news_app/features/top_articles_feature/top_articles_feature.dart';
import 'package:news_app/features_util/failure.dart';

abstract class GetHeadlinesGroupedBySource {
  Future<Either<Failure, List<SourceArticlesEntity>>> call();
}

class GetHeadlinesGroupedBySourceImpl implements GetHeadlinesGroupedBySource {
  GetHeadlinesGroupedBySourceImpl(this.getTopHeadlines);

  final GetTopHeadlines getTopHeadlines;

  @override
  Future<Either<Failure, List<SourceArticlesEntity>>> call() async {
    final articlesResult = await getTopHeadlines();

    if (articlesResult.isRight && articlesResult.right.isNotEmpty) {
      Map<String, List<ArticleEntity>> map =
          _groupBySourceWithMap(articlesResult.right);
      return Right(_convertSourceMapToEntityList(map));
    }

    return Left(articlesResult.left);
  }

  Map<String, List<ArticleEntity>> _groupBySourceWithMap(
    List<ArticleEntity> list,
  ) {
    Map<String, List<ArticleEntity>> map = {};
    for (final item in list) {
      if (!map.containsKey(item.sourceId)) {
        map[item.sourceId] = [];
      }
      map[item.sourceId]!.add(item);
    }
    return map;
  }

  List<SourceArticlesEntity> _convertSourceMapToEntityList(
    Map<String, List<ArticleEntity>> map,
  ) {
    return map.entries.map((entry) {
      return SourceArticlesEntity(
        id: entry.key,
        articles: entry.value,
      );
    }).toList();
  }
}
