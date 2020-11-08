import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:blocsm/model/dto/note.dart';
import 'package:blocsm/model/repositories/note_repository.dart';
import 'package:flutter/cupertino.dart';
import './bloc.dart';

class NotesBloc extends Bloc<NotesEvent, NotesState> {

  final NoteRepository noteRepository;

  NotesBloc({
    @required NotesState initialState,
    @required this.noteRepository
  }) : super(initialState);

  @override
  Stream<NotesState> mapEventToState(
    NotesEvent event,
  ) async* {
    if (event is GetNotesEvent) {
      List<Note> notes = await noteRepository.getNotes();
      yield NotesLoadedState(notes);
    }

    if (event is CreateNoteEvent) {
      await noteRepository.createNote(event.note);
      yield* mapEventToState(GetNotesEvent());
    }

    if (event is UpdateNoteEvent) {
      await noteRepository.updateNote(event.note);
      yield* mapEventToState(GetNotesEvent());
    }

    if (event is DeleteNoteEvent) {
      await noteRepository.deleteNoteById(event.noteId);
      yield* mapEventToState(GetNotesEvent());
    }

  }
}
