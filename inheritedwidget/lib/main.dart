import 'package:flutter/material.dart';
import 'package:inheritedwidget/inherited/data_store.dart';
import 'package:inheritedwidget/inherited/view_model.dart';
import 'package:inheritedwidget/model/repositories/news_repository.dart';
import 'package:inheritedwidget/model/repositories/note_repository.dart';
import 'package:inheritedwidget/model/repositories/settings_repository.dart';
import 'package:inheritedwidget/view/main_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  final NoteRepository noteRepository = NoteRepository();
  final NewsRepository newsRepository = NewsRepository();
  final SettingsRepository settingsRepository = SettingsRepository();

  @override
  Widget build(BuildContext context) {
    return ViewModel(
      noteRepository: noteRepository,
      newsRepository: newsRepository,
      settingsRepository: settingsRepository,
      child: Builder(
        builder: (BuildContext context) {
          return MaterialApp(
            title: 'Flutter State Management',
            theme: DataStore.of(context).darkTheme ? ThemeData.dark() : ThemeData.light(),
            home: MainScreen(title: 'Flutter State Management'),
          );
        },
      ),
    );
  }
}
