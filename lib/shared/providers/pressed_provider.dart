
import 'package:flutter/material.dart';
import 'package:speech_assistance_app/models/cell/cell.dart';

class Pressed with ChangeNotifier{
  List<Cell> _tapedCells=[];

  List<Cell> get tapedCells=> _tapedCells;


  onPressedDefault(Cell cell){
    _tapedCells.add(cell);

    print(_tapedCells);
    notifyListeners();

  }


}