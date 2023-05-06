import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';

class LastRecordsAppBar extends StatelessWidget {
  const LastRecordsAppBar({
    Key? key,
    required this.showOptions,
    required this.onPressCloseButton,
    required this.selectedTilesCount,
    required this.selectedTilesLength,
    required this.pinningCellsTile,
    required this.isSelectedTilePinned,
    required this.onPressDelete,
    this.onSelectDeleteAll,
    required this.enableDeleteAll,
  }) : super(key: key);

  final bool showOptions;
  final void Function() onPressCloseButton;
  final void Function() pinningCellsTile;
  final void Function() onPressDelete;
  final String selectedTilesCount;
  final int selectedTilesLength;
  final bool isSelectedTilePinned;
  final void Function(dynamic)? onSelectDeleteAll;
  final bool enableDeleteAll;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: showOptions
          ? Row(
              children: [
                IconButton(
                    onPressed: onPressCloseButton,
                    icon: const Icon(
                      Icons.arrow_back_rounded,
                    )),
                const SizedBox(
                  width: 20,
                ),
                Text(
                  selectedTilesCount,
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
      actions: showOptions
          ? [
              Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    selectedTilesLength == 1
                        ? IconButton(
                            onPressed: pinningCellsTile,
                            icon: isSelectedTilePinned
                                ? const Icon(
                                    CommunityMaterialIcons.pin_off,
                                  )
                                : const Icon(
                                    Icons.push_pin,
                                  ))
                        : const SizedBox(),
                    const SizedBox(
                      width: 15,
                    ),
                    IconButton(
                        onPressed: onPressDelete,
                        icon: const Icon(
                          Icons.delete,
                          size: 30,
                        )),
                  ],
                ),
              )
            ]
          : [
              PopupMenuButton(
                itemBuilder: (BuildContext context) => <PopupMenuEntry>[
                  PopupMenuItem(
                    enabled: enableDeleteAll,
                    value: 0,
                    child: const Text('حذف السجل'),
                  )
                ],
                onSelected: onSelectDeleteAll,
              )
            ],
    );
  }
}
