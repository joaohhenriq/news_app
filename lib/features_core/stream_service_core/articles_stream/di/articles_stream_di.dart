import 'package:news_app/features_core/injection_core/client/client.dart';
import 'package:news_app/features_core/stream_service_core/articles_stream/articles_stream.dart';

class ArticlesStreamDI implements RegisterInjectionClient {
  @override
  void registerDependencies({required InjectionClient injector}) {
    injector.registerSingleton<ArticleStreamService>(ArticleStreamService());
  }
}
