import 'package:flutter/material.dart';
import 'package:inheritedwidget/model/news.dart';
import 'package:inheritedwidget/view/pages/news_view_page.dart';

class NewsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final notes = [
      News('News 1', 'Demo text 12321312321'),
      News('News 2', 'Demo text 12321312321'),
      News('News 3', 'Demo text 12321312321')
    ];
    return Container(
      child: ListView.builder(
          itemCount: notes.length,
          itemBuilder: (context, index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Card(
                  elevation: 1.0,
                  margin: const EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0))),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 30.0, bottom: 10.0, left: 10.0, right: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        NewsTitle(notes[index].title),
                        NewsContent(notes[index].text),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            OutlineButton(
                              child: Text('VIEW'),
                              onPressed: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                      return NewsViewPage(title: notes[index].title, content: notes[index].text,);
                                    })
                                );
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            );
          }
      ),
    );
  }
}

class NewsTitle extends StatelessWidget {

  final String _title;
  NewsTitle(this._title);

  @override
  Widget build(BuildContext context) {
    return Text(
      _title,
      style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
    );
  }
}

class NewsContent extends StatelessWidget {

  final String _text;
  NewsContent(this._text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Text(
        _text,
        maxLines: 3,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}