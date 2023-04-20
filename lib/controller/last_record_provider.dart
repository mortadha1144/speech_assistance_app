import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:speech_assistance_app/models/cell_model.dart';
import 'package:speech_assistance_app/services/tts_sevice.dart';
import 'package:speech_assistance_app/shared/components/constants.dart';

class LastRecordProvider with ChangeNotifier {
  List<CellModel> _cellsRecordList = [];
  List<CellModel> get cellRecordList => _cellsRecordList;

  bool _isLoading = false;
  bool get isLoading => _isLoading;
//to git index when long press on tile
  int? _onLongPressIndexTile;


  bool _showOptions = false;
  bool get showOptions => _showOptions;

  List<bool>? _isSelectedCellTiles;

  List<bool>? get selectedCellTiles => _isSelectedCellTiles;
  List<bool>? get treuSelectedCellTiles =>
      _isSelectedCellTiles?.where((element) => element == true).toList();

  final List<CellModel> _selectedCellRecordTiles = [];

  List<CellModel> get selectedCellRecordTiles => _selectedCellRecordTiles;

  bool get isSelectedTilePinned =>
      _selectedCellRecordTiles.isEmpty || _selectedCellRecordTiles.length > 1
          ? false
          : _selectedCellRecordTiles.single.isPinned;

  bool get enableDeleteAll => _cellsRecordList.isNotEmpty ? true : false;

//with hive
  fetchAllCells() {
    var cellsBox = Hive.box<CellModel>(kCellsBox);
    _isLoading = true;
    _cellsRecordList = cellsBox.values.toList();
    _cellsRecordList.sort(sortCellsRecordList);
    notifyListeners();
  }

  void onLongPressCellTile(
      {required CellModel cellsRecord, required int index}) {
    _isSelectedCellTiles = List.filled(_cellsRecordList.length, false);
    _isSelectedCellTiles![index] = true;
    _selectedCellRecordTiles.add(cellsRecord);
    _showOptions = !_showOptions;
    _onLongPressIndexTile = index;
    notifyListeners();
  }

  void onPressCloseButton() {
    _showOptions = false;
    _selectedCellRecordTiles.clear();
    _isSelectedCellTiles = null;

    notifyListeners();
  }

  Future<void> onTapCellTile({
    required CellModel cellsRecord,
    required int index,
  }) async {
    if (showOptions) {
      _isSelectedCellTiles![index]
          ? _selectedCellRecordTiles.remove(cellsRecord)
          : _selectedCellRecordTiles.add(cellsRecord);
      _isSelectedCellTiles![index] = !_isSelectedCellTiles![index];
      notifyListeners();
      if (treuSelectedCellTiles!.isEmpty) {
        onPressCloseButton();
      }
    } else {
      await TtsService.speakText(cellsRecord.text);
    }
  }

  pinningCellsTile() async {
    CellModel selectedCell = _cellsRecordList[_onLongPressIndexTile!];
    bool isPinned = selectedCell.isPinned;
    int pinningSerial;
    if (isPinned) {
      isPinned = false;
      pinningSerial = 0;
    } else {
      isPinned = true;
      pinningSerial =
          _cellsRecordList.where((element) => element.isPinned == true).length +
              1;
    }

    selectedCell.isPinned = isPinned;
    selectedCell.pinningSerial = pinningSerial;
    _cellsRecordList.sort(sortCellsRecordList);
    await saveOndb(selectedCell, isPinned, pinningSerial);
  }

  Future<void> saveOndb(
      CellModel selectedCell, bool isPinned, int pinningSerial) async {
    var cellsBox = Hive.box<CellModel>(kCellsBox);
    var findCells = cellsBox.values
        .where((element) => element.text == selectedCell.text)
        .toList();
    if (findCells.isNotEmpty) {
      findCells.first.isPinned = isPinned;
      findCells.first.pinningSerial = pinningSerial;
      await findCells.first.save().then((_) {
        Fluttertoast.showToast(
            msg: isPinned ? 'تم تثبيت العبارة' : 'تم الغاء تثبيت العبارة',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            backgroundColor: Colors.grey[300],
            textColor: Colors.black,
            fontSize: 16.0);
        onPressCloseButton();
      });
    }
  }

  int sortCellsRecordList(CellModel a, CellModel b) {
    int pinningSerial = b.pinningSerial.compareTo(a.pinningSerial);
    if (pinningSerial != 0) return pinningSerial;
    if (a.isPinned != b.isPinned) return a.isPinned ? -1 : 1;
    return DateTime.parse(b.date).compareTo(DateTime.parse(a.date));
  }

  Future<String?> alertDialog(BuildContext context) {
    return showDialog<String>(
      context: context,
      builder: (context) => Directionality(
        textDirection: TextDirection.rtl,
        child: AlertDialog(
          title: const Text('تأكيد حذف العبارات'),
          content: const Text(
              'سيؤدي مسح العبارات الى حذفها نهائياً من سجل العبارات المستخدمة'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'OK'),
              child: const Text('متابعة'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> onPressDelete(BuildContext context) async {
    await alertDialog(context).then((value) async {
      if (value == 'OK') {
        _cellsRecordList.removeWhere(
          (element) => _selectedCellRecordTiles.contains(element),
        );
        var cellsBox = Hive.box<CellModel>(kCellsBox);
        await cellsBox
            .deleteAll(_selectedCellRecordTiles.map((e) => e.key))
            .then((_) {
          Fluttertoast.showToast(
              msg: 'تم حذف العبارات المستخدمة',
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              backgroundColor: Colors.grey[300],
              textColor: Colors.black,
              fontSize: 16.0);
          onPressCloseButton();
        });
      }
    });
  }
  

  deleteAll(dynamic value, BuildContext context) async {
    if (value == 0) {
      await alertDialog(context).then((value) {
        if (value == 'OK') {
          var cellsBox = Hive.box<CellModel>(kCellsBox);
          cellsBox.clear().then((_) {
            Fluttertoast.showToast(
                msg: 'تم حذف العبارات المستخدمة',
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.CENTER,
                backgroundColor: Colors.grey[300],
                textColor: Colors.black,
                fontSize: 16.0);
            _cellsRecordList.clear();
            notifyListeners();
          });
        }
      });
    }
  }
}
