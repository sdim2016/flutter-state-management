import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:reduxsm/model/dto/note.dart';
import 'package:reduxsm/redux/actions.dart';
import 'package:reduxsm/redux/app_state.dart';
import 'package:reduxsm/utils/custom_button.dart';
import 'package:reduxsm/utils/note_mode.dart';

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
    final store = StoreProvider.of<AppState>(context, listen: false);
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
                      //add
                      store.dispatch(SaveNote(Note(_title, _text)));
                    } else {
                      //update
                      store.dispatch(UpdateNote(Note.withId(widget.note.id, _title, _text)));
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
                      store.dispatch(DeleteNote(widget.note.id));
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