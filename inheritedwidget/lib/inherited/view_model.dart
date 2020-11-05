import 'package:flutter/material.dart';
import 'package:inheritedwidget/inherited/data_store.dart';
import 'package:inheritedwidget/model/dto/news_item.dart';
import 'package:inheritedwidget/model/dto/note.dart';
import 'package:inheritedwidget/model/repositories/news_repository.dart';
import 'package:inheritedwidget/model/repositories/note_repository.dart';
import 'package:inheritedwidget/model/repositories/settings_repository.dart';

class ViewModel extends StatefulWidget {

  const ViewModel({
    Key key,
    @required this.noteRepository,
    @required this.newsRepository,
    @required this.settingsRepository,
    @required this.child
  }) : super(key: key);

  final Widget child;
  final NoteRepository noteRepository;
  final NewsRepository newsRepository;
  final SettingsRepository settingsRepository;

  @override
  _ViewModelState createState() => _ViewModelState();
}

class _ViewModelState extends State<ViewModel> {
  List<Note> notes = [];
  List<NewsItem> news = [];
  bool darkTheme = false;

  void getNotes() {
    widget.noteRepository.getNotes().then((value) {
      setState(() {
        notes = value;
      });
    });
  }

  void createNote(Note note) {
    widget.noteRepository.createNote(note).then((_) {
      getNotes();
    });
  }

  void updateNote(Note note) {
    widget.noteRepository.updateNote(note).then((_){
      getNotes();
    });
  }

  void deleteNote(int id) {
    widget.noteRepository.deleteNoteById(id).then((_) {
      getNotes();
    });
  }

  void getNews() {
    widget.newsRepository.getNews().then((value) {
      setState(() {
        news = value.news;
      });
    });
  }

  void getSettings() {
    widget.settingsRepository.getSettings().then((value) {
      setState(() {
        darkTheme = value;
      });
    });
  }

  void setSettings(bool darkTheme) {
    widget.settingsRepository.saveSettings(darkTheme).then((_) {
      getSettings();
    });
  }

  @override
  Widget build(BuildContext context) {
    return DataStore(
        notes: notes,
        news: news,
        darkTheme: darkTheme,
        getNotes: getNotes,
        createNote: createNote,
        updateNote: updateNote,
        deleteNote: deleteNote,
        getNews: getNews,
        getSettings: getSettings,
        setSettings: setSettings,
        child: widget.child
    );
  }
}
