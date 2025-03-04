import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseHelper {
  static const _databaseName = "MyDatabase.db";
  static const _databaseVersion = 1;
  static const table = 'my_table';
  static const columnId = '_id';
  static const columnName = 'name';
  static const columnAge = 'age';

  static final DatabaseHelper _instance = DatabaseHelper._internal();
  DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;

  Database? _db;

  Future<void> init() async {
    if (_db != null) return;
    final documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, _databaseName);
    _db = await openDatabase(
      path,
      version: _databaseVersion,
      onCreate: _onCreate,
    );
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $table (
        $columnId INTEGER PRIMARY KEY,
        $columnName TEXT NOT NULL,
        $columnAge INTEGER NOT NULL
      )
    ''');
  }

  Future<Database> get database async {
    if (_db == null) await init();
    return _db!;
  }

  Future<int> insert(Map<String, dynamic> row) async {
    final db = await database;
    return await db.insert(table, row);
  }

  Future<List<Map<String, dynamic>>> queryAllRows() async {
    final db = await database;
    return await db.query(table);
  }

  Future<int> queryRowCount() async {
    final db = await database;
    final results = await db.rawQuery('SELECT COUNT(*) FROM $table');
    return Sqflite.firstIntValue(results) ?? 0;
  }

  Future<int> update(Map<String, dynamic> row) async {
    final db = await database;
    return await db.update(table, row, where: '$columnId = ?', whereArgs: [row[columnId]]);
  }

  Future<int> delete(int id) async {
    final db = await database;
    return await db.delete(table, where: '$columnId = ?', whereArgs: [id]);
  }

  Future<Map<String, dynamic>?> queryById(int id) async {
    final db = await database;
    final results = await db.query(table, where: '$columnId = ?', whereArgs: [id]);
    return results.isNotEmpty ? results.first : null;
  }

  Future<int> deleteAll() async {
    final db = await database;
    return await db.delete(table);
  }
}