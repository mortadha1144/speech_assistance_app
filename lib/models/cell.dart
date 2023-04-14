import 'package:speech_assistance_app/shared/components/components.dart';
import 'package:speech_assistance_app/shared/components/constants.dart';

class Cell {
  final int id;
  final int serial;
  final String name;
  final String category;
  final String image;
  final String type;

  const Cell({
    required this.id,
    required this.serial,
    required this.name,
    required this.category,
    required this.image,
    required this.type,
  });
}
