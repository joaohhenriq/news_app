import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:news_app/features_core/stream_service_core/articles_stream/stream/article_stream_service.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key, required this.articleStreamService});
  
  final ArticleStreamService articleStreamService;

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      var rng = Random();
      Timer.periodic(const Duration(seconds: 2), (timer) {
        widget.articleStreamService.updateArticles([rng.nextInt(1000).toString()]);
      });
    });
  }
  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: Colors.black12,
    body: Center(
      child: StreamBuilder(
        stream: widget.articleStreamService.stream$,
        builder: (context, snapshot) {
          List<String> list = snapshot.data ?? [];

          final value = list.isNotEmpty ? list[0] : 'No data';

          return Text(
            value,
            style: const TextStyle(
              color: Colors.white,
            ),
          );
        }
      ),
    ),
  );
}
