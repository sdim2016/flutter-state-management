import 'package:setstate/model/api/api_client.dart';
import 'package:dio/dio.dart';
import 'package:setstate/model/dto/news.dart';


class NewsRepository {
  static final dio = Dio();
  final client  = ApiClient(dio);

  Future<News> getNews() => client.getNews();
}