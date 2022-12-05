
import 'package:flutter/material.dart';

class Pressed with ChangeNotifier{
  List _tapedCells=[];

  List get tapedCells=> _tapedCells;

  onPressedDefault(int id){
    _tapedCells.add(id);
    print(_tapedCells);
    notifyListeners();
  }
}