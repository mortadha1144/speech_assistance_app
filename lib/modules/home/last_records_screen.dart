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
    Iterable<String> keyValue = watchProvider.lastCellsAsMap.keys;
    return Column(
      children: [
        AppBar(
          // systemOverlayStyle: const SystemUiOverlayStyle(
          //   statusBarColor: Colors.blueGrey, // Status bar
          // ),
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
            padding: EdgeInsets.zero,
            itemCount: watchProvider.distinctLastDateOfLastCells.length,
            itemBuilder: (context, index1) => Column(
              children: [
                ListTile(
                  title: Text(
                    keyValue.elementAt(index1),
                    style: const TextStyle(fontSize: 18,fontWeight: FontWeight.w600,color: Colors.grey),
                  ),
                ),
                ListView.separated(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: watchProvider
                      .lastCellsAsMap[keyValue.elementAt(index1)]!.length,
                  itemBuilder: (BuildContext context, int index2) => CellTile(
                    index: index2,
                    keyValue: keyValue.elementAt(index1),
                  ),
                  separatorBuilder: (BuildContext context, int index) =>
                      const Divider(),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
