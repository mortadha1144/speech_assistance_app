import 'package:hive/hive.dart';
part 'cell.g.dart';

@HiveType(typeId: 1)
class Cell {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String category;
  @HiveField(3)
  final String image;
  @HiveField(4)
  final String type;

 const Cell({
    required this.id,
    required this.name,
    required this.category,
    required this.image,
    required this.type,
  });
}
