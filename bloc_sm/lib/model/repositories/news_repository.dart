import 'package:blocsm/model/api/api_client.dart';
import 'package:blocsm/model/dto/news.dart';
import 'package:dio/dio.dart';


class NewsRepository {
  static final dio = Dio();
  final client  = ApiClient(dio);

  Future<News> getNews() => client.getNews();
}