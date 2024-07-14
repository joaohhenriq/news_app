import 'package:equatable/equatable.dart';
import 'package:news_app/features/top_articles_feature/top_articles_feature.dart';

class SourceArticlesEntity extends Equatable {
  const SourceArticlesEntity({
    this.id = '',
    this.articles = const [],
  });

  final String id;
  final List<ArticleEntity> articles;

  @override
  List<Object?> get props => [
        id,
        articles,
      ];

  SourceArticlesEntity copyWith({
    String? id,
    List<ArticleEntity>? articles,
  }) =>
      SourceArticlesEntity(
        id: id ?? this.id,
        articles: articles ?? this.articles,
      );
}
