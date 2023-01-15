import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:intl/intl.dart';
import 'package:speech_assistance_app/models/cell/cell.dart';
import 'package:speech_assistance_app/modules/home/home_screen.dart';
import 'package:speech_assistance_app/modules/home/last_records_screen.dart';
import 'package:speech_assistance_app/modules/home/settings_screen.dart';
import 'package:speech_assistance_app/modules/home/text_to_speech_screen.dart';
import 'package:speech_assistance_app/shared/components/components.dart';
import 'package:sqflite/sqflite.dart';

class HomeProvider with ChangeNotifier {
  int _currentIndex = 0;
  int _currentScreen = 0;
  int _currentPage = 0;

  PageController _homePagesController = PageController(initialPage: 0);

  int get currentIndex => _currentIndex;

  int get currentScreen => _currentScreen;

  int get currentPage => _currentPage;

  PageController get homePagesController => _homePagesController;

  List<BottomNavigationBarItem> bottomItems = [
    const BottomNavigationBarItem(
        icon: Icon(
          Icons.keyboard_alt_outlined,
        ),
        label: 'Type'),
    const BottomNavigationBarItem(
        icon: Icon(
          Icons.home_outlined,
        ),
        label: 'Home'),
    const BottomNavigationBarItem(
        icon: Icon(
          Icons.history_outlined,
        ),
        label: 'Record'),
    const BottomNavigationBarItem(
        icon: Icon(
          Icons.settings_outlined,
        ),
        label: 'Setting'),
  ];

  final TextEditingController _textToSpeechController = TextEditingController();

  TextEditingController get textToSpeechController => _textToSpeechController;

  List<String> _addedText = [];

  List<String> get addedText => _addedText;

  int get lengthOfAddedTextList => _addedText.length;

  List<Widget> homePages = [
    const CellsPage(),
  ];
  List<Widget> screens = [
    const TextToSpeechScreen(),
    const HomeScreen(),
    const LastRecordsScreen(),
    const SettingScreen(),
  ];

