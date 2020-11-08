import 'package:blocsm/bloc/news_bloc/bloc.dart';
import 'package:blocsm/bloc/settings_bloc/bloc.dart';
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
    return MultiBlocProvider(
      providers: [
        BlocProvider<NewsBloc>(
            create: (BuildContext context) {
              final newsBloc = NewsBloc(initialState: NewsLoadingState(), newsRepository: newsRepository);
              newsBloc.add(GetNewsEvent());
              return newsBloc;
            }
        ),
        BlocProvider<SettingsBloc>(
            create: (BuildContext context) {
              final settingsBloc = SettingsBloc(initialState: SettingsObtainedState(false), settingsRepository: settingsRepository);
              settingsBloc.add(GetSettingsEvent());
              return settingsBloc;
            }
        ),
      ],
      child: BlocBuilder<SettingsBloc, SettingsState>(
        builder: (BuildContext context, state) {
          ThemeData theme = (state as SettingsObtainedState).darkTheme ? ThemeData.dark() : ThemeData.light();
          return MaterialApp(
              title: 'Flutter State Management',
              theme: theme,
              home: MainScreen(title: 'Flutter State Management'),
            );
        },
      ),
    );
  }
}
