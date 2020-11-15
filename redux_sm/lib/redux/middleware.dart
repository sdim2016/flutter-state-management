import 'package:redux/redux.dart';
import 'package:reduxsm/model/repositories/news_repository.dart';
import 'package:reduxsm/model/repositories/note_repository.dart';
import 'package:reduxsm/model/repositories/settings_repository.dart';
import 'package:reduxsm/redux/actions.dart';
import 'package:reduxsm/redux/app_state.dart';

void settingsMiddleware(Store<AppState> store, action, NextDispatcher next) {
  if (action is SettingsAction) {
    SettingsRepository settingsRepository = SettingsRepository(); // TODO: has to be a singleton
    if (action is GetSettings) {
      settingsRepository.getSettings().then((value) =>
          store.dispatch(DisplaySettings(value)));
    }
    if (action is SaveSettings) {
      settingsRepository.saveSettings(action.darkTheme).then((_) =>
          store.dispatch(GetSettings()));
    }
  }
  next(action);
}

void newsMiddleware(Store<AppState> store, action, NextDispatcher next) {
  if (action is NewsAction) {
    NewsRepository newsRepository = NewsRepository();
    if (action is GetNews) {
      newsRepository.getNews().then((value) =>
          store.dispatch(DisplayNews(value.news)));
    }
  }
  next(action);
}

void notesMiddleware(Store<AppState> store, action, NextDispatcher next) {
  if (action is NotesAction) {
    NoteRepository noteRepository = NoteRepository();
    if (action is GetNotes) {
      noteRepository.getNotes().then((value) => store.dispatch(DisplayNotes(value)));
    }
    if (action is SaveNote) {
      noteRepository.createNote(action.note).then((_) => store.dispatch(GetNotes()));
    }
    if (action is UpdateNote) {
      noteRepository.updateNote(action.note).then((_) => store.dispatch(GetNotes()));
    }
    if (action is DeleteNote) {
      noteRepository.deleteNoteById(action.noteId).then((_) => store.dispatch(GetNotes()));
    }
  }
}
