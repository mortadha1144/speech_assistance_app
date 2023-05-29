import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:speech_assistance_app/controller/home_provider.dart';
import 'package:speech_assistance_app/data/static/static.dart';
import 'package:speech_assistance_app/shared/functions/functions.dart';
import 'package:speech_assistance_app/view/widgets/home/normal_cell.dart';

class HomeGridView extends StatefulWidget {
  const HomeGridView({super.key, required this.scrollController});
  final ScrollController scrollController;
  @override
  State<HomeGridView> createState() => _HomeGridViewState();
}

class _HomeGridViewState extends State<HomeGridView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final provider = Provider.of<HomeProvider>(context, listen: false);
      provider.fetchData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, provider, child) => Expanded(
        child: provider.isLoading
            ? Padding(
                padding: const EdgeInsets.only(top: 4, right: 4, left: 4),
                child: Stack(children: [
                  LayoutBuilder(
                    builder: (p0, p1) => GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 5,
                        crossAxisSpacing: 4,
                        mainAxisSpacing: 4,
                        childAspectRatio:
                            (p1.maxWidth / 5) / (p1.maxHeight / 6),
                      ),
                      scrollDirection: Axis.vertical,
                      itemCount: provider.displayedItemList.length,
                      itemBuilder: (context, itemIndex) => Functions.getCell(
                          cell: provider.displayedItemList[itemIndex],
                          onPressed: () async {
                            provider.onPressedGridView(
                                itemIndex, widget.scrollController);

                            // _scrollToBottom(provider.tapedCells);
                          }),
                    ),
                  ),
                  if (provider.showMoreCondition)
                    LayoutBuilder(
                      builder: (p0, p1) => Align(
                        alignment: AlignmentDirectional.bottomEnd,
                        child: Container(
                          padding: const EdgeInsets.only(right: 4.0, bottom: 4),
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
              )
            : const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
