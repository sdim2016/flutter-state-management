import 'package:reduxsm/model/dto/news_item.dart';
import 'package:reduxsm/model/dto/note.dart';

abstract class SettingsAction {}
abstract class NewsAction {}
abstract class NotesAction {}

/// Settings-related actions
class GetSettings extends SettingsAction {}

class SaveSettings extends SettingsAction {
  bool darkTheme;
  SaveSettings(this.darkTheme);
}

class DisplaySettings extends SettingsAction {
  bool darkTheme;
  DisplaySettings(this.darkTheme);
}

/// News-related actions
class GetNews extends NewsAction {}

class DisplayNews extends NewsAction {
  List<NewsItem> news;
  DisplayNews(this.news);
}

/// Notes-related actions
class GetNotes extends NotesAction {}

class SaveNote extends NotesAction {
  Note note;
  SaveNote(this.note);
}

class UpdateNote extends NotesAction {
  Note note;
  UpdateNote(this.note);
}

class DeleteNote extends NotesAction {
  int noteId;
  DeleteNote(this.noteId);
}

class DisplayNotes extends NotesAction {
  List<Note> notes;
  DisplayNotes(this.notes);
}