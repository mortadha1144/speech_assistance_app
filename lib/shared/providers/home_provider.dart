import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:intl/intl.dart';
import 'package:speech_assistance_app/models/cell/cell.dart';
import 'package:speech_assistance_app/modules/home/home_screen.dart';
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
  }

  void addTextToSpeech() {
    deleteTextToSpeech();
    if (textToSpeechController.text.isNotEmpty) {
      String text = textToSpeechController.text;
      _addedText = text.split(' ');
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
      version: 5,
      onCreate: (db, version) async {
        print('database created');

        await db
            .execute(
              'CREATE TABLE last_cells(id INTEGER PRIMARY KEY,date TEXT,cells TEXT)',
            )
            .then((value) => print('table created'))
            .catchError((error) =>
                print('Error When Creating Table ${error.toString()}'));
      },
      onUpgrade: (db, oldVersion, newVersion) async {
        print('database upgrade open');
        //await db.transaction((txn) async{
        //await txn.execute('ALTER TABLE last_cells RENAME TO old_last_cells');
        //await txn.execute('CREATE TABLE last_cells(id INTEGER PRIMARY KEY,date TEXT NOT NULL,cells TEXT NOT NULL UNIQUE)');
        //   await txn.execute('INSERT INTO last_cells SELECT * FROM old_last_cells;');
        // }).then((value) => print('database upgraded')).catchError((error) =>
        //     print('Error When upgrade Table ${error.toString()}'));
      },
      onOpen: (db) async {
        // await db.execute('DROP TABLE old_last_cells;').then((value) {
        //   getDataFromDatabase(db);
        //   print('database opened');
        //   return null;
        // });
        getDataFromDatabase(db);

        print('database opened');
      },
    ).then((value) {
      database = value;
    });
  }

  void getDataFromDatabase(database) {
    database.rawQuery('SELECT * FROM last_cells').then((value) {
      lastCells = value;
      print(lastCells);
      value.forEach((element) => print(element['cells']));
    });
  }

  insertIntoDatabase() async {
    String addTextString = _addedText.join(' ');
    DateTime dateNow = DateTime.now();
    DateFormat formatter = DateFormat('dd/MM/yyyy');
    String formatted = formatter.format(dateNow);

    await database!.transaction((txn) {
      return txn
          .rawInsert(
        'INSERT INTO last_cells (date,cells) VALUES ("$formatted","$addTextString")',
      )
          .then((value) {
        print('$value inserted success');
        getDataFromDatabase(database);
        return null;
      }).catchError((error) {
        print('Error When Inserting New Record  ${error.toString()}');
      });
      //return Future(() => null);
    });
    //print(formatted);
  }
}
