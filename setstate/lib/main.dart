import 'package:flutter/material.dart';
import 'package:setstate/model/repositories/news_repository.dart';
import 'package:setstate/model/repositories/note_repository.dart';
import 'package:setstate/model/repositories/settings_repository.dart';
import 'package:setstate/view/main_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  final NoteRepository noteRepository = NoteRepository();
  final NewsRepository newsRepository = NewsRepository();
  final SettingsRepository settingsRepository = SettingsRepository();

  bool darkTheme = false;

  @override
  void initState() {
    settingsRepository.getSettings().then((value) {
      setDarkTheme(value);
    });
    super.initState();
  }

  void setDarkTheme(bool value) {
    setState(() {
      darkTheme = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter State Management',
      theme: darkTheme ? ThemeData.dark() : ThemeData.light(),
      home: MainScreen(
          title: 'Flutter State Management',
          noteRepository: noteRepository,
          newsRepository: newsRepository,
          settingsRepository: settingsRepository,
          setDarkTheme: setDarkTheme,
      ),
    );
  }
}
