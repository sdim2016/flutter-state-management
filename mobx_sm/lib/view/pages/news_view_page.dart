import 'package:flutter/material.dart';

import 'news_page.dart';

class NewsViewPage extends StatelessWidget {

  final String title;
  final String content;

  const NewsViewPage({Key key, this.title, this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            this.title
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            NewsTitle(this.title),
            NewsContent(this.content, maxLines: 25,)
          ],
        ),
      ),
    );
  }
}
