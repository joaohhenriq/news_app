import 'package:news_app/features/top_articles_feature/top_articles_feature.dart';
import 'package:rxdart/rxdart.dart';

class ArticleStreamService {
  final BehaviorSubject<List<SourceArticlesEntity>> articleSubject = BehaviorSubject.seeded([]);

  ValueStream get stream$ => articleSubject.stream;

  updateArticles(List<SourceArticlesEntity> updates) {
    articleSubject.add(updates);
  }
}