import 'package:reduxsm/model/dto/news_item.dart';
import 'package:reduxsm/model/dto/note.dart';
import 'package:reduxsm/redux/actions.dart';
import 'package:reduxsm/redux/app_state.dart';

bool settingsReducer(AppState state, action) {
  if (action is DisplaySettings) {
    return action.darkTheme;
  }
}

List<Note> notesReducer(AppState state, action) {
  if (action is DisplayNotes) {
    return action.notes;
  }
}

List<NewsItem> newsReducer(AppState state, action) {
  if (action is DisplayNews) {
    return action.news;
  }
}

bool loadingReducer(AppState state, action) => action is GetNews || action is GetNotes;

AppState appStateReducer(AppState state, action) => AppState(
  darkTheme: settingsReducer(state, action),
  notes: notesReducer(state, action),
  news: newsReducer(state, action),
  isLoading: loadingReducer(state, action),
);