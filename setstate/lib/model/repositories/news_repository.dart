import 'package:setstate/model/api/api_client.dart';
import 'package:dio/dio.dart';


class NewsRepository {
  static final dio = Dio();
  final client  = ApiClient(dio);

  Future getNews() => client.getNews();
}