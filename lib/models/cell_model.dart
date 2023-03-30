import 'package:hive/hive.dart';
part 'cell_model.g.dart';

@HiveType(typeId: 0)
class CellModel extends HiveObject {
  @HiveField(0)
  final DateTime date;
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
}
