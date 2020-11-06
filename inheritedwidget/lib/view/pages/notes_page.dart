import 'package:flutter/material.dart';
import 'package:inheritedwidget/inherited/data_store.dart';
import 'package:inheritedwidget/model/dto/note.dart';
import 'package:inheritedwidget/utils/note_mode.dart';

import 'note_view_page.dart';

class NotesPage extends StatefulWidget {
  @override
  _NotesPageState createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    DataStore.of(context).getNotes();
  }

  @override
  Widget build(BuildContext context) {

    List<Note> notes = DataStore.of(context).notes;

    return Container(
      child: ListView.builder(
          itemCount: notes.length,
          itemBuilder: (context, index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                GestureDetector(
                  onTap: () {


                  },
                  child: Card(
                    elevation: 1.0,
                    margin: const EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8.0))),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 30.0, bottom: 30.0, left: 10.0, right: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _NoteTitle(notes[index].title),
                          _NoteContent(notes[index].text)
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          }
      ),
    );
  }
}

class _NoteTitle extends StatelessWidget {

  final String _title;
  _NoteTitle(this._title);

  @override
  Widget build(BuildContext context) {
    return Text(
      _title,
      style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
    );
  }
}

class _NoteContent extends StatelessWidget {

  final String _text;
  _NoteContent(this._text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Text(
        _text,
        maxLines: 3,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
