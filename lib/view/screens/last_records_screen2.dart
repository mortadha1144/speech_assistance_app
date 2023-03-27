import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:speech_assistance_app/shared/components/components.dart';
import 'package:speech_assistance_app/controller/last_record_provider.dart';

class LastRecordScreen2 extends StatefulWidget {
  const LastRecordScreen2({super.key});

  @override
  State<LastRecordScreen2> createState() => _LastRecordScreen2State();
}

class _LastRecordScreen2State extends State<LastRecordScreen2> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final provider = Provider.of<LastRecordProvider>(context, listen: false);
      if (!provider.isLoading) {
        provider.getData();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<LastRecordProvider>(
      builder: (context, value, child) => Column(children: [
        AppBar(
          title: value.showOptions
              ? Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          value.onPressCloseButton();
                        },
                        icon: const Icon(
                          Icons.arrow_back_rounded,
                        )),
                    const SizedBox(
                      width: 20,
                    ),
                    Text(
                      value.treuSelectedCellTiles?.length.toString() ?? '',
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w400),
                    ),
                  ],
                )
              : const Text(
                  'العبارات المستخدمة',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                  ),
                ),
          backgroundColor: Colors.blueGrey,
          actions: value.showOptions
              ? [
                  Padding(
                    padding: const EdgeInsets.only(left: 12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        value.selectedCellRecordTiles.length == 1
                            ? IconButton(
                                onPressed: value.pinningCellsTile,
                                icon: value.selectedCellRecordTiles.single
                                            .isPinned ==
                                        1
                                    ? const Icon(
                                        Icons.undo,
                                      )
                                    : const Icon(
                                        Icons.push_pin,
                                      ))
                            : const SizedBox(),
                        const SizedBox(
                          width: 15,
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.delete,
                              size: 30,
                            )),
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
            child: value.isLoading
                ? ListView.builder(
                    padding: const EdgeInsets.only(top: 10),
                    shrinkWrap: true,
                    itemCount: value.cellRecordList.length,
                    itemBuilder: (context, index) => CellTile(
                      cellsRecord: value.cellRecordList[index],
                      onTap: () {
                        value.onTapCellTile(
                            cellsRecord: value.cellRecordList[index],
                            index: index);
                      },
                      onLongPress: () {
                        value.onLongPressCellTile(
                            cellsRecord: value.cellRecordList[index],
                            index: index);
                      },
                      selected: value.selectedCellTiles?[index] ?? false,
                    ),
                  )
                : const Center(child: CircularProgressIndicator())),
      ]),
    );
  }
}
