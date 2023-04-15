import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:speech_assistance_app/models/cell.dart';
import 'package:speech_assistance_app/shared/components/constants.dart';
import 'package:speech_assistance_app/shared/components/components.dart';
import 'package:speech_assistance_app/view/widgets/home/page.dart';

class HomeProvider with ChangeNotifier {
  int _currentPage = 0;

  PageController _pagesController = PageController(initialPage: 0);

  int get currentPage => _currentPage;

  PageController get pagesController => _pagesController;
  List<Widget> homePages = [
    const CellsPage(),
    //PageTest(data: cells.sublist(0, 29), itemsPerPage: 30),
  ];

  List<Cell> homeCells = [];
  final int itemsPerPage = 29;

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

  Future<void> onPressedGridView(int index) async {
    Cell cell = displayedItemList[index];
    if (cell.type == 'cell') {
      onPressCell(cell);
    } else {
      onTapCategory(cell);
    }
  }

  Future<void> onPressCell(Cell cell) async {
    final int index = lengthOfCellsList;
    _tapedCells.add(cell);
    bool isVoiceEnabled =
        Hive.box(settingBox).get('enable_voice', defaultValue: true);
    if (isVoiceEnabled) {
      await speakText(cell.name);
    }

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

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool _enableBack = false;
  bool get enableBack => _enableBack;
  List<List<Cell>> _slicedData = [];

  List<Cell> _displayedItemList = [];

  List<Cell> get displayedItemList => _displayedItemList;

  int _startIndex = 0;

  static const int _itemsPerScreen = 29;

  int get startIndex => _startIndex;

  void fetchData() {
    homeCells.addAll(cells);
    updateDisplayedItemList();
    _isLoading = true;
    notifyListeners();
  }

  void updateDisplayedItemList() {
    if (startIndex + _itemsPerScreen >= homeCells.length) {
      _displayedItemList = homeCells.sublist(startIndex);
    } else {
      _displayedItemList =
          homeCells.sublist(startIndex, startIndex + _itemsPerScreen);
    }
    _startIndex += _itemsPerScreen;
    notifyListeners();
  }

  bool get showMoreCondition => startIndex < homeCells.length;

  void backToFirstDisplayedItemList() {
    _startIndex = 0;
    _enableBack = false;
    homeCells
      ..clear()
      ..addAll(cells);
    displayedItemList.clear();
    updateDisplayedItemList();
  }

  onTapCategory(Cell cell) {
    String category = cell.category;
    List<Cell>? categoryList = categories[category];
    if (categoryList?.isNotEmpty ?? false) {
      List<Cell> tempList = [];
      tempList.addAll(cells);
      tempList.insertAll(29 - categoryList!.length, categoryList);
      tempList.removeWhere((element) => element.type == 'folder');
      homeCells = tempList;
      _startIndex = 0;
      _enableBack = true;
      displayedItemList.clear();
      updateDisplayedItemList();
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
    bool isVoiceEnabled =
        Hive.box(settingBox).get('enable_voice', defaultValue: true);
    if (isVoiceEnabled) {
      await speakText(text);
    }

    _scrollToBottom(from: 'speak');
    //TODO
    //change to insert to hive
    //insertIntoDatabase(text: text, cellsType: 2);
  }
}
