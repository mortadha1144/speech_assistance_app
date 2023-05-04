import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:speech_assistance_app/data/models/cell.dart';
import 'package:speech_assistance_app/view/widgets/home/cell_content.dart';
import 'package:speech_assistance_app/view/widgets/home/folder_custom_boreder.dart';
import 'package:speech_assistance_app/view/widgets/home/folder_custom_clip.dart';

class FolderCell extends StatelessWidget {
  const FolderCell({
    Key? key,
    required this.cell,
    this.onPressed,
  }) : super(key: key);

  final Cell cell;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    Color borderColor = const Color(0xFF000000);
    if (cell.type == 8) {
      borderColor = Colors.red;
    }
    return CupertinoButton(
      onPressed: onPressed,
      padding: const EdgeInsets.all(0),
      // style: TextButton.styleFrom(
      //   padding: const EdgeInsets.symmetric(
      //     horizontal: 4,
      //     vertical: 4,
      //   ),
      // ),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(7),
          bottomRight: Radius.circular(7),
        ),
        child: ClipPath(
          clipper: FolderCustomClip(),
          child: CustomPaint(
            foregroundPainter: FolderCustomBorder(borderColor: borderColor),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  width: 2,
                  color: borderColor,
                ),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(7),
                  bottomRight: Radius.circular(7),
                ),
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(7),
                  bottomRight: Radius.circular(7),
                ),
                child: CellContent(
                  cell: cell,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}