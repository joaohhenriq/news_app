import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:news_app/features/shared/shared.dart';
import 'package:news_app/features/top_articles_feature/top_articles_feature.dart';
import 'package:url_launcher/url_launcher.dart';

class ArticleDetailsPage extends StatefulWidget {
  const ArticleDetailsPage({
    super.key,
    required this.articleEntity,
  });

  final ArticleEntity articleEntity;

  @override
  State<ArticleDetailsPage> createState() => _ArticleDetailsPageState();
}

class _ArticleDetailsPageState extends State<ArticleDetailsPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Article'),
          actions: [
            Consumer<SeriesDetailState>(
              builder: (context, provider, child) {
                return IconButton(
                  icon: Icon(
                    provider.isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: provider.isFavorite ? Colors.red : Colors.grey,
                  ),
                  onPressed: () => _onTapFavoriteIcon(
                    tvShowEntity: widget.tvShowEntity,
                    isFavorite: provider.isFavorite,
                    updateIsFavorite: provider.updateIsFavorite,
                  ),
                );
              },
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.45,
                  width: double.infinity,
                  child: ImageNetwork(
                    imageUrl: widget.articleEntity.urlToImage,
                    defaultIconColor: Colors.grey,
                  ),
                ),
              ),
              PaddingWithText(
                text: _getDateTimeFormatted(widget.articleEntity.publishedAt),
                fontSize: 14,
              ),
              PaddingWithText(
                text: widget.articleEntity.sourceName,
                fontSize: 24,
              ),
              PaddingWithText(
                text: widget.articleEntity.author,
                textPrefix: 'Author:',
                fontSize: 14,
              ),
              PaddingWithText(
                text: widget.articleEntity.title,
                fontSize: 14,
              ),
              PaddingWithText(
                text: widget.articleEntity.description,
                fontSize: 14,
              ),
              if (widget.articleEntity.url.isNotEmpty)
                GestureDetector(
                  onTap: () => _onTapOpenUrl(widget.articleEntity.url),
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(12.0),
                    margin: const EdgeInsets.only(
                      top: 24.0,
                      left: 12.0,
                      right: 12.0,
                      bottom: 12.0,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black54),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Center(
                      child: Text(
                        'Check full article',
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      );

  String _getDateTimeFormatted(String dateTime) {
    if (dateTime.isEmpty) return '';
    final parsedDateTime = DateTime.parse(dateTime);
    DateFormat formatter = DateFormat('MM/dd/yyyy HH:mm');
    return formatter.format(parsedDateTime);
  }

  void _onTapOpenUrl(String url) {
    if (url.isNotEmpty) {
      launchUrl(Uri.parse(url));
    }
  }
}
