import 'package:flutter/material.dart';
import 'package:speech_assistance_app/models/cell/cell.dart';
import 'package:speech_assistance_app/shared/components/components.dart';
import 'package:speech_assistance_app/shared/components/constants.dart';

class Pressed with ChangeNotifier {
  final List<Cell> _tapedCells = [];

  int get length => _tapedCells.length;

  final ScrollController _scrollController = ScrollController();

  ScrollController get scrollController => _scrollController;

  final GlobalKey<AnimatedListState> key = GlobalKey();

  List<Cell> get tapedCells => _tapedCells;

  void onPressedDefault(Cell cell) {
    final int index = length;
    _tapedCells.add(cell);
    print(_tapedCells.length);
    key.currentState!
        .insertItem(index, duration: const Duration(milliseconds: 250));
    notifyListeners();
    _scrollToBottom();
  }


  void onPressedBackspace() {
    int index = _tapedCells.length - 1;
    if (_tapedCells.isNotEmpty) {
      Cell removedAt = _tapedCells.removeAt(index);
      key.currentState!.removeItem(
        index,
        (context, animation) {
          return ScaleTransition(
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

  void _scrollToBottom() {
    if (_tapedCells.length > 5) {}
    Future.delayed(
      const Duration(milliseconds: 50),
      () {
        scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          curve: Curves.easeOut,
          duration: const Duration(milliseconds: 50),
        );
        notifyListeners();
      },
    );
  }
}
