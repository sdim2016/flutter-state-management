import 'package:mobxsm/model/api/api_client.dart';
import 'package:dio/dio.dart';
import 'package:mobxsm/model/dto/news.dart';


class NewsRepository {
  static final dio = Dio();
  final client  = ApiClient(dio);

  Future<News> getNews() => client.getNews();
}