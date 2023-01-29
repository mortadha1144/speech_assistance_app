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
          title: const Text(
            'سجل العبارات المستخدمة',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Colors.blueGrey,
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))
          ],
        ),
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.only(top: 8),
            itemCount: watchProvider.fixedAndNotFixed.length,
            itemBuilder: (context, index1) {
              int keyAtIndex1 =
                  watchProvider.fixedAndNotFixed.keys.elementAt(index1);
              var itemsAtIndex1 = watchProvider
                              .fixedAndNotFixed[keyAtIndex1];
              return Column(
                children: [
                  keyAtIndex1 == 1
                      ? ListView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: itemsAtIndex1.length,
                          itemBuilder: (BuildContext context, int index2) {
                            var elementAtIndex2 = itemsAtIndex1[index2];
                            return CellTile(
                              cellsType: elementAtIndex2['cells_type'],
                              cells: elementAtIndex2['cells'],
                              date: elementAtIndex2['date'],
                              isFixed: true,
                            );
                          },
                        )
                      : ListView.builder(
                          shrinkWrap: true,
                          padding: const EdgeInsets.only(right: 8),
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount:
                          itemsAtIndex1.length,
                          itemBuilder: (context, index2) {
                            String keyAtIndex2 = itemsAtIndex1.keys
                                .elementAt(index2);
                            List<Map> notFixedListAtIndex2 = itemsAtIndex1[keyAtIndex2];
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  keyAtIndex2,
                                ),
                                ListView.builder(
                                  shrinkWrap: true,
                                  padding: const EdgeInsets.only(right: 8),
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: notFixedListAtIndex2.length,
                                  itemBuilder: (context, index3) {
                                    var elementAtIndex3 =
                                        notFixedListAtIndex2[index3];
                                    return CellTile(
                                      cellsType: elementAtIndex3['cells_type'],
                                      cells: elementAtIndex3['cells'],
                                      date: elementAtIndex3['date'],
                                    );
                                  },
                                ),
                              ],
                            );
                          },
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
