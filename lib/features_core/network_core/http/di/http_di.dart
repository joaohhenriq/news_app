import 'package:dio/dio.dart';
import 'package:news_app/features_core/injection_core/client/client.dart';
import 'package:news_app/features_core/network_core/network_core.dart';

class HttpDI implements RegisterInjectionClient {
  @override
  void registerDependencies({required InjectionClient injector}) {
    injector.registerFactory<HttpNetwork>(
      () => HttpNetworkImpl(client: Dio(), httpInterceptor: injector.get()),
    );
    injector.registerFactory<HttpInterceptor>(
      () => HttpInterceptor(),
    );
  }
}
