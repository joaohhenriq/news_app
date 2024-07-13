import 'package:flutter/material.dart';
import 'package:news_app/base_app/router/router.dart';
import 'package:news_app/features/page.dart';
import 'package:news_app/base_app/injection/injection.dart';

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