import 'package:flutter/material.dart';
import 'package:speech_assistance_app/models/cell/cell.dart';
import 'package:speech_assistance_app/shared/components/components.dart';
import 'package:speech_assistance_app/shared/components/constants.dart';


class CellFileBorder extends StatelessWidget {
  const CellFileBorder({super.key});

  @override
  Widget build(BuildContext context) {
    return defaultFolderCell(
      text: cells[0].name,
      imagePath: cells[0].image,
    );
  }
}

