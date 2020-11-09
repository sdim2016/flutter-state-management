import 'package:flutter/material.dart';
import 'package:mobxsm/model/dto/note.dart';
import 'package:mobxsm/model/repositories/note_repository.dart';
import 'package:mobxsm/utils/note_mode.dart';
import 'package:mobxsm/view/pages/note_view_page.dart';

class NotesPage extends StatefulWidget {

  final NoteRepository noteRepository;

  const NotesPage({Key key, this.noteRepository}) : super(key: key);

  @override
  _NotesPageState createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {

  List<Note> notes = [];

  @override
  void initState() {
    getNotes();
    super.initState();
  }

  void getNotes() {
    widget.noteRepository.getNotes().then((value) {
      setState(() {
        notes = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
          itemCount: notes.length,
          itemBuilder: (context, index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                      MaterialPageRoute(builder: (context) {
                        return NoteViewPage(viewType: NoteMode.Edit, note: notes[index], noteRepository: widget.noteRepository,);
                      })
                    ).then((_) {
                      getNotes();
                    });
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
