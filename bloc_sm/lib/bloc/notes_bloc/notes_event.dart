import 'package:blocsm/model/dto/note.dart';
import 'package:equatable/equatable.dart';

abstract class NotesEvent extends Equatable {
  const NotesEvent();

  @override
  List<Object> get props => [];
}

class GetNotesEvent extends NotesEvent { }

class CreateNoteEvent extends NotesEvent {
  final Note note;

  const CreateNoteEvent(this.note);

  @override
  List<Object> get props => [note];
}

class UpdateNoteEvent extends NotesEvent {
  final Note note;

  const UpdateNoteEvent(this.note);

  @override
  List<Object> get props => [note];
}

class DeleteNoteEvent extends NotesEvent {
  final int noteId;

  const DeleteNoteEvent(this.noteId);

  @override
  List<Object> get props => [noteId];
}