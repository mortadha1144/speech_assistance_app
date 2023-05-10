import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:speech_assistance_app/controller/last_record_provider.dart';
import 'package:speech_assistance_app/data/models/cell.dart';
import 'package:speech_assistance_app/data/models/cell_model.dart';
import 'package:speech_assistance_app/data/static/static.dart';
import 'package:speech_assistance_app/services/tts_sevice.dart';
import 'package:speech_assistance_app/shared/components/constants.dart';
import 'package:speech_assistance_app/view/widgets/home/pressed_cell.dart';

class HomeProvider with ChangeNotifier {
  List<Cell> homeCells = [];
  final int itemsPerPage = 29;
  LastRecordProvider? _lastRecordProvider;
  final List<Cell> _tapedCells = [];
  String _navBarTitle = 'الرئيسية';
  String get navBarTitle => _navBarTitle;
  List<Cell> get tapedCells => _tapedCells;

  int get lengthOfCellsList => _tapedCells.length;

  String get strOfNames =>
      List.generate(lengthOfCellsList, (index) => _tapedCells[index].name)
          .join(' ');

  final ScrollController _scrollController = ScrollController();

  ScrollController get scrollController => _scrollController;

  final GlobalKey<AnimatedListState> _key = GlobalKey();

  GlobalKey<AnimatedListState> get key => _key;

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
    await TtsService.speakText(cell.name);

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

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool _isCategoryTapped = false;

  bool get enableBack => _isCategoryTapped || _startIndex > _itemsPerScreen;

  List<Cell> _displayedItemList = [];

  List<Cell> get displayedItemList => _displayedItemList;

  int _startIndex = 0;
  int _startIndexTemp = 0;

  static const int _itemsPerScreen = 29;

  int get startIndex => _startIndex;

  void fetchData() {
    if (!_isLoading) {
      homeCells.addAll(cells);
      updateDisplayedItemList();
      _isLoading = true;
      notifyListeners();
    }
  }

  void updateDisplayedItemList() {
    if (_startIndex + _itemsPerScreen >= homeCells.length) {
      _displayedItemList = homeCells.sublist(_startIndex);
    } else {
      _displayedItemList =
          homeCells.sublist(_startIndex, startIndex + _itemsPerScreen);
    }

    _startIndex += _itemsPerScreen;
    notifyListeners();
  }

  bool get showMoreCondition => _startIndex < homeCells.length;

  void backToFirstDisplayedItemList() {
    //if category tapped & first page
    if (_isCategoryTapped && _startIndex == _itemsPerScreen) {
      homeCells.clear();
      homeCells.addAll(cells);
      //to get last start index befor tap category
      _startIndex = _startIndexTemp - _itemsPerScreen;
      _navBarTitle = 'الرئيسة';
      _isCategoryTapped = false;
      updateDisplayedItemList();
    } else {
      _startIndex -= _itemsPerScreen;
      _displayedItemList =
          homeCells.sublist(_startIndex - _itemsPerScreen, _startIndex);
      notifyListeners();
    }
  }

  onTapCategory(Cell cell) {
    String category = cell.category;
    List<Cell>? categoryList = categories[category];
    if (categoryList?.isNotEmpty ?? false) {
      homeCells.clear();
      homeCells.addAll(categoryList!);
      //to save start index
      _startIndexTemp = _startIndex;
      _startIndex = 0;
      _navBarTitle = cell.name;
      _isCategoryTapped = true;
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
    }
  }

  Future<void> onTapPlayBar({required String text}) async {
    if (_tapedCells.isNotEmpty) {
      _scrollToTop();

      await TtsService.speakText(text);

      _scrollToBottom(from: 'speak');
      await addCell();
    }
  }

  Future<void> addCell() async {
    var cellsBox = Hive.box<CellModel>(kCellsBox);

    String text = _tapedCells.map((e) => e.name).join(' ');
    var findCells =
        cellsBox.values.where((element) => element.text == text).toList();
    if (findCells.isNotEmpty) {
      var oldCell = findCells.first;
      oldCell.date = DateTime.now().toString();
      await oldCell.save().then((_) {
        afterSaveOrAdd();
      });
    } else {
      CellModel newCell = CellModel.fromHomeScreen(_tapedCells);
      await cellsBox.add(newCell).then((_) {
        afterSaveOrAdd();
      });
    }
  }

  void afterSaveOrAdd() {
    if (_lastRecordProvider?.isLoading ?? false) {
      _lastRecordProvider!.fetchAllCells();
    }
  }

  void update(LastRecordProvider lastRecordProvider) {
    _lastRecordProvider = lastRecordProvider;
  }
}
