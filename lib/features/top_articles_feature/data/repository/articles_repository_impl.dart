import 'package:either_dart/either.dart';
import 'package:news_app/features/top_articles_feature/top_articles_feature.dart';
import 'package:news_app/features_util/failure.dart';

class ArticlesRepositoryImpl implements ArticlesRepository {
  ArticlesRepositoryImpl({required this.remoteDatasource});

  final ArticlesRemoteDatasource remoteDatasource;

  @override
  Future<Either<Failure, List<ArticleModel>>> getTopHeadlines() async {
    try {
      final result = await remoteDatasource.getTopHeadlines();
      if (result.isNotEmpty) {
        return Right(result);
      }
      return Left(GetTopHeadlinesEmptyListFailure());
    } catch (e) {
      return Left(GetTopHeadlinesCatchFailure());
    }
  }
}
