import 'package:news_app/base_app/injection/injection.dart';
import 'package:news_app/features_core/stream_service_core/articles_stream/articles_stream.dart';

class ArticlesStreamDI implements RegisterInjectionClient {
  @override
  void registerDependencies({required InjectionClient injector}) {
    injector.registerSingleton<ArticleStreamService>(ArticleStreamService());
  }
}
