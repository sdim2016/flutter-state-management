// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notes_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$NotesViewModel on _NotesViewModel, Store {
  final _$notesAtom = Atom(name: '_NotesViewModel.notes');

  @override
  List<Note> get notes {
    _$notesAtom.reportRead();
    return super.notes;
  }

  @override
  set notes(List<Note> value) {
    _$notesAtom.reportWrite(value, super.notes, () {
      super.notes = value;
    });
  }

  final _$_NotesViewModelActionController =
      ActionController(name: '_NotesViewModel');

  @override
  void getNotes() {
    final _$actionInfo = _$_NotesViewModelActionController.startAction(
        name: '_NotesViewModel.getNotes');
    try {
      return super.getNotes();
    } finally {
      _$_NotesViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  void createNote(Note note) {
    final _$actionInfo = _$_NotesViewModelActionController.startAction(
        name: '_NotesViewModel.createNote');
    try {
      return super.createNote(note);
    } finally {
      _$_NotesViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateNote(Note note) {
    final _$actionInfo = _$_NotesViewModelActionController.startAction(
        name: '_NotesViewModel.updateNote');
    try {
      return super.updateNote(note);
    } finally {
      _$_NotesViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  void deleteNote(int noteId) {
    final _$actionInfo = _$_NotesViewModelActionController.startAction(
        name: '_NotesViewModel.deleteNote');
    try {
      return super.deleteNote(noteId);
    } finally {
      _$_NotesViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
notes: ${notes}
    ''';
  }
}
