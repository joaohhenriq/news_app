import 'package:rxdart/rxdart.dart';

class ArticleStreamService {
  final BehaviorSubject<List<String>> articleSubject = BehaviorSubject.seeded([]);

  ValueStream get stream$ => articleSubject.stream;

  updateArticles(List<String> updates) {
    articleSubject.add(updates);
  }
}