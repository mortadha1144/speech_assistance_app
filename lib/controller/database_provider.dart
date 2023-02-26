import 'package:flutter/foundation.dart';
import 'package:speech_assistance_app/models/cells_record.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseProvider with ChangeNotifier {
  List<CellsRecord> _cellsRecords = [];
  List<CellsRecord> get cellsRecords => _cellsRecords;



  Database? _database;

  Future<Database> get database async {
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

  Future<List<CellsRecord>> fetchCellsRecord() async {
    final db = await database;

    return await db.query('last_cells').then((value) {
      final List<Map<String, dynamic>> converted =
          List<Map<String, dynamic>>.from(value);
      List<CellsRecord> nList = List.generate(
        converted.length,
        (index) => CellsRecord.fromDatabase(converted[index]),
      );
      _cellsRecords = nList;
      _cellsRecords.sort((a, b) => b.isPinned.compareTo(a.isPinned));
      return _cellsRecords;
    });
  }

  Future<void> addCells(CellsRecord cells) async {
    final db = await database;
    await db
        .insert(
      'last_cells',
      {'date': cells.date.toString(), 'cells': cells.cells, 'cells_type': 1},
      conflictAlgorithm: ConflictAlgorithm.replace,
    )
        .then((value) {
      final file = CellsRecord(
        id: value,
        date: cells.date,
        cells: cells.cells,
        cellsType: 1,
      );

      _cellsRecords.add(file);
    });
  }
}
