import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/viewmodels/news_article_view_model.dart';

class NewsGrid extends StatelessWidget {
  final List<NewsArticleViewModel> articles;

  NewsGrid({required this.articles});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemBuilder: (context, index) {
        var article = articles[index];
        return GridTile(
          child: Container(
            child: CachedNetworkImage(
              imageUrl: article.imageUrl ?? "",
              imageBuilder:  (context, imageProvider) {
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    )
                  ),
                );
              },
              errorWidget: (context, url, error) {
                return Container(

                )
              },
              placeholder: (context, url) {
                return Center(child: CircularProgressIndicator(),);
              },
            ),
          )
        );
      },
      itemCount: this.articles.length,
    );
  }
}
