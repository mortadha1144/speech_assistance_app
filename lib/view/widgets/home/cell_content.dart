import 'package:flutter/material.dart';
import 'package:speech_assistance_app/data/models/cell.dart';

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
          flex: cell.type == 'folder' ? 1 : 0,
          child: const SizedBox(),
        ),
        Expanded(
          flex: 6,
          child: Center(
            child: FittedBox(
              fit: BoxFit.contain,
              child: Text(
                cell.name,
                style: const TextStyle(
                    fontSize: 12,
                    color: Colors.black,
                    fontFamily: 'Cairo',
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 18,
          child: Image.asset(
            cell.image,
            width: double.infinity,
            fit: BoxFit.fill,
          ),
        ),
      ],
    );
  }
}
