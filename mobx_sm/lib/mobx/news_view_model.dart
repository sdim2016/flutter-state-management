import 'package:mobx/mobx.dart';
import 'package:mobxsm/model/dto/news.dart';
import 'package:mobxsm/model/dto/news_item.dart';
import 'package:mobxsm/model/repositories/news_repository.dart';

part 'news_view_model.g.dart';

class NewsViewModel = _NewsViewModel with _$NewsViewModel;

abstract class _NewsViewModel with Store {
  final NewsRepository newsRepository = NewsRepository();

  @observable
  List<NewsItem> news = [];

  @action
  void getNews() => newsRepository.getNews().then((value) => news = (value as News).news);


}