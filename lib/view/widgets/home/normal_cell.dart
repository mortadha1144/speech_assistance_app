import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:speech_assistance_app/models/cell.dart';
import 'package:speech_assistance_app/shared/styles/colors.dart';
import 'package:speech_assistance_app/view/widgets/home/cell_content.dart';

class NormalCell extends StatelessWidget {
  const NormalCell({
    Key? key,
    required this.cell,
    this.onPressed,
  }) : super(key: key);

  final Cell cell;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    Color borderColor = const Color(0xFF000000);
    Color contentColor = Colors.white;
    if (cell.category == 'word') {
      borderColor = blueBorder;
      contentColor = blueContent;
    } else if (cell.category == 'preposition') {
      borderColor = greenBorder;
      contentColor = greenContent;
    }
    return CupertinoButton(
      onPressed: onPressed,
      padding: const EdgeInsets.all(0),
      child: Container(
        decoration: BoxDecoration(
          color: contentColor,
          borderRadius: BorderRadius.circular(7),
          border: Border.all(
            color: borderColor,
            width: 2,
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: CellContent(
            cell: cell,
          ),
        ),
      ),
    );
  }
}
