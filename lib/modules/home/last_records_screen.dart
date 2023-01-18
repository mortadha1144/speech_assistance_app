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
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppBar(
            systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarColor: Colors.blueGrey, // Status bar
            ),
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
              itemCount: watchProvider.distinctLastDateOfLastCells.length,
              itemBuilder: (context, index1) => Column(
                children: [
                  ListTile(
                    title: Text(
                      watchProvider.lastCellsAsMap.keys.elementAt(index1),
                    ),
                  ),
                  ListView.separated(
                    shrinkWrap: true,
                    itemCount: watchProvider
                        .lastCellsAsMap[watchProvider.lastCellsAsMap.keys
                            .elementAt(index1)]!
                        .length,
                    itemBuilder: (BuildContext context, int index2) => CellTile(
                      index: index2,
                      key1: watchProvider.lastCellsAsMap.keys.elementAt(index1),
                    ),
                    separatorBuilder: (BuildContext context, int index) =>
                        const Divider(),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
