import 'package:flutter/material.dart';
import 'package:providersm/model/dto/news_item.dart';
import 'package:providersm/model/repositories/news_repository.dart';

class NewsViewModel extends ChangeNotifier {
  final newsRepository = NewsRepository();

  List<NewsItem> news = [];

  void getNews() {
    newsRepository.getNews().then((value) {
      news = value.news;
      notifyListeners();
    });
  }

}