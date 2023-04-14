import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:speech_assistance_app/controller/last_record_provider.dart';
import 'package:speech_assistance_app/models/cell_model.dart';
import 'package:speech_assistance_app/services/tts_sevice.dart';
import 'package:speech_assistance_app/shared/components/constants.dart';

class TextToSpeechProvider with ChangeNotifier {
  final TextEditingController _textToSpeechController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  LastRecordProvider? _lastRecordProvider;

  String? text;

  bool isLoading = false;

  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;

  AutovalidateMode get autovalidateMode => _autovalidateMode;

  TextEditingController get textToSpeechController => _textToSpeechController;
  GlobalKey<FormState> get formKey => _formKey;

  Future<void> speechTheText() async {
    if (_formKey.currentState!.validate()) {
      formKey.currentState!.save();
      await TtsService.speakText(text!);
    }
  }

  void clearText() {
    if (_textToSpeechController.text.isNotEmpty) {
      _textToSpeechController.text = '';
      notifyListeners();
    }
  }

  void save() async {
    if (_formKey.currentState!.validate()) {
      formKey.currentState!.save();
      addCell();
    } else {
      _autovalidateMode = AutovalidateMode.always;
      notifyListeners();
    }
  }

  Future<void> addCell() async {
    var cellsBox = Hive.box<CellModel>(kCellsBox);
    var findCells =
        cellsBox.values.where((element) => element.text == text).toList();
    if (findCells.isNotEmpty) {
      var oldCell = findCells.first;
      oldCell.date = DateTime.now().toString();
      isLoading = true;
      await oldCell.save().then((_) {
        afterSaveOrAdd();
      });
    } else {
      CellModel newCell = CellModel.fromTextToSpeechScreen(text!);
      isLoading = true;
      await cellsBox.add(newCell).then((_) {
        afterSaveOrAdd();
      });
    }
  }

  void afterSaveOrAdd() {
    isLoading = false;
    if (_lastRecordProvider?.isLoading ?? false) {
      _lastRecordProvider!.fetchAllCells();
    }
    Fluttertoast.showToast(
        msg: 'تم حفظ النص لاستخدامه لاحقاً في صفحة العبارات المستخدمة',
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        fontSize: 14.0);
    notifyListeners();
  }

  void update(LastRecordProvider lastRecordProvider) {
    _lastRecordProvider = lastRecordProvider;
  }

  String? validator(String? text) {
    if (text?.isEmpty ?? true) {
      return 'يرجي كتابة النص في صندوق النص';
    }
    return null;
  }

  void onSaved(value) {
    text = value;
  }
}
