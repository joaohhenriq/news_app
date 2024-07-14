import 'package:either_dart/either.dart';
import 'package:news_app/features/top_articles_feature/top_articles_feature.dart';
import 'package:news_app/features_util/failure.dart';

abstract class ArticlesRepository {
  Future<Either<Failure, List<ArticleModel>>> getTopHeadlines();
}