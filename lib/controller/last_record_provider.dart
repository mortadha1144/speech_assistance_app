import 'package:flutter/foundation.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:speech_assistance_app/models/cells_record.dart';
import 'package:speech_assistance_app/services/last_records_sevices.dart';

class LastRecordProvider with ChangeNotifier {
  List<CellsRecord> _cellsRecordList = [];
  LastRecordSevices? _services;

  bool _isLoading = false;

  List<CellsRecord> get cellRecordList => _cellsRecordList;

  bool get isLoading => _isLoading;

  void getData() async {
    await _services!.readData().then((value) {
      final List<Map<String, dynamic>> converted =
          List<Map<String, dynamic>>.from(value);
      List<CellsRecord> nList = List.generate(
        converted.length,
        (index) => CellsRecord.fromDatabase(converted[index]),
      );
      _cellsRecordList = nList;
      _isLoading = true;
      notifyListeners();
    });
  }

  LastRecordProvider() {
    _services = LastRecordSevices();

    // if(_cellsRecordList.isNotEmpty){

    // }
  }

  final FlutterTts _flutterTts = FlutterTts();

  bool _showOptions = false;
  bool get showOptions => _showOptions;

  List<bool>? _selectedCellTiles;

  List<bool>? get selectedCellTiles => _selectedCellTiles;
  List<bool>? get treuSelectedCellTiles =>
      _selectedCellTiles?.where((element) => element == true).toList();

  final List<CellsRecord> _selectedCellRecordTiles = [];

  List<CellsRecord> get selectedCellRecordTiles => _selectedCellRecordTiles;

  void onLongPressCellTile(
      {required CellsRecord cellsRecord, required int index}) {
    _selectedCellTiles = List.filled(_cellsRecordList.length, false);
    _selectedCellTiles![index] = true;
    _selectedCellRecordTiles.add(cellsRecord);
    _showOptions = !_showOptions;
    notifyListeners();
  }

  void onPressCloseButton() {
    _showOptions = false;
    _selectedCellRecordTiles.clear();
    _selectedCellTiles = null;
    notifyListeners();
  }

  Future<void> onTapCellTile({
    required CellsRecord cellsRecord,
    required int index,
  }) async {
    if (showOptions) {
      _selectedCellTiles![index]
          ? _selectedCellRecordTiles.remove(cellsRecord)
          : _selectedCellRecordTiles.add(cellsRecord);
      _selectedCellTiles![index] = !_selectedCellTiles![index];
      notifyListeners();
      print(_selectedCellRecordTiles.length);
      //checkBoxOnChanged(value: !value, key: key, index: index);
      if (treuSelectedCellTiles!.isEmpty) {
        onPressCloseButton();
      }
    } else {
      await speakText(cellsRecord.cells);
    }
  }

  Future<void> speakText(String text) async {
    await _flutterTts.setLanguage("ar");
    await _flutterTts.setSpeechRate(0.4);
    await _flutterTts.speak(text);
  }

  void insertFromAnotherScreen(CellsRecord cellsRecord) {
    _cellsRecordList.add(cellsRecord);
  }

  void insertCellFromTextToSpeechScreen(CellsRecord cell) {
    _cellsRecordList.insert(0, cell);
    notifyListeners();
  }

  pinningCellsTile(Map item) async {
    // Map element = indexedLastCells[item['key']]!.removeAt(item['index']);
    // bool element2 = selectedCellTiles[item['key']]!.removeAt(item['index']);

    // if (element['is_pinned'] == 0) {
    //   element['is_pinned'] = 1;
    //   bool findOnekey = indexedLastCells.keys.contains('1');
    //   if (findOnekey) {
    //     indexedLastCells['1']!.add(element);
    //     selectedCellTiles['1']!.add(element2);
    //   } else {
    //     indexedLastCells['1'] = [element];
    //     selectedCellTiles['1'] = [false];
    //   }
    // } else {
    //   element['is_pinned'] = 0;
    //   String getSinceDate = getSinceDates(element['date']);
    //   bool findSinceDate = indexedLastCells.keys.contains(getSinceDate);
    //   if (findSinceDate) {
    //     indexedLastCells[getSinceDate]!.add(element);
    //     indexedLastCells[getSinceDate]!.sort(
    //       (a, b) =>
    //           DateTime.parse(b['date']).compareTo(DateTime.parse(a['date'])),
    //     );
    //     selectedCellTiles[getSinceDate]!.add(element2);
    //   } else {
    //     indexedLastCells[getSinceDate] = [element];
    //     selectedCellTiles[getSinceDate] = [false];
    //   }
    // }

    // onPressCloseButton();
    // lastCells.sort((a, b) => sortLastCellsList(a, b));
    // print(lastCells);
    // // create main set of pinned and since dates
    // mainListPinnedFirstThenLastCells = List<String>.generate(
    //     lastCells.length, (index) => getOneOrSinceDates(lastCells[index]))
    //     .toSet();
    // //create indexed map with since dates
    // indexedLastCells = Map.fromIterable(mainListPinnedFirstThenLastCells,
    //     value: (element) => lastCells
    //         .where((element2) => element == getOneOrSinceDates(element2))
    //         .toList());
    // //create map to checked cells tile to use it in last records screen
    // selectedCellTiles = Map.fromIterable(
    //   mainListPinnedFirstThenLastCells,
    //   value: (element1) {
    //     return List<bool>.generate(
    //         lastCells
    //             .where((element2) => element1 == getOneOrSinceDates(element2))
    //             .length,
    //             (index) => false);
    //   },
    // );
    //
    // await database
    // ?.update(
    // 'last_cells',
    // {'is_pinned': 1},
    // where: 'id = ?',
    // whereArgs: [id],
    // conflictAlgorithm: ConflictAlgorithm.ignore,
    // )
    //     .then((value) {
    // print('updating success');
    // getDataFromDatabase(database);
    // notifyListeners();
    // }).catchError((error) {
    // print('Error When Inserting New Record  ${error.toString()}');
    // });
  }
}
