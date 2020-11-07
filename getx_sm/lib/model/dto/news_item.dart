import 'package:json_annotation/json_annotation.dart';

part 'news_item.g.dart';

@JsonSerializable()
class NewsItem {
  String date;
  String author;
  String title;
  String content;

  NewsItem({this.date, this.author, this.title, this.content});

  factory NewsItem.fromJson(Map<String, dynamic> json) => _$NewsItemFromJson(json);
}