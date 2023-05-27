import 'package:flutter/material.dart';
import 'package:speech_assistance_app/data/models/cell.dart';

class CellsType extends StatelessWidget {
  const CellsType({
    Key? key,
    required this.cells,
    this.isReverse = true,
    required this.scrollController,
  }) : super(key: key);

  final List<Cell>? cells;
  final bool isReverse;

  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      reverse: isReverse,
      shrinkWrap: true,
      controller: scrollController,
      //physics: const NeverScrollableScrollPhysics(),
      itemCount: cells?.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (BuildContext context, int index) => SizedBox(
        width: MediaQuery.of(context).size.width / 7.5,
        child: Column(
          children: [
            Expanded(
              child: Image.asset(cells != null ? cells![index].image : ''),
            ),
            Text(
              cells != null ? cells![index].name : '',
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: TextStyle(
                fontSize: MediaQuery.of(context).size.height * .016,
                height: 1.1,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
