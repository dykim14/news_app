import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/viewmodels/news_article_view_model.dart';

class NewsGrid extends StatelessWidget {
  final List<NewsArticleViewModel> articles;

  NewsGrid({required this.articles});

  @override
  Widget build(BuildContext context) {
    print("articles=" + articles.length.toString());
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemBuilder: (context, index) {
        var article = articles[index];
        print("article index=" + index.toString());
        return GridTile(
            child: Container(
              child: CachedNetworkImage(
                imageUrl: article.imageUrl ?? "",
              ),
            )
        );
      },
      itemCount: this.articles.length,
    );
  }
}
