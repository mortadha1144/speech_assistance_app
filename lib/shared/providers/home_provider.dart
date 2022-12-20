import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:speech_assistance_app/models/cell/cell.dart';
import 'package:speech_assistance_app/modules/home/home_screen.dart';
import 'package:speech_assistance_app/modules/home/settings_screen.dart';
import 'package:speech_assistance_app/modules/home/text_to_speech_screen.dart';
import 'package:speech_assistance_app/shared/components/components.dart';

class HomeProvider with ChangeNotifier {
  int _currentIndex = 0;
  int _currentScreen = 0;
  int _currentPage = 0;

  PageController _homePagesController = PageController(initialPage: 0);

  int get currentIndex => _currentIndex;

  int get currentScreen => _currentScreen;

  int get currentPage =>_currentPage;

  PageController get homePagesController => _homePagesController;

  List<BottomNavigationBarItem> bottomItems = [
    const BottomNavigationBarItem(
        icon: Icon(
          Icons.keyboard_alt_outlined,
        ),
        label: 'Type'),
    const BottomNavigationBarItem(
        icon: Icon(
          Icons.home_outlined,
        ),
        label: 'Home'),
    const BottomNavigationBarItem(
        icon: Icon(
          Icons.settings_outlined,
        ),
        label: 'Setting'),
  ];

  final TextEditingController _textToSpeechController = TextEditingController();

  TextEditingController get textToSpeechController => _textToSpeechController;

  List<String> _addedText = [];

  List<String> get addedText => _addedText;

  int get lengthOfAddedTextList => _addedText.length;

  List<Widget> homePages = [
    const CellsPage(),
  ];
  List<Widget> screens = [
    const TextToSpeechScreen(),
    const HomeScreen(),
    const SettingScreen(),
  ];

  void changeBottomNav(int index) {
    //check last index to navigate between pages or go to another screen
    // if (_currentIndex < 2) {
    //   if (index < 2) {
    //     _homePagesController
    //         .animateToPage(index,
    //             duration: const Duration(milliseconds: 500),
    //             curve: Curves.easeIn)
    //         .then((value) {
    //       retrieveLastCellsAndTextsOnChangePage(index);
    //       return;
    //     });
    //
    //   } else {
    //     _currentScreen = 1;
    //   }
    // } else {
    //   if (index < 2) {
    //     _homePagesController = PageController(initialPage: index);
    //     Future.delayed(const Duration(milliseconds: 100),() {
    //       retrieveLastCellsAndTextsOnChangeScreen(index);
    //       print(homePagesController.page);
    //       return null;
    //     },);
    //     _currentScreen = 0;
    //   }
    // }
    _currentIndex = index;
    notifyListeners();


    // Future.delayed(const Duration(seconds: 1),() {
    //   print(_homePagesController.page);
    // },);
  }

  void retrieveLastCellsAndTextsOnChangePage(int index){
    if (index == 0) {
      //check if tapped_cells have items then remove it just from play bar
      //and keep it in the tapped cells list
      if (_tapedCells.isNotEmpty) {
        for (int i = _tapedCells.length - 1; i >= 0; i--) {
          _key.currentState!.removeItem(
            i,
                (context, animation) => ScaleTransition(
              scale: animation,
              child: PressedCell(
                  text: _tapedCells[i].name,
                  imagePath: _tapedCells[i].image),
            ),
            duration: const Duration(milliseconds: 100),
          );
        }
      }
      //check if added_text list have items then show them in
      // the play bar
      Future.delayed(
        Duration(milliseconds: _tapedCells.isNotEmpty ? 100 : 0),
            () {
          if (_addedText.isNotEmpty) {
            for (int i = 0; i < _addedText.length; i++) {
              _key.currentState!.insertItem(
                i,
                duration: const Duration(milliseconds: 100),
              );
            }
          }
        },
      );
    } else {
      //check if added_text list have items then remove it just from play bar
      //and keep it in the added_text list
      if (_addedText.isNotEmpty) {
        for (int i = _addedText.length - 1; i >= 0; i--) {
          _key.currentState!.removeItem(
            i,
                (context, animation) => ScaleTransition(
              scale: animation,
              alignment: Alignment.centerRight,
              child: PressedText(text: _addedText[i]),
            ),
            duration: const Duration(milliseconds: 100),
          );
        }
      }
      //check if tapped cells list have cells then show the cells
      // in the play bar
      Future.delayed(
        Duration(milliseconds: _addedText.isNotEmpty ? 100 : 0),
            () {
          if (_tapedCells.isNotEmpty) {
            for (int i = 0; i < _tapedCells.length; i++) {
              _key.currentState!.insertItem(i,
                  duration: const Duration(milliseconds: 100));
            }
          }
        },
      );
    }
  }

  void retrieveLastCellsAndTextsOnChangeScreen(int index){
    if (index==0){
      if (_addedText.isNotEmpty) {
        for (int i = _addedText.length - 1; i >= 0; i--) {
          _key.currentState!.removeItem(
            i,
                (context, animation) => ScaleTransition(
              scale: animation,
              alignment: Alignment.centerRight,
              child: PressedText(text: _addedText[i]),
            ),
            duration: const Duration(milliseconds: 100),
          );
        }
        for (int i = 0; i < _addedText.length; i++) {
          _key.currentState!.insertItem(
            i,
            duration: const Duration(milliseconds: 100),
          );
        }
      }
    }
  }

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
    await _flutterTts.setLanguage("ar");
    await _flutterTts.setSpeechRate(0.4);
    await _flutterTts.speak(cell.name);
    _key.currentState!
        .insertItem(index, duration: const Duration(milliseconds: 200));
    notifyListeners();
    _scrollToBottom();
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

  Future<void> speakList() async {
    _scrollToTop();
    await _flutterTts.setLanguage("ar");
    await _flutterTts.setSpeechRate(0.3);
    await _flutterTts.speak(strOfNames);
    _scrollToBottom(from: 'speak');
  }

  void addTextToSpeech() {
    deleteTextToSpeech();
    if (textToSpeechController.text.isNotEmpty) {
      String text = textToSpeechController.text;
      _addedText = text.split(' ');
      notifyListeners();}
  }

  void deleteTextToSpeech() {
    if (_addedText.isNotEmpty) {
      _addedText.clear();
      notifyListeners();
    }
  }

  void speechTextInTexField() async {
    if (_textToSpeechController.text.isNotEmpty) {
      await _flutterTts.setLanguage("ar");
      await _flutterTts.setSpeechRate(0.4);
      await _flutterTts.speak(textToSpeechController.text);
    }
  }
}
