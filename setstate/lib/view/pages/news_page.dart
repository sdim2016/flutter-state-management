import 'package:flutter/material.dart';
import 'package:setstate/model/dto/news_item.dart';
import 'package:setstate/model/repositories/news_repository.dart';
import 'package:setstate/view/pages/news_view_page.dart';

class NewsPage extends StatefulWidget {

  final NewsRepository newsRepository;

  const NewsPage({Key key, this.newsRepository}) : super(key: key);

  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {

  List<NewsItem> news;
  bool loading = true;

  @override
  void initState() {
    widget.newsRepository.getNews().then((value) {
      setState(() {
        news = value.news;
        loading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: loading ? Center(child: CircularProgressIndicator()) : ListView.builder(
          itemCount: news.length,
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
                        NewsTitle(news[index].title),
                        NewsContent(news[index].content, maxLines: 3),
                        NewsContent('Author: ${news[index].author}', maxLines: 1,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            OutlineButton(
                              child: Text('VIEW'),
                              onPressed: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                      return NewsViewPage(title: news[index].title, content: news[index].content,);
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
  final int maxLines;
  NewsContent(this._text, {this.maxLines});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Text(
        _text,
        maxLines: maxLines,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}