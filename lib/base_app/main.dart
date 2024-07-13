import 'package:flutter/material.dart';
import 'package:news_app/base_app/bootstrap.dart';
import 'package:news_app/features/route.dart';
import 'package:news_app/features_core/router_core/router_core.dart';

void main() {
  Bootstrap.start();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News App',
      onGenerateRoute: (settings) => routerFeatures(settings)[settings.name],
      initialRoute: SplashRoutes.splash,
    );
  }
}
