import 'package:flutter/material.dart';
import 'package:speech_assistance_app/data/models/cell_model.dart';
import 'package:speech_assistance_app/shared/components/constants.dart';
import 'package:speech_assistance_app/shared/functions/functions.dart';
import 'package:speech_assistance_app/view/widgets/last_records/cells_type.dart';

class CellTile extends StatelessWidget {
  const CellTile({
    Key? key,
    required this.index,
    required this.cellsRecord,
    this.onTap,
    this.onLongPress,
    this.showOptions = false,
    this.selected = false,
    this.checkBoxOnChanged,
  }) : super(key: key);
  final int index;
  final CellModel cellsRecord;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;
  final bool showOptions;
  final bool selected;
  final void Function(bool?)? checkBoxOnChanged;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 4, right: 8),
      child: SizedBox(
        height: 70,
        child: Center(
          child: ListTile(
            minVerticalPadding: 0,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10),
                    bottomRight: Radius.circular(10))),
            selected: selected,
            selectedTileColor: const Color.fromARGB(255, 221, 221, 245),
            selectedColor: Colors.black,
            leading: CircleAvatar(
              backgroundColor: selected
                  ? Colors.blue
                  : circleAvatarColors[index % circleAvatarColors.length],
              child: selected
                  ? const Icon(
                      Icons.done,
                      color: Colors.white,
                    )
                  : Text(
                      cellsRecord.isCell
                          ? cellsRecord.cells != null
                              ? cellsRecord.cells![0].name[0]
                              : ''
                          : cellsRecord.text![0],
                    ),
            ),
            onTap: onTap,
            onLongPress: onLongPress,
            title: cellsRecord.isCell
                ? CellsType(
                    cells: cellsRecord.cells,
                    isReverse: false,)
                : Container(
                    alignment: Alignment.centerRight,
                    height: double.infinity,
                    child: Text(
                      cellsRecord.text!,
                      textDirection: TextDirection.rtl,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                  ),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  Functions.getCustomDates(DateTime.parse(cellsRecord.date)),
                  style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Colors.grey,
                      fontSize: 12),
                ),
                cellsRecord.isPinned
                    ? const Icon(Icons.push_pin_outlined)
                    : const SizedBox.shrink()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
