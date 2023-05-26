import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:speech_assistance_app/controller/last_record_provider.dart';
import 'package:speech_assistance_app/data/models/cell.dart';

class CellsType extends StatefulWidget {
  const CellsType({
    Key? key,
    required this.cells,
    this.isReverse = true,
  }) : super(key: key);

  final List<Cell>? cells;
  final bool isReverse;

  @override
  State<CellsType> createState() => _CellsTypeState();
}

class _CellsTypeState extends State<CellsType> {
  @override
  Widget build(BuildContext context) {
    //final List<String> list = str.split(' ');
    return Consumer<LastRecordProvider>(
      builder:(context, value, child) =>  ListView.builder(
        padding: EdgeInsets.zero,
        reverse: widget.isReverse,
        shrinkWrap: true,
        //physics: const NeverScrollableScrollPhysics(),
        itemCount: widget.cells?.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) => SizedBox(
          width: MediaQuery.of(context).size.width / 7.5,
          child: Column(
            children: [
              Expanded(
                child: Image.asset(widget.cells != null ? widget.cells![index].image : ''),
              ),
              Text(
                widget.cells != null ? widget.cells![index].name : '',
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
      ),
    );
  }
}
