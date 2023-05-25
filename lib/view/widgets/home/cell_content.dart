import 'package:auto_size_text/auto_size_text.dart';
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
            overflow: TextOverflow.ellipsis,
            //minFontSize: 8,
            maxLines: 2,
            style: TextStyle(
                fontSize: MediaQuery.of(context).size.height * .018,
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
