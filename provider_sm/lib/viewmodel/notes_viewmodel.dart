import 'package:flutter/material.dart';
import 'package:providersm/model/dto/note.dart';
import 'package:providersm/model/repositories/note_repository.dart';

class NotesViewModel extends ChangeNotifier {
  final noteRepository = NoteRepository();

  List<Note> notes = [];

  void getNotes() {
    noteRepository.getNotes().then((value) {
      notes = value;
      notifyListeners();
    });
  }

  void createNote(Note note) {
    noteRepository.createNote(note).then((_) {
      getNotes();
    });
  }

  void updateNote(Note note) {
    noteRepository.updateNote(note).then((_){
      getNotes();
    });
  }

  void deleteNote(int id) {
    noteRepository.deleteNoteById(id).then((_) {
      getNotes();
    });
  }

}