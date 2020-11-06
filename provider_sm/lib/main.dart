import 'package:flutter/material.dart';
import 'package:providersm/view/main_screen.dart';
import 'package:provider/provider.dart';
import 'package:providersm/viewmodel/news_viewmodel.dart';
import 'package:providersm/viewmodel/notes_viewmodel.dart';
import 'package:providersm/viewmodel/settings_viewmodel.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<SettingsViewModel>(
          create: (BuildContext context) {
            SettingsViewModel settingsViewModel = SettingsViewModel();
            settingsViewModel.getSettings();
            return settingsViewModel;
          },
        ),
        ChangeNotifierProvider<NewsViewModel>(
          create: (BuildContext context) {
            NewsViewModel newsViewModel = NewsViewModel();
            newsViewModel.getNews();
            return newsViewModel;
          },
        ),
        ChangeNotifierProvider<NotesViewModel>(
          create: (BuildContext context) {
            NotesViewModel notesViewModel = NotesViewModel();
            notesViewModel.getNotes();
            return notesViewModel;
          },
        )
      ],
      child: Builder(
        builder: (context) => MaterialApp(
          title: 'Flutter State Management',
          theme: Provider.of<SettingsViewModel>(context).darkTheme ? ThemeData.dark() : ThemeData.light(),
          home: MainScreen(title: 'Flutter State Management'),
        )
      ),
    );
  }
}
