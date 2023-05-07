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
        Padding(
          padding: EdgeInsets.only(top: cell.type == 'category' ? 6 : 4),
          child: Text(
            cell.name,
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontSize: 12,
                height: 1.1,
                color: Colors.black,
                fontFamily: 'Cairo',
                fontWeight: FontWeight.bold),
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
