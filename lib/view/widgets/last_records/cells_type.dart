import 'package:flutter/material.dart';
import 'package:speech_assistance_app/data/models/cell.dart';

class CellsType extends StatelessWidget {
  const CellsType({Key? key, required this.cells, this.isReverse = true})
      : super(key: key);

  final List<Cell>? cells;
  final bool isReverse;

  @override
  Widget build(BuildContext context) {
    //final List<String> list = str.split(' ');
    return ListView.builder(
      reverse: isReverse,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: cells?.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (BuildContext context, int index) => Column(
        children: [
          Expanded(
            child: Image.asset(cells != null ? cells![index].image : ''),
          ),
          Text(
            cells != null ? cells![index].name : '',
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
