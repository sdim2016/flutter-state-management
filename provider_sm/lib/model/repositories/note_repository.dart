import 'package:providersm/model/database/note_dao.dart';
import 'package:providersm/model/dto/note.dart';

class NoteRepository {
  final noteDao = NoteDao();

  Future getNotes() => noteDao.getNotes();
  Future createNote(Note note) => noteDao.createNote(note);
  Future updateNote(Note note) => noteDao.updateNote(note);
  Future deleteNoteById(int id) => noteDao.deleteNote(id);
  Future restoreNote(Note note) => noteDao.restoreNote(note);

}