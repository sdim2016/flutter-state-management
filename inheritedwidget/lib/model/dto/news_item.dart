import 'package:json_annotation/json_annotation.dart';

part 'news_item.g.dart';

@JsonSerializable()
class NewsItem {
  String date;
  String author;
  String title;
  String content;

  NewsItem({this.date, this.author, this.title, this.content});

  @override
  bool operator ==(other) {
    return (other is NewsItem)
        && other.date == date
        && other.author == author
        && other.title == title
        && other.content == content;
  }

  factory NewsItem.fromJson(Map<String, dynamic> json) => _$NewsItemFromJson(json);
}