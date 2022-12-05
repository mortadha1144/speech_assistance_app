import 'package:flutter/material.dart';
import 'package:speech_assistance_app/models/cell/cell.dart';
import 'package:speech_assistance_app/shared/components/components.dart';
import 'package:speech_assistance_app/shared/components/constants.dart';

class Pressed with ChangeNotifier {
  final List<Cell> _tapedCells = [];

  final ScrollController _scrollController = ScrollController();

  ScrollController get scrollController => _scrollController;

  List<Cell> get tapedCells => _tapedCells;

  void onPressedDefault(Cell cell) {
    _tapedCells.add(cell);
    notifyListeners();
    _scrollToBottom();
  }

  void onPressedBackspace() {
    if (_tapedCells.isNotEmpty) {
      _tapedCells.removeLast();
      notifyListeners();
    }
  }

  void _scrollToBottom() {
    if (_tapedCells.length > 6) {}
    Future.delayed(
      const Duration(milliseconds: 100),
      () {
        scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          curve: Curves.easeOut,
          duration: const Duration(milliseconds: 100),
        );
        notifyListeners();
      },
    );
  }
}
