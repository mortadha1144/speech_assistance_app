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
      provider.fetchData();
    });
    // _slicedData = _sliceData();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, provider, child) => provider.isLoading
          ? Column(
              //itemCount: provider.sliceData.length,
              //controller: provider.pagesController,
              // onPageChanged: (value) {
              //   setState(() {
              //     controller = PageController(initialPage: value);
              //   });
              // },
              //itemBuilder: (context, pageIndex) => Padding(
              // padding: const EdgeInsets.all(4.0),
              children: [
                  Container(
                    height: MediaQuery.of(context).size.height / 24,
                    color: Colors.black,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        provider.enableBack
                            ? Expanded(
                                child: Row(
                                  children: [
                                    TextButton(
                                        onPressed: provider
                                            .backToFirstDisplayedItemList,
                                        child: const Text('الرئيسية')),
                                  ],
                                ),
                              )
                            : const Spacer(),
                        const Text(
                          'الرئيسية',
                          style: TextStyle(color: Colors.white),
                        ),
                        const Spacer()
                      ],
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 6.0),
                      child: Stack(alignment: Alignment.center, children: [
                        GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 5,
                            crossAxisSpacing: 5,
                            mainAxisSpacing: 6,
                            childAspectRatio: 5 / 6,
                          ),
                          scrollDirection: Axis.vertical,
                          itemCount: provider.displayedItemList.length,
                          itemBuilder: (context, itemIndex) => MainCell(
                            cell: provider.displayedItemList[itemIndex],
                          ),
                        ),
                        if (provider.showMoreCondition)
                          LayoutBuilder(
                            builder: (p0, p1) => Align(
                              alignment: AlignmentDirectional.bottomEnd,
                              child: Container(
                                padding: const EdgeInsets.only(
                                    right: 4.0, bottom: 8.0),
                                width: p1.maxWidth / 5,
                                height: p1.maxHeight / 6,
                                child: NormalCell(
                                  cell: moreCell,
                                  onPressed: provider.updateDisplayedItemList,
                                ),
                              ),
                            ),
                          )
                      ]),
                    ),
                  ),

                  // if (provider.showMoreCondition)
                  //   ElevatedButton(
                  //       onPressed: provider.updateDisplayedItemList,
                  //       child: const Text('show more'))
                ])
          : const Center(child: CircularProgressIndicator()),
    );
  }
}
