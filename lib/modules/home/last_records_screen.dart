import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:speech_assistance_app/shared/components/components.dart';
import 'package:speech_assistance_app/shared/providers/home_provider.dart';

class LastRecordsScreen extends StatelessWidget {
  const LastRecordsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeProvider watchProvider = context.watch<HomeProvider>();
    //Iterable watchProvider.fixedAndNotFixed.keys = watchProvider.fixedAndNotFixed.keys;
    return Column(
      children: [
        AppBar(
          title: watchProvider.showOptions
              ? IconButton(
                  onPressed: () => watchProvider.onPressCloseButton(),
                  icon: const Icon(
                    Icons.close,
                    size: 30,
                  ))
              : const Text(
                  'العبارات المستخدمة',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                  ),
                ),
          backgroundColor: Colors.blueGrey,
          actions: watchProvider.showOptions
              ? [
                  Padding(
                    padding: const EdgeInsets.only(left: 12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          watchProvider.selectedCellTilesId.isEmpty
                              ? ''
                              : watchProvider.selectedCellTilesId.length
                                  .toString(),
                          style: const TextStyle(
                              fontSize: 22, fontWeight: FontWeight.w600),
                        ),

                        const SizedBox(
                          width: 20,
                        ),

                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.push_pin,
                              size: 30,
                            )),
                        const SizedBox(
                          width: 15,
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.delete,
                              size: 30,
                            )),

                        //const Spacer(),
                      ],
                    ),
                  )
                ]
              : [
                  IconButton(
                      onPressed: () {}, icon: const Icon(Icons.more_vert)),
                ],
        ),
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.only(top: 8),
            itemCount: watchProvider.indexedLastCells.length,
            itemBuilder: (context, index1) {
              String keyAtIndex1 =
                  watchProvider.indexedLastCells.keys.elementAt(index1);
              var itemsAtIndex1 = watchProvider.indexedLastCells[keyAtIndex1];
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  keyAtIndex1 == '1'
                      ? const SizedBox.shrink()
                      : ListTile(
                          title: Text(keyAtIndex1),
                        ),
                  ListView.separated(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: itemsAtIndex1!.length,
                    itemBuilder: (context, index2) => CellTile(
                      cellsType: itemsAtIndex1[index2]['cells_type'],
                      cells: itemsAtIndex1[index2]['cells'],
                      date: watchProvider
                          .getCustomDates(itemsAtIndex1[index2]['date']),
                      isPinned: itemsAtIndex1[index2]['is_pinned'] == 1
                          ? true
                          : false,
                      onTap: () async {
                        if (watchProvider.showOptions) {
                          bool value = !watchProvider
                              .selectedCellTiles[keyAtIndex1]![index2];
                          watchProvider.checkBoxOnChanged(
                              value: value, key: keyAtIndex1, index: index2);
                        } else {
                          await watchProvider
                              .speakText(itemsAtIndex1[index2]['cells']);
                        }
                      },
                      showOptions: watchProvider.showOptions,
                      onLongPress: () {
                        watchProvider.onLongPressCellTile();
                        watchProvider.checkBoxOnChanged(
                            value: true, key: keyAtIndex1, index: index2);
                      },
                      selected:
                          watchProvider.selectedCellTiles[keyAtIndex1]![index2],
                      checkBoxOnChanged: (value) =>
                          watchProvider.checkBoxOnChanged(
                              value: value!, key: keyAtIndex1, index: index2),
                    ),
                    separatorBuilder: (context, index) => const SizedBox(
                      height: 4,
                    ),
                  ),
                ],
              );
            },
          ),
        )
      ],
    );
  }
}
