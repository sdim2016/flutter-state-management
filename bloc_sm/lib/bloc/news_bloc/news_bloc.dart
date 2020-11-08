import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:blocsm/model/dto/news.dart';
import 'package:blocsm/model/repositories/news_repository.dart';
import 'package:flutter/cupertino.dart';
import './bloc.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {

  final NewsRepository newsRepository;

  NewsBloc({
    @required NewsState initialState,
    @required this.newsRepository
  }) : super(initialState);

  @override
  Stream<NewsState> mapEventToState(
    NewsEvent event,
  ) async* {
    if (event is GetNewsEvent) {
      yield NewsLoadingState();
      News _news = await newsRepository.getNews();
      yield NewsLoadedState(_news.news);
    }
  }
}
