import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseModel {
  static DatabaseModel? _databaseModel;

  DatabaseModel._();

  factory DatabaseModel() {
    return _databaseModel ??= DatabaseModel._();
  }
  Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    final String dbDirectory = await getDatabasesPath();
    const String dbName = 'my_cells.db';
    final path = join(dbDirectory, dbName);

    _database = await openDatabase(
      path,
      version: 1,
      onCreate: _createDb,
    );

    return _database!;
  }

  Future<void> _createDb(Database db, int version) async {
    await db.transaction((txn) async {
      await txn.execute('''CREATE TABLE cell_types(
                            type_id INTEGER PRIMARY KEY,
                            type_name TEXT NOT NULL UNIQUE
                                ); ''');
      await txn.insert('cell_types', {'type_name': 'text'});
      await txn.insert('cell_types', {'type_name': 'cells'});

      await txn.execute(''' CREATE TABLE last_cells(
                                   id INTEGER PRIMARY KEY,
                                   date TEXT NOT NULL,
                                   cells TEXT NOT NULL UNIQUE,
                                   cells_type INTEGER ,
                                   is_pinned BOOLEAN DEFAULT 0,
                                   pinning_serial INTEGER DEFAULT 0,
                                   FOREIGN KEY (cells_type)
                                        REFERENCES cell_types (type_id)
                                        ON UPDATE CASCADE
                                        ON DELETE SET NULL
                                );
      ''');
    });
  }

  Future<int> insertData(table, values) async {
    final db = await database;
    return await db.insert(table, values,
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<Map<String, Object?>>> readData(
      {required String table, String? orderBy}) async {
    final db = await database;
    return await db.query(table, orderBy: orderBy);
  }

  Future<int> updateData({required String table,required Map<String, Object?> values,String? where,List<Object?>? whereArgs}) async {
    final db = await database;

    return await db.update(table, values,where: where,whereArgs: whereArgs,conflictAlgorithm: ConflictAlgorithm.ignore);
  }
}
