import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:intl/intl.dart';
import 'package:speech_assistance_app/models/cell.dart';
import 'package:speech_assistance_app/view/screens/home_screen.dart';
import 'package:speech_assistance_app/view/screens/last_records_screen2.dart';
import 'package:speech_assistance_app/view/screens/settings_screen.dart';
import 'package:speech_assistance_app/shared/components/components.dart';
import 'package:speech_assistance_app/view/screens/text_to_speech_screen2.dart';
import 'package:sqflite/sqflite.dart';

class HomeProvider with ChangeNotifier {
  HomeProvider() {
    init();
  }
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

  String _addedText = '';

  String get addedText => _addedText;

  //int get lengthOfAddedTextList => _addedText.length;

  List<Widget> homePages = [
    const CellsPage(),
  ];
  List<Widget> screens = [
    const TextReader(),
    const HomeScreen(),
    const LastRecordScreen2(),
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
    await speakText(cell.name);
    _key.currentState!
        .insertItem(index, duration: const Duration(milliseconds: 200));
    notifyListeners();
    _scrollToBottom();
  }

  Future<void> speakText(String text) async {
    await _flutterTts.setLanguage("ar");
    await _flutterTts.setSpeechRate(0.4);
    await _flutterTts.speak(text);
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

  Future<void> onTapPlayBar({required String text}) async {
    _scrollToTop();
    await speakText(text);
    _scrollToBottom(from: 'speak');
    insertIntoDatabase(text: text, cellsType: 2);
  }

  // void addTextToSpeech({required CellsRecord cellsRecord}) async {
  //   //deleteTextToSpeech();
  //   if (cellsRecord.cells.isNotEmpty) {
  //     _addedText = cellsRecord.cells;
  //     //await DatabaseProvider().addCells(cellsRecord);
  //     //insertIntoDatabase(text: text, cellsType: 1);
  //     notifyListeners();
  //   }
  // }

  void deleteTextToSpeech() {
    if (_addedText.isNotEmpty) {
      _addedText = '';
      notifyListeners();
    }
  }

  void speechTextInTexField() async {
    if (_textToSpeechController.text.isNotEmpty) {
      await speakText(textToSpeechController.text);
    }
  }

  void checkBoxOnChanged(
      {required bool value, required String key, required int index}) {
    selectedCellTiles[key]![index] = value;
    value
        ? selectedCellTilesId.add({
            'key': key,
            'index': index,
            'id': indexedLastCells[key]![index]['id'],
            'is_pinned': indexedLastCells[key]![index]['is_pinned'],
          })
        : selectedCellTilesId.remove({
            'key': key,
            'index': index,
            'id': indexedLastCells[key]![index]['id'],
            'is_pinned': indexedLastCells[key]![index]['is_pinned'],
          });
    print(selectedCellTilesId);
    print(selectedCellTiles);
    notifyListeners();
  }

  Database? database;
  List<Map> lastCells = <Map>[];
  Set<String> mainListPinnedFirstThenLastCells = <String>{};
  Map<String, List<Map>> indexedLastCells = {};

  Map<String, List<bool>> selectedCellTiles = {};
  List<Map> selectedCellTilesId = [];

  // late Future<List<CellsRecord>> _cellsRecordList;

  // List<CellsRecord> cellsRecords = DatabaseProvider().cellsRecords;

  // Future<List<CellsRecord>> get cellsRecordsList => _cellsRecordList;

  // Future<List<CellsRecord>> _getCellRecordList() async {
  //   final dbProvider = DatabaseProvider();
  //   return await dbProvider.fetchCellsRecord();
  // }

  init() {
    //_cellsRecordList = _getCellRecordList();
  }

  void createDatabase() {
    openDatabase(
      'my_cells.db',
      version: 11,
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
                                   is_pinned BOOLEAN DEFAULT 0,
                                   pinning_serial INTEGER DEFAULT 0,
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
        Batch batch = db.batch();

        batch.execute(
            'ALTER TABLE last_cells RENAME COLUMN is_fixed TO is_pinned;');
        batch.execute(
            'ALTER TABLE last_cells ADD COLUMN pinning_serial INTEGER DEFAULT 0;');

        await batch
            .commit()
            .then((value) => print('database upgraded'))
            .catchError((error) =>
                print('Error When upgrade Table ${error.toString()}'));
      },
      onOpen: (db) async {
        //getDataFromDatabase(db);
        print('database opened');
      },
    ).then((value) {
      database = value;
    });
  }

