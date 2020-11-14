import 'package:reduxsm/model/dto/news_item.dart';
import 'package:reduxsm/model/dto/note.dart';

/// Settings-related actions
class GetSettings {}

class SaveSettings {
  bool darkTheme;
  SaveSettings(this.darkTheme);
}

class DisplaySettings {
  bool darkTheme;
  DisplaySettings(this.darkTheme);
}

/// News-related actions
class GetNews {}

class DisplayNews {
  List<NewsItem> news;
}

/// Notes-related actions
class GetNotes {}

class SaveNote {
  Note note;
  SaveNote(this.note);
}

class UpdateNote {
  Note note;
  UpdateNote(this.note);
}

class DeleteNote {
  int noteId;
  DeleteNote(this.noteId);
}

class DisplayNotes {
  List<Note> notes;
  DisplayNotes(this.notes);
}