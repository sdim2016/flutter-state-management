import 'package:flutter/material.dart';
import 'package:getxsm/controller/notes_controller.dart';
import 'package:get/get.dart';
import 'package:getxsm/utils/note_mode.dart';
import 'package:getxsm/view/pages/note_view_page.dart';

class NotesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final notes = Get.find<NotesController>().notes;
    return Container(
      child: Obx(
          () => ListView.builder(
            itemCount: notes.length,
            itemBuilder: (context, index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.to(NoteViewPage(viewType: NoteMode.Edit, note: notes[index],));
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
