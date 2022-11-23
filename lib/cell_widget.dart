import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:speech_assistance_app/models/cell/cell.dart';
import 'package:speech_assistance_app/shared/components/components.dart';
import 'package:speech_assistance_app/shared/components/constants.dart';

class MyCell extends StatelessWidget {
  const MyCell({required this.height,super.key});

  final double height;

  @override
  Widget build(BuildContext context) {
    return defaultCell(
      text: cells[0].name,
      imagePath: cells[0].image,
    );
  }
}
