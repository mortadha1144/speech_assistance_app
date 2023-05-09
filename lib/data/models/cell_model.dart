import 'package:hive/hive.dart';
part 'cell_model.g.dart';

@HiveType(typeId: 0)
class CellModel extends HiveObject {
  @HiveField(0)
  String date;
  @HiveField(1)
  String? text;
  @HiveField(2)
  final bool isCell;
  @HiveField(3)
  bool isPinned;
  @HiveField(4)
  int pinningSerial;
  @HiveField(5)
  HiveList? cells;

  CellModel({
    required this.date,
    this.text,
    required this.isCell,
    required this.isPinned,
    required this.pinningSerial,
    this.cells,
  });

  factory CellModel.fromTextToSpeechScreen(String text) {
    return CellModel(
        date: DateTime.now().toString(),
        text: text.trim(),
        isCell: false,
        isPinned: false,
        pinningSerial: 0);
  }
  factory CellModel.fromHomeScreen(String text) {
    return CellModel(
        date: DateTime.now().toString(),
        text: text.trim(),
        isCell: true,
        isPinned: false,
        pinningSerial: 0);
  }
}
