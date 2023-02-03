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
                  ListView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: itemsAtIndex1?.length,
                    itemBuilder: (context, index2) => CellTile(
                      cellsType: itemsAtIndex1![index2]['cells_type'],
                      cells: itemsAtIndex1[index2]['cells'],
                      date: watchProvider
                          .getCustomDates(itemsAtIndex1[index2]['date']),
                      isPinned: itemsAtIndex1[index2]['is_pinned'] == 1
                          ? true
                          : false,
                      onTap: () async {
                        await watchProvider
                            .speakText(itemsAtIndex1[index2]['cells']);
                      },
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
