import 'package:flutter_tts/flutter_tts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:speech_assistance_app/shared/components/constants.dart';

class TtsService {
  static FlutterTts? _flutterTts;

  static FlutterTts get flutterTts {
    if (_flutterTts != null) return _flutterTts!;
    _flutterTts = FlutterTts();
    return _flutterTts!;
  }

  static Future<void> speakText(String text) async {
    bool isVoiceEnabled =
        Hive.box(settingBox).get('enable_voice', defaultValue: true);
    if (isVoiceEnabled) {
     
      await flutterTts.setLanguage("ar");
      await flutterTts.setSpeechRate(0.4);
      await flutterTts.speak(text);
    }
  }
}
