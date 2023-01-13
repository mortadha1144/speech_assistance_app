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
            child: ListView.separated(
              shrinkWrap: true,
              itemCount: watchProvider.lastCells.length,
              itemBuilder: (BuildContext context, int index) =>
                  CellTile(index: index),
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(),
            ),
          )
        ],
      ),
    );
  }
}
