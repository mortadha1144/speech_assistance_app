import 'package:flutter/material.dart';
import 'package:speech_assistance_app/models/cell/cell.dart';

class Pressed with ChangeNotifier {
  final List<Cell> _tapedCells = [];
  final ScrollController _controller = ScrollController();

  ScrollController get controller => _controller;

  List<Cell> get tapedCells => _tapedCells;

  onPressedDefault(Cell cell) {
    _tapedCells.add(cell);
    notifyListeners();
    _scrollDown();

  }

  void _scrollDown() {
    if (_tapedCells.length > 7) {
      Future.delayed(const Duration(milliseconds: 300),(){
        _controller.animateTo(_controller.position.maxScrollExtent, duration: const Duration(milliseconds: 500), curve: Curves.easeOut);
        notifyListeners();
      });
    }
  }
}
