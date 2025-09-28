import 'package:flutter/material.dart';

class ImageItemWidget extends StatelessWidget {
  const ImageItemWidget({super.key, required this.url});

  final String url;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      child: Image.network(
        url,
        width: double.infinity,
        height: 180,
        fit: BoxFit.fill,
      ),
    );
  }
}
