import 'package:flutter/material.dart';
import 'package:news_app/features/page.dart';
import 'package:news_app/features_core/injection_core/client/client.dart';
import 'package:news_app/features_core/router_core/client/client.dart';

class SplashRouter implements RouterClient {
  @override
  Map<String, dynamic> getRoutes(RouteSettings settings) => {
    SplashRoutes.splash: MaterialPageRoute(
      settings: settings,
      builder: (_) => SplashPage(
        articleStreamService: Injector.I.get(),
      ),
    ),
  };
}

class SplashRoutes {
  static const splash = 'splash';
}