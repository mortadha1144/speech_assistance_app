import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:speech_assistance_app/controller/home_provider.dart';
import 'package:speech_assistance_app/shared/components/components.dart';
import 'package:speech_assistance_app/shared/components/constants.dart';
import 'package:speech_assistance_app/shared/functions/functions.dart';

class PageTest extends StatefulWidget {
  const PageTest({super.key});
  @override
  State<PageTest> createState() => _PageTestState();
}

class _PageTestState extends State<PageTest> {
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
      builder: (context, provider, child) => provider.isLoading
          ? Column(children: [
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
                                    onPressed:
                                        provider.backToFirstDisplayedItemList,
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
                      itemBuilder: (context, itemIndex) => Functions.getCell(
                          cell: provider.displayedItemList[itemIndex],
                          onPressed: () =>
                              provider.onPressedGridView(itemIndex)),
                    ),
                    if (provider.showMoreCondition)
                      LayoutBuilder(
                        builder: (p0, p1) => Align(
                          alignment: AlignmentDirectional.bottomEnd,
                          child: Container(
                            padding:
                                const EdgeInsets.only(right: 4.0, bottom: 8.0),
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
            ])
          : const Center(child: CircularProgressIndicator()),
    );
  }
}
