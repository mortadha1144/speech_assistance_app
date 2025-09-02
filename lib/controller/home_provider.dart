import 'dart:async';
import 'package:flutter/foundation.dart';
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

  final GlobalKey<AnimatedListState> _key = GlobalKey<AnimatedListState>();

  GlobalKey<AnimatedListState> get key => _key;

  Future<void> onPressedGridView(
      int index, ScrollController scrollController) async {
    Cell cell = displayedItemList[index];
    if (cell.type == 'cell') {
      onPressCell(cell, scrollController);
    } else {
      onTapCategory(cell);
    }
  }

  Future<void> onPressCell(Cell cell, ScrollController scrollController) async {
    final int index = lengthOfCellsList;
    _tapedCells.add(cell);
    await TtsService.speakText(cell.name);

    _key.currentState!
        .insertItem(index, duration: const Duration(milliseconds: 200));
    //to scroll play bar if needed
    scrollPlayBarToBottom(scrollController);
    notifyListeners();
    //_scrollToBottom();
  }

  void scrollPlayBarToBottom(ScrollController scrollController) {
    if (_tapedCells.length > 5) {
      Future.delayed(
        const Duration(milliseconds: 50),
        () {
          scrollController.animateTo(
            scrollController.position.maxScrollExtent,
            curve: Curves.easeOut,
            duration: const Duration(milliseconds: 50),
          );
        },
      );
    }
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

  void onLongPressBackspaceStart(LongPressStartDetails details) {
    if (_tapedCells.isNotEmpty) {
      _key.currentState!
          .removeItem(0, (context, animation) => const SizedBox());
      _tapedCells.clear();
      notifyListeners();
    }
  }

  void onLongPressBackspaceEnd(LongPressEndDetails details) {
    isBackSpaceTappedDown = false;
    notifyListeners();
  }

  bool isBackSpaceTappedDown = false;

  onBackSpaceTapDown(TapDownDetails details) {
    isBackSpaceTappedDown = true;
    notifyListeners();
  }

  onBackSpaceTapUpp(TapUpDetails details) {
    isBackSpaceTappedDown = false;
    notifyListeners();
  }

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool _isCategoryTapped = false;

  bool get enableBack => _isCategoryTapped || _startIndex > _itemsPerScreen;

  List<Cell> _displayedItemList = [];

  List<Cell> get displayedItemList => _displayedItemList;

  int _startIndex = 0;
  late int _startIndexTemp;

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
      _navBarTitle = 'الرئيسية';
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

  Future<void> onTapPlayBar({required String text}) async {
    if (_tapedCells.isNotEmpty) {
      await TtsService.speakText(text);
      await addCell();
    }
  }

  Future<void> addCell() async {
    Box<CellModel> cellsBox = Hive.box<CellModel>(kCellsBox);

    CellModel? matchingCell = cellsBox.values.firstWhere(
      (element) => listEquals(element.cells, _tapedCells),
      orElse: () => CellModel(
        date: '',
        text: 'null',
        isCell: false,
        isPinned: false,
        pinningSerial: 0,
      ),
    );

    if (matchingCell.text != 'null') {
      matchingCell.date = DateTime.now().toString();
      await matchingCell.save();
    } else {
      //create new list to save it in cell model
      List<Cell> currentTabbedCells = List<Cell>.from(_tapedCells);
      CellModel newCell = CellModel.fromHomeScreen(currentTabbedCells);
      await cellsBox.add(newCell);
    }
    afterSaveOrAdd();
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
