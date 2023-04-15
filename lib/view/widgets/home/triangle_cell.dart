
import 'package:flutter/cupertino.dart';
import 'package:speech_assistance_app/models/cell.dart';
import 'package:speech_assistance_app/shared/styles/colors.dart';
import 'package:speech_assistance_app/view/widgets/home/cell_content.dart';
import 'package:speech_assistance_app/view/widgets/home/triangle_clip.dart';

class TriangleCell extends StatelessWidget {
  const TriangleCell({
    Key? key,
    required this.cell,
    this.onPressed,
  }) : super(key: key);

  final Cell cell;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    Color borderColor = orangeBorder;
    Color contentColor = orangeContent;
    if (cell.type == 2) {
      borderColor = pinkBorder;
      contentColor = pinkContent;
    }
    if (cell.type == 6) {
      borderColor = blueBorder;
      contentColor = blueContent;
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
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          border: Border.all(
            color: borderColor,
            width: 2,
          ),
          color: borderColor,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: ClipPath(
            clipper: TriangleClip(),
            child: Container(
              color: contentColor,
              child: CellContent(
                cell: cell,
              ),
            ),
          ),
        ),
      ),
    );
  }
}