import 'package:flutter/material.dart';

class TopArticlesPage extends StatefulWidget {
  const TopArticlesPage({super.key});

  @override
  State<TopArticlesPage> createState() => _TopArticlesPageState();
}

class _TopArticlesPageState extends State<TopArticlesPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: const Text('Top Articles'),
    ),
    body: const Center(
      child: Text('Top Articles Page'),
    ),
  );
}