  void changeBottomNav(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  final List<Cell> _tapedCells = [];

  List<Cell> get tapedCells => _tapedCells;

  int get lengthOfCellsList => _tapedCells.length;

  String get strOfNames =>
      List.generate(lengthOfCellsList, (index) => _tapedCells[index].name)
          .join(' ');

  final ScrollController _scrollController = ScrollController();

  ScrollController get scrollController => _scrollController;

  final GlobalKey<AnimatedListState> _key = GlobalKey();

  GlobalKey<AnimatedListState> get key => _key;

  final FlutterTts _flutterTts = FlutterTts();

  Future<void> onPressedDefault(Cell cell) async {
    final int index = lengthOfCellsList;
    _tapedCells.add(cell);
    await _flutterTts.setLanguage("ar");
    await _flutterTts.setSpeechRate(0.4);
    await _flutterTts.speak(cell.name);
    _key.currentState!
        .insertItem(index, duration: const Duration(milliseconds: 200));
    notifyListeners();
    _scrollToBottom();
  }

  void onPressedBackspace() {
    int index = _tapedCells.length - 1;

    if (_tapedCells.isNotEmpty) {
      Cell removedAt = _tapedCells.removeAt(index);
      _key.currentState!.removeItem(
        index,
        (context, animation) {
          return ScaleTransition(
            alignment: Alignment.centerRight,
            scale: animation,
            child: PressedCell(
              text: removedAt.name,
              imagePath: removedAt.image,
            ),
          );
        },
        duration: const Duration(milliseconds: 200),
      );
      notifyListeners();
    }
  }

  void _scrollToBottom({String from = 'insert'}) {
    if (_tapedCells.length > 5) {
      Future.delayed(
        from == 'insert'
            ? const Duration(milliseconds: 50)
            : const Duration(seconds: 2),
        () {
          int duration = (lengthOfCellsList * 0.3).round();
          scrollController.animateTo(
            _scrollController.position.maxScrollExtent,
            curve: Curves.easeOut,
            duration: from == 'insert'
                ? const Duration(milliseconds: 50)
                : Duration(seconds: duration),
          );
        },
      );
      notifyListeners();
    }
  }

  void _scrollToTop() {
    if (_tapedCells.length > 5) {
      scrollController.animateTo(
        _scrollController.position.minScrollExtent,
        curve: Curves.easeOut,
        duration: const Duration(milliseconds: 300),
      );
      notifyListeners();
    }
  }

  Future<void> speakList() async {
    _scrollToTop();
    await _flutterTts.setLanguage("ar");
    await _flutterTts.setSpeechRate(0.3);
    await _flutterTts.speak(strOfNames);
    _scrollToBottom(from: 'speak');
    insertIntoDatabase(cellsType: 2);
  }

  void addTextToSpeech() {
    deleteTextToSpeech();
    if (textToSpeechController.text.isNotEmpty) {
      String text = textToSpeechController.text;
      _addedText = text.split(' ');
      insertIntoDatabase(cellsType: 1);
      notifyListeners();
    }
  }

  void deleteTextToSpeech() {
    if (_addedText.isNotEmpty) {
      _addedText.clear();
      notifyListeners();
    }
  }

  void speechTextInTexField() async {
    if (_textToSpeechController.text.isNotEmpty) {
      await _flutterTts.setLanguage("ar");
      await _flutterTts.setSpeechRate(0.4);
      await _flutterTts.speak(textToSpeechController.text);
    }
  }

  Database? database;
  List<Map> lastCells = [];

  void createDatabase() {
    openDatabase(
      'my_cells.db',
      version: 7,
      onCreate: (db, version) async {
        print('database created');
        Batch batch = db.batch();
        batch.execute('''CREATE TABLE cell_types(
                                  type_id INTEGER PRIMARY KEY,
                                  type_name TEXT NOT NULL UNIQUE
                                );
                      ''');
        batch.insert('cell_types', {'type_name': 'text'});
        batch.insert('cell_types', {'type_name': 'cells'});

        batch.execute('''CREATE TABLE last_cells(
                                   id INTEGER PRIMARY KEY,
                                   date TEXT NOT NULL,
                                   cells TEXT NOT NULL UNIQUE,
                                   cells_type INTEGER ,
                                   FOREIGN KEY (cells_type)
                                        REFERENCES cell_types (type_id)
                                        ON UPDATE CASCADE
                                        ON DELETE SET NULL
                                );
                            ''');
        await batch.commit().then((value) => print('table created')).catchError(
            (error) => print('Error When batch database ${error.toString()}'));
      },
      onUpgrade: (db, oldVersion, newVersion) async {
        print('database upgrade open');
        // await db
        //     .transaction((txn) async {
        //       await txn.execute(
        //           'CREATE TABLE cell_types(type_id INTEGER PRIMARY KEY,type_name TEXT NOT NULL UNIQUE)');
        //       await txn.insert('cell_types', {'type_name': 'text'});
        //       await txn.insert('cell_types', {'type_name': 'cells'});
        //       await txn
        //           .execute('ALTER TABLE last_cells RENAME TO old_last_cells');
        //       await txn.execute('''CREATE TABLE last_cells(
        //                            id INTEGER PRIMARY KEY,
        //                            date TEXT NOT NULL,
        //                            cells TEXT NOT NULL UNIQUE,
        //                            cells_type INTEGER ,
        //                            FOREIGN KEY (cells_type)
        //                                 REFERENCES cell_types (type_id)
        //                                 ON UPDATE CASCADE
        //                                 ON DELETE SET NULL
        //                         );
        //                     ''');
        //       await txn.execute(
        //           'INSERT INTO last_cells SELECT id,date,cells,1 FROM old_last_cells;');

        //       return null;
        //     })
        //     .then((value) => print('database upgraded'))
        //     .catchError((error) =>
        //         print('Error When upgrade Table ${error.toString()}'));

        //await db.transaction((txn) async{
        //await txn.execute('ALTER TABLE last_cells RENAME TO old_last_cells');
        //await txn.execute('CREATE TABLE last_cells(id INTEGER PRIMARY KEY,date TEXT NOT NULL,cells TEXT NOT NULL UNIQUE)');
        //   await txn.execute('INSERT INTO last_cells SELECT * FROM old_last_cells;');
        // }).then((value) => print('database upgraded')).catchError((error) =>
        //     print('Error When upgrade Table ${error.toString()}'));
      },
      onOpen: (db) async {
        // await db.execute('DROP TABLE old_last_cells;').then((value) {
        //   //getDataFromDatabase(db);
        //   print('table deleted');
        //   return null;
        // });
        getDataFromDatabase(db);
        print('database opened');
      },
    ).then((value) {
      database = value;
    });
  }

  void getDataFromDatabase(Database? database) async {
    await database!
        .rawQuery(
            'select id,strftime(\'%d/%m/%Y\',date) AS date,cells,cells_type from last_cells order by date(date) DESC')
        .then((value) {
      lastCells = value;
      print(lastCells);
      //value.forEach((element) => print(element['cells']));
    });
  }

  insertIntoDatabase({required int cellsType}) async {
    String date = DateFormat('yyyy-MM-dd').format(DateTime.now());
    String cells = cellsType == 1 ? _addedText.join(' ') : strOfNames;
    List<Map<String, Object?>>? checkBeforeInsert = await database?.query(
      'last_cells',
      columns: ['cells'],
      where: 'cells =?',
      whereArgs: [cells],
    );
    if (checkBeforeInsert!.isEmpty) {
      await database
          ?.insert(
        'last_cells',
        {'date': date, 'cells': cells, 'cells_type': cellsType},
        conflictAlgorithm: ConflictAlgorithm.ignore,
      )
          .then((value) {
        print('inserted success');
        getDataFromDatabase(database);
        notifyListeners();
        return null;
      }).catchError((error) {
        print('Error When Inserting New Record  ${error.toString()}');
      });
    } else {
      List<Map<String, Object?>>? checkBeforeUpdate = await database?.query(
        'last_cells',
        columns: ['date', 'cells'],
        where: 'date =? AND cells =?',
        whereArgs: [date, cells],
      );

      if (checkBeforeUpdate!.isEmpty) {
        await database
            ?.update(
          'last_cells',
          {'date': date},
          where: 'cells = ?',
          whereArgs: [cells],
          conflictAlgorithm: ConflictAlgorithm.ignore,
        )
            .then((value) {
          print('updating success');
          getDataFromDatabase(database);
          notifyListeners();
          return null;
        }).catchError((error) {
          print('Error When Inserting New Record  ${error.toString()}');
        });
      }
      //await database?.update('last_cells', values)
    }

    // await database?.rawInsert(
    //     'INSERT OR IGNORE INTO last_cells (date,cells,cells_type) VALUES (?,?,?)',
    //     [date, cells, cellsType]).then((value) {
    //   print('inserted success');
    //   getDataFromDatabase(database);
    //   notifyListeners();
    //   return null;
    // }).catchError((error) {
    //   print('Error When Inserting New Record  ${error.toString()}');
    // });

    //

    //---------------
    //await database!.transaction((txn) {
    //   return txn
    //       .rawInsert(
    //     'INSERT INTO last_cells (date,cells) VALUES ("$formatted","$addTextString")',
    //   )
    //       .then((value) {
    //     print('$value inserted success');
    //     getDataFromDatabase(database);
    //     return null;
    //   }).catchError((error) {
    //     print('Error When Inserting New Record  ${error.toString()}');
    //   });
    //   //return Future(() => null);
    // });
    //print(formatted);
  }

  void showCellsRecord(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.grey[200],
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      context: context,
      builder: (context) => DraggableScrollableSheet(
        expand: false,
        maxChildSize: 0.9,
        builder: (context, scrollController) => CellsRecord(
          scrollController: scrollController,
        ),
      ),
    );
  }

  testOnDatabase() async {
    //var list = await database!.rawQuery('SELECT * FROM old_last_cells');

    // Batch? batch =database?.batch();
    //
    //  batch?.update('last_cells',{'date':'2022-12-23'},where: 'id = 1');
    //  batch?.update('last_cells',{'date':'2022-12-24'},where: 'id = 2');
    //  batch?.update('last_cells',{'date':'2022-12-28'},where: 'id = 3');
    //  batch?.update('last_cells',{'date':'2022-12-29'},where: 'id = 4');
    //
    // Future<List<Object?>>? commit= batch?.commit();
    //
    //
    // print(commit.toString());

    var queryd = await database!.rawQuery(
      'select id,strftime(\'%d/%m/%Y\',date) AS date,cells,cells_type from last_cells order by date(date) DESC',
    );
    print(queryd);

    //getDataFromDatabase(database);
  }

  getdates(String date) {
    DateTime dateConverted = DateTime.parse(date);
    String nowDate = DateFormat('dd/MM/yyyy').format(DateTime.now());
    DateTime dateYesterday = DateTime.now().subtract(const Duration(days: 1));
    if (date == nowDate) {
      print('اليوم');
    }
    print(dateYesterday);
  }
}
