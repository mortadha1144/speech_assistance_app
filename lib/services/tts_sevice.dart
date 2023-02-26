import 'package:flutter_tts/flutter_tts.dart';

class TtsService {
 static FlutterTts? _flutterTts;

 static FlutterTts get flutterTts  {
    if (_flutterTts != null) return _flutterTts!;
    _flutterTts = FlutterTts();
    return _flutterTts!;
  }

  static Future<void> speakText(String text) async {
    await flutterTts.setLanguage("ar");
    await flutterTts.setSpeechRate(0.4);
    await flutterTts.speak(text);
  }
}