  void getDataFromDatabase(Database? database) async {
    lastCells = await database!.query('last_cells');
    //to allow sorting in list because it read only
    lastCells = lastCells.map((e) => Map<String, dynamic>.from(e)).toList();
    // multi sort on list
    lastCells.sort((a, b) => sortLastCellsList(a, b));
    print(lastCells);
    // create main set of pinned and since dates
    // mainListPinnedFirstThenLastCells = List<String>.generate(
    //         lastCells.length, (index) => getOneOrSinceDates(lastCells[index]))
    //     .toSet();
    //create indexed map with since dates
    // indexedLastCells = Map.fromIterable(mainListPinnedFirstThenLastCells,
    //     value: (element) => lastCells
    //         .where((element2) => element == getOneOrSinceDates(element2))
    //         .toList());
    //create map to checked cells tile to use it in last records screen
    // selectedCellTiles = Map.fromIterable(
    //   mainListPinnedFirstThenLastCells,
    //   value: (element1) {
    //     return List<bool>.generate(
    //         lastCells
    //             .where((element2) => element1 == getOneOrSinceDates(element2))
    //             .length,
    //         (index) => false);
    //   },
    // );
    print(indexedLastCells);
    print(selectedCellTiles);
  }

  int sortLastCellsList(Map<dynamic, dynamic> a, Map<dynamic, dynamic> b) {
    int result = a['is_pinned'].compareTo(b['is_pinned']);
    if (result == 0) {
      if (a['is_pinned'] == 1) {
        int result2 = a['pinning_serial'].compareTo(b['pinning_serial']);
        if (result2 == 0) {
          return DateTime.parse(b['date']).compareTo(DateTime.parse(a['date']));
        } else {
          return -result2;
        }
      } else {
        return DateTime.parse(b['date']).compareTo(DateTime.parse(a['date']));
      }
    } else {
      return -result;
    }
  }

  insertIntoDatabase({required String text, required int cellsType}) async {
    String date = DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());
    List<Map<String, Object?>>? checkBeforeInsert = await database?.query(
      'last_cells',
      columns: ['cells'],
      where: 'cells =?',
      whereArgs: [text],
    );
    if (checkBeforeInsert!.isEmpty) {
      await database
          ?.insert(
        'last_cells',
        {'date': date, 'cells': text, 'cells_type': cellsType},
        conflictAlgorithm: ConflictAlgorithm.replace,
      )
          .then((value) {
        print('inserted success');
        getDataFromDatabase(database);
        notifyListeners();
      }).catchError((error) {
        print('Error When Inserting New Record  ${error.toString()}');
      });
    } else {
      List<Map<String, Object?>>? checkBeforeUpdate = await database?.query(
        'last_cells',
        columns: ['date', 'cells'],
        where: 'date =? AND cells =?',
        whereArgs: [date, text],
      );

      if (checkBeforeUpdate!.isEmpty) {
        await database
            ?.update(
          'last_cells',
          {'date': date},
          where: 'cells = ?',
          whereArgs: [text],
          conflictAlgorithm: ConflictAlgorithm.ignore,
        )
            .then((value) {
          print('updating success');
          getDataFromDatabase(database);
          notifyListeners();
        }).catchError((error) {
          print('Error When Inserting New Record  ${error.toString()}');
        });
      }
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

  testOnDatabase() async {
    // Batch batch = database!.batch();
    //
    // batch.update(
    //   'last_cells',
    //   {'pinning_serial': 2},
    //   where: 'id=?',
    //   whereArgs: [7],
    //   conflictAlgorithm: ConflictAlgorithm.ignore,
    // );
    // batch.update(
    //   'last_cells',
    //   {'pinning_serial': 1},
    //   where: 'id=?',
    //   whereArgs: [9],
    //   conflictAlgorithm: ConflictAlgorithm.ignore,
    // );
    // await batch.commit().then((value) => print('table updated')).catchError(
    //     (error) => print('Error When batch database ${error.toString()}'));

    //getDataFromDatabase(database);
  }

  //String getOneOrSinceDates(Map<dynamic, dynamic> element) =>
  //element['is_pinned'] == 1 ? '1' : getSinceDates(element['date']);

}
