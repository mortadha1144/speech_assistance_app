import 'package:flutter/material.dart';
import 'package:speech_assistance_app/models/cell_model.dart';
import 'package:speech_assistance_app/shared/functions/functions.dart';
import 'package:speech_assistance_app/view/widgets/last_records/cells_type.dart';

class CellTile extends StatelessWidget {
  const CellTile({
    Key? key,
    required this.cellsRecord,
    this.onTap,
    this.onLongPress,
    this.showOptions = false,
    this.selected = false,
    this.checkBoxOnChanged,
  }) : super(key: key);
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
        height: 60,
        child: ListTile(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10),
                  bottomRight: Radius.circular(10))),
          selected: selected,
          selectedTileColor: const Color.fromARGB(255, 221, 221, 245),
          selectedColor: Colors.black,
          leading: CircleAvatar(
            backgroundColor: selected ? Colors.blue : Colors.pink[100],
            child: selected
                ? const Icon(
                    Icons.done,
                    color: Colors.white,
                  )
                : Text(cellsRecord.text[0]),
          ),
          onTap: onTap,
          onLongPress: onLongPress,
          title: cellsRecord.isCell
              ? CellsType(
                  str: cellsRecord.text,
                  isReverse: false,
                )
              : Text(
                  cellsRecord.text,
                  textDirection: TextDirection.rtl,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w600),
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
    );
  }
}