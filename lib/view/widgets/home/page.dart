import 'package:flutter/material.dart';
import 'package:speech_assistance_app/models/cell.dart';
import 'package:speech_assistance_app/shared/components/components.dart';
import 'package:speech_assistance_app/shared/components/constants.dart';

class PageTest extends StatefulWidget {
  PageTest({super.key, required this.data, required this.itemsPerPage});
  final List<Cell> data;
  final int itemsPerPage;
  @override
  State<PageTest> createState() => _PageTestState();
}

class _PageTestState extends State<PageTest> {
  final List<Cell> inCells = cells.sublist(0, 10);

  late List<List<Cell>> _slicedData;
  late PageController controller;

  List<List<Cell>> _sliceData() {
    List<List<Cell>> chunks = [];
    for (int i = 0; i < widget.data.length; i += widget.itemsPerPage) {
      int endIndex = i + widget.itemsPerPage;
      if (endIndex > widget.data.length) {
        endIndex = widget.data.length;
      }
      chunks.add(widget.data.sublist(i, endIndex));
    }
    return chunks;
  }

  @override
  void initState() {
    super.initState();
    _slicedData = _sliceData();
    controller = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemCount: _slicedData.length,
      controller: controller,
      onPageChanged: (value) {
        setState(() {
          controller = PageController(initialPage: value);
        });
      },
      itemBuilder: (context, pageIndex) => Padding(
        padding: const EdgeInsets.all(4.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 5,
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
            childAspectRatio: 5 / 6,
          ),
          scrollDirection: Axis.vertical,
          itemCount: _slicedData[pageIndex].length,
          itemBuilder: (context, itemIndex) =>
              MainCell(cell: _slicedData[pageIndex][itemIndex]),
        ),
      ),
    );
  }
}
