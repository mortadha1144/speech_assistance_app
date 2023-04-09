import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:speech_assistance_app/models/cell.dart';
import 'package:speech_assistance_app/shared/components/constants.dart';
import 'package:speech_assistance_app/shared/components/components.dart';

class HomeProvider with ChangeNotifier {
 
  int _currentPage = 0;

  PageController _homePagesController = PageController(initialPage: 0);

  


  int get currentPage => _currentPage;

  PageController get homePagesController => _homePagesController;
  List<Widget> homePages = [
    const CellsPage(),
  ];
 
 
  final List<Cell> _tapedCells = [];

  List<Cell> get tapedCells => _tapedCells;

  int get lengthOfCellsList => _tapedCells.length;

  String get strOfNames =>
      List.generate(lengthOfCellsList, (index) => _tapedCells[index].name)
          .join(' ');

  final ScrollController _scrollController = ScrollController();

  ScrollController get scrollController => _scrollController;

  final GlobalKey<AnimatedListState> _key = GlobalKey();

  GlobalKey<AnimatedListState> get key => _key;

  final FlutterTts _flutterTts = FlutterTts();

  Future<void> onPressedDefault(Cell cell) async {
    final int index = lengthOfCellsList;
    _tapedCells.add(cell);
    bool isVoiceEnabled =
        Hive.box(settingBox).get('enable_voice', defaultValue: true);
    if (isVoiceEnabled) {
      await speakText(cell.name);
    }

    _key.currentState!
        .insertItem(index, duration: const Duration(milliseconds: 200));
    notifyListeners();
    _scrollToBottom();
  }

  Future<void> speakText(String text) async {
    await _flutterTts.setLanguage("ar");
    await _flutterTts.setSpeechRate(0.4);
    await _flutterTts.speak(text);
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
      notifyListeners();
    }
  }

  Future<void> onTapPlayBar({required String text}) async {
    _scrollToTop();
    bool isVoiceEnabled =
        Hive.box(settingBox).get('enable_voice', defaultValue: true);
    if (isVoiceEnabled) {
      await speakText(text);
    }

    _scrollToBottom(from: 'speak');
    //TODO
    //change to insert to hive
    //insertIntoDatabase(text: text, cellsType: 2);
  }

 

 
  

  

  
   

}
