import 'package:flutter/material.dart';
import 'package:speech_assistance_app/file_border.dart';
import 'package:speech_assistance_app/table_of_widgets.dart';

import 'cell_widget.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    //double _height = MediaQuery.of(context).size.height / 6;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Speech Assistance App'),
      ),
      body: Container(
        //width: double.infinity,
        //height: double.infinity,
        color: Colors.white,
        child: Center(child: const CellFileBorder()),
      ),
    );
  }
}

GridView gridTest(double itemWidth, double itemHeight) {
  return GridView.count(
    primary: true,
    crossAxisCount: 2,
    childAspectRatio: (itemWidth / itemHeight),
    //controller: ScrollController(keepScrollOffset: false),
    shrinkWrap: false,
    scrollDirection: Axis.vertical,
    children: _buildGridTileList(6, 120),
  );
}

List<Container> _buildGridTileList(int count, double height) => List.generate(
      count,
      (index) => Container(
        padding: const EdgeInsets.all(4),
        child: MyCell(
          height: height,
        ),
      ),
    );
