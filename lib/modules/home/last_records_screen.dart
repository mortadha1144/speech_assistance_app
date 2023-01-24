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
    Iterable keyValue = watchProvider.fixedAndNotFixed.keys;
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
            itemCount: watchProvider.distinctIsFixedOrNotOfLastCells.length,
            itemBuilder: (context, index1) => Column(
              children: [
                keyValue.elementAt(index1) == 1
                    ? const ListTile(
                        title: Text(
                          'مثبتة',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey),
                        ),
                      )
                    : const SizedBox(),
                keyValue.elementAt(index1) == 1
                ? ListView.separated(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: watchProvider
                          .fixedAndNotFixed[keyValue.elementAt(index1)]!.length,
                      itemBuilder: (BuildContext context, int index2) => CellTile(
                        index: index2,
                        keyValue: keyValue.elementAt(index1),
                      ),
                      separatorBuilder: (BuildContext context, int index) =>
                      const Divider(),
                    ):const SizedBox(),
                // ListView.separated(
                //   padding: EdgeInsets.zero,
                //   shrinkWrap: true,
                //   itemCount:keyValue.elementAt(index1)==1? null,
                //   physics: const NeverScrollableScrollPhysics(),
                //   itemBuilder: (BuildContext context, int index2) =>ListView.separated(
                //     padding: EdgeInsets.zero,
                //     shrinkWrap: true,
                //     physics: const NeverScrollableScrollPhysics(),
                //     itemCount: watchProvider
                //         .lastCellsAsMap[keyValue.elementAt(index1)]!.length,
                //     itemBuilder: (BuildContext context, int index2) => CellTile(
                //       index: index2,
                //       keyValue: keyValue.elementAt(index1),
                //     ),
                //     separatorBuilder: (BuildContext context, int index) =>
                //     const Divider(),
                //   ),
                //   separatorBuilder: (BuildContext context, int index) =>
                //   const Divider(),
              ],
            ),
          ),
        )
      ],
    );
  }
}
