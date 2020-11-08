import 'package:blocsm/model/dto/note.dart';
import 'package:equatable/equatable.dart';

abstract class NotesState extends Equatable {
  const NotesState();

  @override
  List<Object> get props => [];
}

class NotesLoadingState extends NotesState { }

class NotesLoadedState extends NotesState {
  final List<Note> notes;

  const NotesLoadedState(this.notes);

  @override
  List<Object> get props => [notes];
}