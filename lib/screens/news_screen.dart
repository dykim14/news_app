import 'package:flutter/material.dart';
import 'package:news_app/utils/constants.dart';
import 'package:news_app/viewmodels/news_article_list_view_model.dart';
import 'package:news_app/widgets/news_grid.dart';
import 'package:provider/provider.dart';

class NewsScreen extends StatefulWidget {
  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {

  @override
  Widget build(BuildContext context) {
    var listViewModel = Provider.of<NewsArticleListViewModel>(context);
    return Scaffold(
        appBar: AppBar(
          actions: [
            PopupMenuButton(
              onSelected: (country) {
                listViewModel.topCountryHeadLines(Constants.Countries[country] ?? "");
              },
              itemBuilder: (_) {
                return Constants.Countries.keys
                    .map((v) => PopupMenuItem(
                        value: v,
                        child: Text(v),
                    )
                ).toList();
              }
            )
          ]
        ),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Text(
                  'News',
                  style: TextStyle(fontSize: 50),
                ),
              ),
              Divider(
                color: Color(0xffff8a30),
                height: 40,
                thickness: 8,
                indent: 30,
                endIndent: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, top: 15, bottom: 15),
                child: Text(
                  'Headline',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              Expanded(
                child: NewsGrid(
                  articles : listViewModel.articles,
                )
              ),
            ],
          ),
        ),
    );
  }

  @override
  void initState() {
    super.initState();
    Provider.of<NewsArticleListViewModel>(context, listen: false).topHeadLines();
  }
}
