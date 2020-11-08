import 'package:blocsm/bloc/news_bloc/bloc.dart';
import 'package:blocsm/model/repositories/news_repository.dart';
import 'package:blocsm/model/repositories/note_repository.dart';
import 'package:blocsm/model/repositories/settings_repository.dart';
import 'package:flutter/material.dart';
import 'package:blocsm/view/main_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final NewsRepository newsRepository = NewsRepository();
  final NoteRepository noteRepository = NoteRepository();
  final SettingsRepository settingsRepository = SettingsRepository();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) {
        final newsBloc = NewsBloc(initialState: NewsLoadingState(), newsRepository: newsRepository);
        newsBloc.add(GetNewsEvent());
        return newsBloc;
      },
      child: MaterialApp(
        title: 'Flutter State Management',
        theme: ThemeData.light(),
        home: MainScreen(title: 'Flutter State Management'),
      ),
    );
  }
}
