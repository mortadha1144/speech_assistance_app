import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:speech_assistance_app/models/cells_record.dart';
import 'package:speech_assistance_app/services/text_to_speech_services.dart';
import 'package:speech_assistance_app/services/tts_sevice.dart';

class TextToSpeechProvider with ChangeNotifier {
  TextEditingController? _textToSpeechController;
  TextToSpeechSevicies? _services;

  TextEditingController get textToSpeechController => _textToSpeechController!;

  TextToSpeechProvider() {
    _textToSpeechController = TextEditingController();
    _services = TextToSpeechSevicies();
  }

  Future<void> speechTheText() async {
    if (_textToSpeechController!.text.isEmpty) {
      // ScaffoldMessenger.of(context).showSnackBar(
      //     const SnackBar(content: Text('يرجى كتابة النص في صندوق النص !')));
      Fluttertoast.showToast(
          msg: 'يرجى كتابة النص في صندوق النص !',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          fontSize: 18.0);
    } else {
      await TtsService.speakText(_textToSpeechController!.text);
    }
  }

  void clearText() {
    if (_textToSpeechController!.text.isNotEmpty) {
      _textToSpeechController!.text = '';
      notifyListeners();
    }
  }

  saveText() async {
    if (_textToSpeechController!.text.isEmpty) {
      Fluttertoast.showToast(
          msg: 'يرجى كتابة النص في صندوق النص !',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          fontSize: 18.0);
    } else {
      CellsRecord cellsRecord =
          CellsRecord.fromTextToSpeech(_textToSpeechController!.text);
      await _services!.saveText(cellsRecord.toMap());
    }
  }
}
