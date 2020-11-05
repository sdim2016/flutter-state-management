import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:inheritedwidget/model/dto/news_item.dart';

part 'news.g.dart';

@JsonSerializable()
class News {
  List<NewsItem> news;

  News({this.news});


  @override
  bool operator ==(other) {
    return (other is News)
        && listEquals(other.news, news);
  }

  factory News.fromJson(Map<String, dynamic> json) => _$NewsFromJson(json);
}