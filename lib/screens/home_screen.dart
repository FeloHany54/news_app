import 'package:flutter/material.dart';
import 'package:news_app/app_api.dart';
import 'package:news_app/model/news_response.dart';
import 'package:news_app/screens/details_screen.dart';
import 'package:news_app/widgets/news_item_widget.dart';

class News extends StatelessWidget {
  const News({super.key});

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

      body: FutureBuilder<NewsResponse>(
        future: AppApi().getNews(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(backgroundColor: Colors.blue),
            );
          }
          if (snapshot.hasError) {
            return Center(
              child: Text(
                "Error 404!!",
                style: TextStyle(color: Colors.grey, fontSize: 24),
              ),
            );
          }
          var listOfNews = snapshot.data?.articles ?? [];
          return ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            itemBuilder: (context, index) => InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) =>
                        DetailsScreen(articles: listOfNews[index]),
                  ),
                );
              },
              child: NewsItemWidget(
                url:
                    listOfNews[index].urlToImage ??
                    "https://library.ceu.edu/wp-content/uploads/news-2444778_960_720.jpg",
                title: listOfNews[index].publishedAt ?? "",
                subTitle: listOfNews[index].title ?? "",
              ),
            ),
            separatorBuilder: (context, index) => SizedBox(height: 20),
            itemCount: listOfNews.length,
          );
        },
      ),
    );
  }
}
