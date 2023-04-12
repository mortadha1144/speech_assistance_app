import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:speech_assistance_app/controller/home_provider.dart';
import 'package:speech_assistance_app/models/cell.dart';
import 'package:speech_assistance_app/shared/components/components.dart';
import 'package:speech_assistance_app/shared/components/constants.dart';

class PageTest extends StatefulWidget {
  PageTest({super.key});
  @override
  State<PageTest> createState() => _PageTestState();
}

class _PageTestState extends State<PageTest> {
  //late List<List<Cell>> _slicedData;

  // List<List<Cell>> _sliceData() {
  //   List<List<Cell>> chunks = [];
  //   for (int i = 0; i < widget.data.length; i += widget.itemsPerPage) {
  //     int endIndex = i + widget.itemsPerPage;
  //     if (endIndex > widget.data.length) {
  //       endIndex = widget.data.length;
  //     }
  //     chunks.add(widget.data.sublist(i, endIndex));
  //   }
  //   return chunks;
  // }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final provider = Provider.of<HomeProvider>(context, listen: false);
      provider.initScreen();
    });
    // _slicedData = _sliceData();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, provider, child) => provider.isLoading
          ? PageView.builder(
              itemCount: provider.sliceData.length,
              controller: provider.pagesController,
              // onPageChanged: (value) {
              //   setState(() {
              //     controller = PageController(initialPage: value);
              //   });
              // },
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
                  itemCount: provider.sliceData[pageIndex].length,
                  itemBuilder: (context, itemIndex) =>
                      MainCell(cell: provider.sliceData[pageIndex][itemIndex]),
                ),
              ),
            )
          : const Center(child: CircularProgressIndicator()),
    );
  }
}
