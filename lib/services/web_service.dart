import 'package:dio/dio.dart';
import 'package:news_app/models/news_article.dart';

class WebService {
  var dio = new Dio();

  Future<List<NewsArticle>> fetchTopHeadLines() async {
    String url = "https://newsapi.org/v2/top-headlines?country=us&apiKey=d4412340ea3d4feea3a0abca478e656b";

    final response = await dio.get(url);

    if (response.statusCode == 200) {
      final result = response.data;
      Iterable list = result['articles'];
      return list.map((article) => NewsArticle.fromJson(article)).toList();
    } else {
      throw Exception("failed to get top news");
    }
  }
}