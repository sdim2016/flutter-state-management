import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:inheritedwidget/model/dto/news_item.dart';
import 'package:inheritedwidget/model/dto/note.dart';

class DataStore extends InheritedWidget {

  const DataStore({
    Key key,
    @required this.notes,
    @required this.news,
    @required this.darkTheme,
    @required this.getNotes,
    @required this.createNote,
    @required this.updateNote,
    @required this.deleteNote,
    @required this.getNews,
    @required this.getSettings,
    @required this.setSettings,
    @required Widget child,
  });

  final List<Note> notes;
  final List<NewsItem> news;
  final bool darkTheme;
  final Function getNotes;
  final Function createNote;
  final Function updateNote;
  final Function deleteNote;
  final Function getNews;
  final Function getSettings;
  final Function setSettings;



  @override
  bool updateShouldNotify(DataStore oldWidget) {
    return !listEquals(oldWidget.notes, notes) ||
        !listEquals(oldWidget.news, news) ||
        oldWidget.darkTheme != darkTheme;
  }

}