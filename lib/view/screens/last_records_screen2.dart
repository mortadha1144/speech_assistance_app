import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:speech_assistance_app/shared/components/components.dart';
import 'package:speech_assistance_app/controller/database_provider.dart';
import 'package:speech_assistance_app/controller/home_provider.dart';
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
    // Future.delayed(const Duration(microseconds: 500), () {

    // });
    // getData();
  }

  // getData() {
  //   if (provider!.isLoading == false) {
  //     provider!.getData();
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    final homeProvider = Provider.of<HomeProvider>(context, listen: false);
    final provider = Provider.of<LastRecordProvider>(context, listen: false);

    return Column(
      children: [
        AppBar(
          title: provider.showOptions
              ? Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          setState(() {
                            provider.onPressCloseButton();
                          });
                        },
                        icon: const Icon(
                          Icons.arrow_back_rounded,
                        )),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      provider.treuSelectedCellTiles?.length.toString() ?? '',
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
          actions: provider.showOptions
              ? [
                  Padding(
                    padding: const EdgeInsets.only(left: 12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        provider.selectedCellRecordTiles.length == 1
                            ? IconButton(
                                onPressed: () {},
                                //  homeProvider.selectedCellTilesId.length >
                                //         1
                                //     ? null
                                //     : () => provider.pinningCellsTile(
                                //         homeProvider.selectedCellTilesId.single),
                                icon: provider.selectedCellRecordTiles.single
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
          child: Consumer<LastRecordProvider>(
            builder: (context, value, child) {
              var list = value.cellRecordList;
              var isLoading = value.isLoading;
              return isLoading
                  ? ListView.builder(
                      padding: const EdgeInsets.only(top: 10),
                      shrinkWrap: true,
                      itemCount: list.length,
                      itemBuilder: (context, index) => CellTile(
                        cellsRecord: list[index],
                        onTap: () {
                          setState(() {
                            value.onTapCellTile(
                                cellsRecord: list[index], index: index);
                          });
                        },
                        onLongPress: () {
                          setState(() {
                            value.onLongPressCellTile(
                                cellsRecord: list[index], index: index);
                          });
                        },
                        selected: value.selectedCellTiles?[index] ?? false,
                      ),
                    )
                  : const Center(child: CircularProgressIndicator());
            },
          ),
        ),
      ],
    );
  }
}
