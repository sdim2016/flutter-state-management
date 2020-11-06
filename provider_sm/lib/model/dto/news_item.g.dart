// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsItem _$NewsItemFromJson(Map<String, dynamic> json) {
  return NewsItem(
    date: json['date'] as String,
    author: json['author'] as String,
    title: json['title'] as String,
    content: json['content'] as String,
  );
}

Map<String, dynamic> _$NewsItemToJson(NewsItem instance) => <String, dynamic>{
      'date': instance.date,
      'author': instance.author,
      'title': instance.title,
      'content': instance.content,
    };
