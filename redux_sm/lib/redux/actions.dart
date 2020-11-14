import 'package:reduxsm/model/dto/note.dart';

/// Settings-related actions
class GetSettings {}

class SaveSettings {
  bool darkTheme;
  SaveSettings(this.darkTheme);
}

/// News-related actions
class GetNews {}

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