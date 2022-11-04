import 'package:flutter/material.dart';

import 'cell_widget.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Speech Assistance App'),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white,
        child: Table(
          border: TableBorder.all(),
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          children: <TableRow>[
            TableRow(
              children: <Widget>[
                Container(
                  height: 150,
                  color: Colors.green,
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.top,
                  child: Container(
                    height: 32,
                    width: 32,
                    color: Colors.red,
                  ),
                ),
                Container(
                  height: 64,
                  color: Colors.blue,
                ),
                Container(
                  height: 64,
                  color: Colors.blue,
                ),
                Container(
                  height: 64,
                  color: Colors.blue,
                ),
              ],
            ),
            TableRow(
              decoration: const BoxDecoration(
                color: Colors.grey,
              ),
              children: <Widget>[
                Container(
                  height: 64,
                  width: 128,
                  color: Colors.purple,
                ),
                Container(
                  height: 32,
                  color: Colors.yellow,
                ),
                Center(
                  child: Container(
                    height: 32,
                    width: 32,
                    color: Colors.orange,
                  ),
                ),
                Center(
                  child: Container(
                    height: 32,
                    width: 32,
                    color: Colors.orange,
                  ),
                ),
                Center(
                  child: Container(
                    height: 32,
                    width: 32,
                    color: Colors.orange,
                  ),
                ),
              ],
            ),
            TableRow(
              decoration: const BoxDecoration(
                color: Colors.grey,
              ),
              children: <Widget>[
                Container(
                  height: 64,
                  width: 128,
                  color: Colors.purple,
                ),
                Container(
                  height: 32,
                  color: Colors.yellow,
                ),
                Center(
                  child: Container(
                    height: 32,
                    width: 32,
                    color: Colors.orange,
                  ),
                ),
                Center(
                  child: Container(
                    height: 32,
                    width: 32,
                    color: Colors.orange,
                  ),
                ),
                Center(
                  child: Container(
                    height: 32,
                    width: 32,
                    color: Colors.orange,
                  ),
                ),
              ],
            ),
            TableRow(
              decoration: const BoxDecoration(
                color: Colors.grey,
              ),
              children: <Widget>[
                Container(
                  height: 64,
                  width: 128,
                  color: Colors.purple,
                ),
                Container(
                  height: 32,
                  color: Colors.yellow,
                ),
                Center(
                  child: Container(
                    height: 32,
                    width: 32,
                    color: Colors.orange,
                  ),
                ),
                Center(
                  child: Container(
                    height: 32,
                    width: 32,
                    color: Colors.orange,
                  ),
                ),
                Center(
                  child: Container(
                    height: 32,
                    width: 32,
                    color: Colors.orange,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  GridView gridTest(double itemWidth, double itemHeight) {
    return GridView.count(
      primary: true,
      crossAxisCount: 2,
      childAspectRatio: (itemWidth / itemHeight),
      //controller: ScrollController(keepScrollOffset: false),
      shrinkWrap: false,
      scrollDirection: Axis.vertical,
      children: _buildGridTileList(6),
    );
  }

  List<Container> _buildGridTileList(int count) => List.generate(
      count,
      (index) =>
          Container(padding: const EdgeInsets.all(4), child: const MyCell()));
}
