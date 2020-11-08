import 'package:blocsm/bloc/notes_bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:blocsm/model/dto/note.dart';
import 'package:blocsm/utils/custom_button.dart';
import 'package:blocsm/utils/note_mode.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NoteViewPage extends StatefulWidget {

  final NoteMode viewType;
  final Note note;

  const NoteViewPage({Key key, this.viewType, this.note}) : super(key: key);

  @override
  _NoteViewPageState createState() => _NoteViewPageState();
}

class _NoteViewPageState extends State<NoteViewPage> {

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _textController = TextEditingController();

  @override
  void didChangeDependencies() {
    if (widget.viewType == NoteMode.Edit) {
      _titleController.text = widget.note.title;
      _textController.text = widget.note.text;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    NotesBloc notesBloc = BlocProvider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
            widget.viewType == NoteMode.Add ? "Add a note" : "Edit the note"
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center ,
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(
                  hintText: "Note title"
              ),
            ),
            Container(height: 16,),
            TextField(
              controller: _textController,
              decoration: InputDecoration(
                  hintText: "Note text"
              ),
            ),
            Container(height: 16,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomButton(
                  text: "Save",
                  onClick: () {
                    final _title = _titleController.text;
                    final _text = _textController.text;

                    if (widget?.viewType == NoteMode.Add) {
                      //create
                      notesBloc.add(CreateNoteEvent(Note(_title, _text)));
                    } else {
                      //update
                      notesBloc.add(UpdateNoteEvent(Note.withId(widget.note.id, _title, _text)));
                    }

                    Navigator.pop(context);
                  },
                ),
                CustomButton(
                  text: "Discard",
                  buttonColor: Colors.grey,
                  onClick: () {
                    Navigator.pop(context);
                  },
                ),
                if (widget.viewType == NoteMode.Edit)
                  CustomButton(
                    text: "Delete",
                    buttonColor: Colors.red,
                    onClick: () {
                      // delete
                      notesBloc.add(DeleteNoteEvent(widget.note.id));
                      Navigator.pop(context);
                    },
                  )
              ],
            ),
          ],
        ),
      ),
    );
  }
}