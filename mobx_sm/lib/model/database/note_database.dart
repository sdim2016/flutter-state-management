import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';


final noteTable = 'notes_table';
class DatabaseProvider {
  // singleton dbProvider
  static final DatabaseProvider dbProvider = DatabaseProvider();

  Database _database;

  // our getter will asynchronously create a database instance
  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await _createDatabase();
    return _database;
  }

  _createDatabase() async {
    String databasesPath = await getDatabasesPath();
    String dbPath = join(databasesPath, "proceedit_note.db");
    var database = await openDatabase(
        dbPath,
        version: 1,
        onCreate: initDB
    );
    return database;
  }

  void initDB(Database db, int version) async {
    await db.execute('''
          create table $noteTable(
          id integer primary key autoincrement,
          title text not null,
          text text not null
         );
    ''');
  }
}