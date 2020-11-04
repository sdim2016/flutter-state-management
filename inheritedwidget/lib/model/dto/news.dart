import 'package:json_annotation/json_annotation.dart';
import 'package:inheritedwidget/model/dto/news_item.dart';

part 'news.g.dart';

@JsonSerializable()
class News {
  List<NewsItem> list;

  News({this.list});

  factory News.fromJson(Map<String, dynamic> json) => _$NewsFromJson(json);
}