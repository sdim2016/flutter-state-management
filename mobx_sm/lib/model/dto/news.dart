import 'package:json_annotation/json_annotation.dart';
import 'package:mobxsm/model/dto/news_item.dart';

part 'news.g.dart';

@JsonSerializable()
class News {

  List<NewsItem> news;

  News({this.news});

  factory News.fromJson(Map<String, dynamic> json) => _$NewsFromJson(json);
}