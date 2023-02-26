import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:speech_assistance_app/shared/components/components.dart';
import 'package:speech_assistance_app/controller/database_provider.dart';
import 'package:speech_assistance_app/controller/home_provider.dart';
import 'package:speech_assistance_app/controller/last_record_provider.dart';

class LastRecordScreen2 extends StatelessWidget {
  const LastRecordScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    final homeProvider = Provider.of<HomeProvider>(context, listen: false);
    final provider = Provider.of<LastRecordProvider>(context, listen: false);

    return Column(
      children: [
        AppBar(
          title: provider.showOptions
              ? IconButton(
                  onPressed: () => provider.onPressCloseButton(),
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
          actions: provider.showOptions
              ? [
                  Padding(
                    padding: const EdgeInsets.only(left: 12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          homeProvider.selectedCellTilesId.isEmpty
                              ? ''
                              : homeProvider.selectedCellTilesId.length
                                  .toString(),
                          style: const TextStyle(
                              fontSize: 22, fontWeight: FontWeight.w600),
                        ),

                        const SizedBox(
                          width: 20,
                        ),

                        IconButton(
                            onPressed: homeProvider.selectedCellTilesId.length >
                                    1
                                ? null
                                : () => provider.pinningCellsTile(
                                    homeProvider.selectedCellTilesId.single),
                            icon: homeProvider.selectedCellTilesId
                                        .single['is_pinned'] ==
                                    1
                                ? const Icon(
                                    Icons.undo,
                                    size: 30,
                                  )
                                : const Icon(
                                    Icons.push_pin,
                                    size: 30,
                                  )),
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
          child: Consumer<LastRecordProvider>(
            builder: (context, value, child) {
              var list = value.cellRecordList;
              var isLoading = value.isLoading;
              return isLoading
                  ? ListView.builder(
                      shrinkWrap: true,
                      itemCount: list!.length,
                      itemBuilder: (context, index) => CellTile(
                        cellsRecord: list[index],
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
