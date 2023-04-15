import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:speech_assistance_app/controller/home_provider.dart';
import 'package:speech_assistance_app/shared/components/constants.dart';
import 'package:speech_assistance_app/shared/functions/functions.dart';
import 'package:speech_assistance_app/view/widgets/home/normal_cell.dart';

class HomeGridView extends StatefulWidget {
  const HomeGridView({super.key});
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
            ? Stack(children: [
                GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 5,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 5,
                      childAspectRatio: 5 / 6),
                  scrollDirection: Axis.vertical,
                  itemCount: provider.displayedItemList.length,
                  itemBuilder: (context, itemIndex) => Functions.getCell(
                      cell: provider.displayedItemList[itemIndex],
                      onPressed: () => provider.onPressedGridView(itemIndex)),
                ),
                // if (provider.showMoreCondition)
                //   LayoutBuilder(
                //     builder: (p0, p1) => Align(
                //       alignment: AlignmentDirectional.bottomEnd,
                //       child: Container(
                //         padding:
                //             const EdgeInsets.only(right: 4.0, bottom: 8.0),
                //         width: p1.maxWidth / 5,
                //         height: p1.maxHeight / 6,
                //         child: NormalCell(
                //           cell: moreCell,
                //           onPressed: provider.updateDisplayedItemList,
                //         ),
                //       ),
                //     ),
                //   )
              ])
            : const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
