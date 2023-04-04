import 'package:hive/hive.dart';
part 'cell_model.g.dart';

@HiveType(typeId: 0)
class CellModel extends HiveObject {
  @HiveField(0)
  String date;
  @HiveField(1)
  final String text;
  @HiveField(2)
  final bool isCell;
  @HiveField(3)
  bool isPinned;
  @HiveField(4)
  int pinningSerial;

  CellModel(
      {required this.date,
      required this.text,
      required this.isCell,
      required this.isPinned,
      required this.pinningSerial});

  factory CellModel.fromTextToSpeechScreen(String text) {
    return CellModel(
        date: DateTime.now().toString(),
        text: text.trim(),
        isCell: false,
        isPinned: false,
        pinningSerial: 0);
  }
}
