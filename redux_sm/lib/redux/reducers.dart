import 'package:reduxsm/model/dto/news_item.dart';
import 'package:reduxsm/model/dto/note.dart';
import 'package:reduxsm/redux/actions.dart';
import 'package:reduxsm/redux/app_state.dart';

bool settingsReducer(bool darkTheme, action) {
  if (action is DisplaySettings) {
    return action.darkTheme;
  } else {
    return darkTheme;
  }
}

List<Note> notesReducer(List<Note> notes, action) {
  if (action is DisplayNotes) {
    return List.from(action.notes);
  } else {
    return notes;
  }
}

List<NewsItem> newsReducer(List<NewsItem> news, action) {
  if (action is DisplayNews) {
    return List.from(action.news);
  } else {
    return news;
  }
}

bool loadingReducer(AppState state, action) => action is GetNews || action is GetNotes;

AppState appStateReducer(AppState state, action) => AppState(
  darkTheme: settingsReducer(state.darkTheme, action),
  notes: notesReducer(state.notes, action),
  news: newsReducer(state.news, action),
  isLoading: loadingReducer(state, action),
);