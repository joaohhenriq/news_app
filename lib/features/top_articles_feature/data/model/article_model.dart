import 'package:news_app/features/top_articles_feature/top_articles_feature.dart';

class ArticleModel extends ArticleEntity {
  const ArticleModel({
    super.sourceId = '',
    super.sourceName = '',
    super.author = '',
    super.title = '',
    super.description = '',
    super.url = '',
    super.urlToImage = '',
    super.publishedAt = '',
    super.content = '',
  });

  factory ArticleModel.fromMap(Map<String, dynamic> map) => ArticleModel(
        sourceId: map['source'] != null && map['source']['id'] != null
            ? map['source']['id']
            : '',
        sourceName: map['source'] != null && map['source']['name'] != null
            ? map['source']['name']
            : '',
        author: map['author'] ?? '',
        title: map['title'] ?? '',
        description: map['description'] ?? '',
        url: map['url'] ?? '',
        urlToImage: map['urlToImage'] ?? '',
        publishedAt: map['publishedAt'] ?? '',
        content: map['content'] ?? '',
      );
}
