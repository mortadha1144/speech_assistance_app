import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'package:speech_assistance_app/controller/last_record_provider.dart';
import 'package:speech_assistance_app/models/cell_model.dart';
import 'package:speech_assistance_app/models/cells_record.dart';
import 'package:speech_assistance_app/services/text_to_speech_services.dart';
import 'package:speech_assistance_app/services/tts_sevice.dart';
import 'package:speech_assistance_app/shared/components/constants.dart';

class TextToSpeechProvider with ChangeNotifier {
  TextEditingController? _textToSpeechController;
  TextToSpeechSevicies? _services;
  GlobalKey<FormState>? _formKey;
  LastRecordProvider? _lastRecordProvider;

  String? text;

  AutovalidateMode? _autovalidateMode;

  AutovalidateMode? get autovalidateMode => _autovalidateMode;

  TextEditingController get textToSpeechController => _textToSpeechController!;
  GlobalKey<FormState> get formKey => _formKey!;

  TextToSpeechProvider() {
    _textToSpeechController = TextEditingController();
    _services = TextToSpeechSevicies();
    _formKey = GlobalKey<FormState>();
    _autovalidateMode = AutovalidateMode.disabled;
  }

  Future<void> speechTheText() async {
    if (_formKey!.currentState!.validate()) {
      await TtsService.speakText(_textToSpeechController!.text);
      print('hello');
    }
  }

  void clearText() {
    if (_textToSpeechController!.text.isNotEmpty) {
      _textToSpeechController!.text = '';
      notifyListeners();
    }
  }

  test() {
    if (_formKey!.currentState!.validate()) {
      formKey.currentState!.save();
      addCell();
    } else {
      _autovalidateMode = AutovalidateMode.always;
      notifyListeners();
    }
  }

  test2() async {
    var cellsBox = await Hive.openBox<CellModel>(kCellsBox);
    var cell = cellsBox.values.toList();
    print(cell[0].date);
  }

  addCell() async {
    CellModel cell = CellModel(
        date: DateTime.now(),
        text: text!,
        isCell: false,
        isPinned: false,
        pinningSerial: 0);
    var cellsBox = Hive.box<CellModel>(kCellsBox);
    await cellsBox.add(cell).then((_) => Fluttertoast.showToast(
        msg: 'تم حفظ النص لاستخدامه لاحقاً في صفحة العبارات المستخدمة',
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        fontSize: 14.0));
  }

  saveText() async {
    if (_formKey!.currentState!.validate()) {
      CellsRecord cellsRecord =
          CellsRecord.fromTextToSpeech(_textToSpeechController!.text);
      await _services!.saveText(cellsRecord.toMap()).then((value) =>
          Fluttertoast.showToast(
              msg: 'تم حفظ النص لاستخدامه لاحقاً في صفحة العبارات المستخدمة',
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.CENTER,
              fontSize: 14.0));
      if (_lastRecordProvider!.isLoading) {
        _lastRecordProvider!.insertCellFromTextToSpeechScreen(cellsRecord);
      }
    }
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
