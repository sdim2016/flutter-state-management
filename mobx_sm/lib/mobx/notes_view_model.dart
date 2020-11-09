import 'package:mobx/mobx.dart';
import 'package:mobxsm/model/dto/note.dart';
import 'package:mobxsm/model/repositories/note_repository.dart';

part 'notes_view_model.g.dart';

class NotesViewModel = _NotesViewModel with _$NotesViewModel;

abstract class _NotesViewModel with Store {
  final NoteRepository noteRepository = NoteRepository();

  @observable
  List<Note> notes = [];

  @action
  void getNotes() => noteRepository.getNotes().then((value) => notes = value);

  @action
  void createNote(Note note) => noteRepository.createNote(note).then((_) => getNotes());

  @action
  void updateNote(Note note) => noteRepository.updateNote(note).then((_) => getNotes());

  @action
  void deleteNote(int noteId) => noteRepository.deleteNoteById(noteId).then((_) => getNotes());


}