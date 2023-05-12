import 'package:flutter/cupertino.dart';
import 'package:speech_assistance_app/data/models/cell.dart';
import 'package:speech_assistance_app/shared/functions/functions.dart';
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
    return CupertinoButton(
      onPressed: onPressed,
      padding: const EdgeInsets.all(0),
      child: Container(
        decoration: BoxDecoration(
          color: Functions.getCellColor(cell)['cellContent'],
          borderRadius: BorderRadius.circular(7),
          border: Border.all(
            color: Functions.getCellColor(cell)['cellBorder'] ??
                const Color(0xFF000000),
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
