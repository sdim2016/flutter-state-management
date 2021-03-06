import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:reduxsm/model/dto/news_item.dart';
import 'package:reduxsm/redux/app_state.dart';
import 'package:reduxsm/view/pages/news_view_page.dart';

class NewsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: StoreConnector<AppState, _ViewModel>(
        converter: (store) => _ViewModel(news: store.state.news, isLoading: store.state.isLoading),
        builder: (context, viewModel) {
          final news = viewModel.news;
          if (!viewModel.isLoading) {
            return ListView.builder(
                itemCount: news.length,
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Card(
                        elevation: 1.0,
                        margin: const EdgeInsets.only(
                            left: 8.0, right: 8.0, top: 8.0),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(
                                8.0))),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 30.0, bottom: 10.0, left: 10.0, right: 10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              NewsTitle(news[index].title),
                              NewsContent(news[index].content),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  OutlineButton(
                                    child: Text('VIEW'),
                                    onPressed: () {
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) {
                                            return NewsViewPage(
                                              title: news[index].title,
                                              content: news[index].content,);
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
            );
          } else {
            return Center(child: CircularProgressIndicator(),);
          }
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

class _ViewModel {
  final List<NewsItem> news;
  final bool isLoading;

  _ViewModel({this.news, this.isLoading});
}
