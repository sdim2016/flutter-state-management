import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'package:mobxsm/model/dto/news.dart';


part 'api_client.g.dart';

@RestApi(baseUrl: "https://slepnev.pro/api")
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) {
    dio.options = BaseOptions(receiveTimeout: 5000, connectTimeout: 5000);
    return _ApiClient(dio, baseUrl: baseUrl);
  }

  @GET("/test_news.json")
  Future<News> getNews();
}