import 'package:providersm/model/database/note_database.dart';
import 'package:providersm/model/dto/note.dart';

class NoteDao {
  final dbProvider = DatabaseProvider.dbProvider;

  Future<int> createNote(Note note) async {
    final db = await dbProvider.database;
    var result = db.insert(noteTable, note.toDatabaseJsonNoId());
    return result;
  }

  Future<List<Note>> getNotes() async {
    final db = await dbProvider.database;
    var result = await db.query(noteTable);
    List<Note> notes = result.isNotEmpty ? result.map((item) => Note.fromJsonMap(item)).toList() : [];
    return notes;
  }

  Future<int> updateNote(Note note) async {
    final db = await dbProvider.database;
    var result = await db.update(noteTable,
        note.toDatabaseJson(),
        where: 'id = ?',
        whereArgs: [note.id]
    );
    return result;
  }

  Future<int> deleteNote(int id) async {
    final db = await dbProvider.database;
    var result = await db.delete(noteTable,
        where: 'id = ?',
        whereArgs: [id]
    );
    return result;
  }

  Future<int> restoreNote(Note note) async {
    final db = await dbProvider.database;
    var result = db.insert(noteTable, note.toDatabaseJson());
    return result;
  }
}