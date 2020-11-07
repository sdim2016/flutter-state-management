import 'package:get/get.dart';
import 'package:getxsm/model/dto/news_item.dart';
import 'package:getxsm/model/repositories/news_repository.dart';

class NewsController extends GetxController {
  final _newsRepository = NewsRepository();
  final news = List<NewsItem>().obs;

  @override
  void onInit() {
    getNews();
    super.onInit();
  }

  void getNews() {
    _newsRepository.getNews().then((value){
      news.value = value.news;
    });
  }
}