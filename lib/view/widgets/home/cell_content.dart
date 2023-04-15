import 'package:flutter/material.dart';
import 'package:speech_assistance_app/models/cell.dart';

class CellContent extends StatelessWidget {
  const CellContent({
    Key? key,
    required this.cell,
  }) : super(key: key);

  final Cell cell;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          flex: cell.type == 7 || cell.type == 8 ? 1 : 0,
          child: const SizedBox(),
        ),
        Expanded(
          flex: 6,
          child: Center(
            child: FittedBox(
              fit: BoxFit.contain,
              child: Text(
                cell.type == 0 ? 'المزيد' : cell.name,
                style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 18,
          child: cell.type == 0
              ? const FittedBox(
                  child: Icon(
                    Icons.arrow_forward_rounded,
                    color: Colors.black,
                  ),
                )
              : Image.asset(
                  cell.image,
                  width: double.infinity,
                  fit: BoxFit.fill,
                ),
        ),
      ],
    );
  }
}