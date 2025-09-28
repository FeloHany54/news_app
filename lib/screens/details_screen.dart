import 'package:flutter/material.dart';
import 'package:news_app/model/news_response.dart';

import 'package:news_app/widgets/news_item_widget.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key, required this.articles});
  final Articles articles;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          "News",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Column(
          children: [
            NewsItemWidget(
              url:
                  articles.urlToImage ??
                  "https://library.ceu.edu/wp-content/uploads/news-2444778_960_720.jpg",
              title: articles.publishedAt!,
              subTitle: articles.title!,
            ),
            Text(
              articles.content!,
              style: TextStyle(color: Colors.grey, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
