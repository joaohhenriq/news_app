import 'package:flutter/material.dart';
import 'package:news_app/features/route.dart';

Map<String, dynamic> routerFeatures(RouteSettings settings) => {
  ...SplashRouter().getRoutes(settings),
};
