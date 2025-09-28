import 'package:flutter/material.dart';
import 'package:news_app/widgets/image_item_witget.dart';

// ignore: must_be_immutable
class NewsItemWidget extends StatelessWidget {
  const NewsItemWidget({
    super.key,
    required this.url,
    required this.title,
    required this.subTitle,
  });
  final String url;
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ImageItemWidget(url: url),
        ListTile(
          title: Text(
            title,
            style: TextStyle(color: Colors.grey, fontSize: 16),
          ),
          subtitle: Text(
            subTitle,
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
      ],
    );
  }
}
