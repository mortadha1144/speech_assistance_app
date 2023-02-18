import 'package:flutter/foundation.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:provider/provider.dart';
import 'package:speech_assistance_app/models/cells_record.dart';
import 'package:speech_assistance_app/shared/providers/database_provider.dart';

class LastRecordProvider with ChangeNotifier {
  final DatabaseProvider _databaseProvider;
  late Future _cellsRecordList;

  Future get cellRecordList => _cellsRecordList;
  Future _getCellRecordList() async {
    return await _databaseProvider.fetchCellsRecord();
  }

  List<bool> _getSelectedCellsRecord() {
    return _databaseProvider.cellsRecords.map((e) => false).toList();
  }

  void initialCellsRecordList() {
    _cellsRecordList = _getCellRecordList();
    _selectedCellTiles = _getSelectedCellsRecord();
  }

  LastRecordProvider(this._databaseProvider);

  final FlutterTts _flutterTts = FlutterTts();

  bool _showOptions = false;
  bool get showOptions => _showOptions;

  late List<bool> _selectedCellTiles;

  List<bool> get selectedCellTiles => _selectedCellTiles;

  final List<CellsRecord> _selectedCellRecordTiles = [];

  void onLongPressCellTile() {
    _showOptions = !_showOptions;
    notifyListeners();
  }

  void onPressCloseButton() {
    _showOptions = false;
    _selectedCellRecordTiles.clear();
    _selectedCellTiles.fillRange(0, selectedCellTiles.length,false);
    print(selectedCellTiles);
    notifyListeners();
  }

  Future<void> onTapCellTile({
    required CellsRecord cellsRecord,
    required bool value,
    required int index,
  }) async {
    if (showOptions) {
      _selectedCellTiles[index] = !value;
      value
          ? _selectedCellRecordTiles.add(cellsRecord)
          : _selectedCellRecordTiles.remove(cellsRecord);

      //checkBoxOnChanged(value: !value, key: key, index: index);
      if (_selectedCellRecordTiles.isEmpty) {
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
