import 'package:blocsm/model/dto/news_item.dart';
import 'package:equatable/equatable.dart';

abstract class NewsState extends Equatable {
  const NewsState();

  @override
  List<Object> get props => [];
}

class NewsLoadingState extends NewsState { }

class NewsLoadedState extends NewsState {
  final List<NewsItem> news;

  const NewsLoadedState(this.news);

  @override
  List<Object> get props => [news];
}
