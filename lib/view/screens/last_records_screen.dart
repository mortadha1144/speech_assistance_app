import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:speech_assistance_app/shared/components/components.dart';
import 'package:speech_assistance_app/controller/home_provider.dart';
import 'package:speech_assistance_app/controller/last_record_provider.dart';

class LastRecordsScreen extends StatelessWidget {
  const LastRecordsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LastRecordProvider watchProvider = context.watch<LastRecordProvider>();
    HomeProvider homeProvider = context.watch<HomeProvider>();
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
                          watchProvider.selectedCellTiles!.isEmpty
                              ? ''
                              : watchProvider.selectedCellTiles!.length
                                  .toString(),
                          style: const TextStyle(
                              fontSize: 22, fontWeight: FontWeight.w600),
                        ),

                        const SizedBox(
                          width: 20,
                        ),

                        IconButton(
                          onPressed: watchProvider.selectedCellTiles!.length > 1
                              ? null
                              : () {
                                  // watchProvider.pinningCellsTile(
                                  //   watchProvider.selectedCellTiles.single);
                                },
                          icon: const Icon(
                            Icons.push_pin,
                            size: 30,
                          ),
                        ),
                        //   )), watchProvider.selectedCellTilesId
                        //         .single['is_pinned'] ==
                        //     1
                        // ? const Icon(
                        //     Icons.undo,
                        //     size: 30,
                        //   )
                        // : const Icon(
                        //     Icons.push_pin,
                        //     size: 30,
                        //   )),
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
            itemCount: homeProvider.indexedLastCells.length,
            itemBuilder: (context, index1) {
              String keyAtIndex1 =
                  homeProvider.indexedLastCells.keys.elementAt(index1);
              var itemsAtIndex1 = homeProvider.indexedLastCells[keyAtIndex1];
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  keyAtIndex1 == '1'
                      ? const SizedBox.shrink()
                      : ListTile(
                          title: Text(keyAtIndex1),
                        ),
                  // ListView.separated(
                  //   padding: const EdgeInsets.symmetric(horizontal: 8),
                  //   shrinkWrap: true,
                  //   physics: const NeverScrollableScrollPhysics(),
                  //   itemCount: itemsAtIndex1!.length,
                  //   itemBuilder: (context, index2) => CellTile(
                  //     cellsRecord: ,
                  //     onTap: () => watchProvider.onTapCellTile(
                  //       showOptions: watchProvider.showOptions,
                  //       value: watchProvider
                  //           .selectedCellTiles[keyAtIndex1]![index2],
                  //       key: keyAtIndex1,
                  //       index: index2,
                  //       text: itemsAtIndex1[index2]['cells'],
                  //     ),
                  //     showOptions: watchProvider.showOptions,
                  //     onLongPress: () {
                  //       watchProvider.onLongPressCellTile();
                  //       watchProvider.checkBoxOnChanged(
                  //           value: true, key: keyAtIndex1, index: index2);
                  //     },
                  //     selected:
                  //         watchProvider.selectedCellTiles[keyAtIndex1]![index2],
                  //     checkBoxOnChanged: (value) =>
                  //         watchProvider.checkBoxOnChanged(
                  //             value: value!, key: keyAtIndex1, index: index2),
                  //   ),
                  //   separatorBuilder: (context, index) => const SizedBox(
                  //     height: 4,
                  //   ),
                  // ),
                ],
              );
            },
          ),
        )
      ],
    );
  }
}
