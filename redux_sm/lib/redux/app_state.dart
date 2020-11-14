import 'package:reduxsm/model/dto/news_item.dart';
import 'package:reduxsm/model/dto/note.dart';

class AppState {
  List<Note> notes;
  List<NewsItem> news;
  bool darkTheme;
  bool isLoading;

  AppState({
    this.notes = const [],
    this.news = const [],
    this.darkTheme = false,
    this.isLoading = false,
  });
}