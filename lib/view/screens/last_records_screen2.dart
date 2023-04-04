import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:speech_assistance_app/shared/components/components.dart';
import 'package:speech_assistance_app/controller/last_record_provider.dart';
import 'package:speech_assistance_app/view/widgets/last_records/last_record_app_bar.dart';
import 'package:speech_assistance_app/view/widgets/last_records/no_last_records.dart';

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
        provider.fetchAllCells();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<LastRecordProvider>(
      builder: (context, value, child) {
        return Column(children: [
          LastRecordsAppBar(
            showOptions: value.showOptions,
            onPressCloseButton: value.onPressCloseButton,
            selectedTilesCount:
                value.treuSelectedCellTiles?.length.toString() ?? '',
            selectedTilesLength: value.selectedCellRecordTiles.length,
            isSelectedTilePinned: value.isSelectedTilePinned,
            pinningCellsTile: value.pinningCellsTile,
            onPressDelete: () {
              value.onPressDelete(context);
            },
            enableDeleteAll: value.enableDeleteAll,
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
                : const Center(child: CircularProgressIndicator()),
          )
        ]);
      },
    );
  }
}