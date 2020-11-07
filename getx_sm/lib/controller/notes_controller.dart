import 'package:get/get.dart';
import 'package:getxsm/model/dto/note.dart';
import 'package:getxsm/model/repositories/note_repository.dart';

class NotesController extends GetxController {
  final _noteRepository = NoteRepository();
  final notes = List<Note>().obs;

  @override
  void onInit() {
    getNotes();
    super.onInit();
  }

  void getNotes() {
    _noteRepository.getNotes().then((value) {
      notes.value = value;
    });
  }

  void createNote(Note note) {
    _noteRepository.createNote(note).then((_) {
      getNotes();
    });
  }

  void updateNote(Note note) {
    _noteRepository.updateNote(note).then((_){
      getNotes();
    });
  }

  void deleteNote(int id) {
    _noteRepository.deleteNoteById(id).then((_) {
      getNotes();
    });
  }
}