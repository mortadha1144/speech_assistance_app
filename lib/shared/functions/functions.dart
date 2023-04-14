import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:speech_assistance_app/models/cell.dart';
import 'package:speech_assistance_app/shared/components/components.dart';

class Functions {
  static String getCustomDates(DateTime date) {
    //DateTime dateConverted = DateTime.parse(date);

    initializeDateFormatting('ar_DZ', null);
    switch (_getSinceDates(date)) {
      case 'اليوم':
        return DateFormat('hh:mm a', 'ar_DZ').format(date);
      case 'أمس':
      case 'منذ أسبوع':
        return DateFormat('EEEE', 'ar_DZ').format(date);
      case 'سابقاً':
        return DateFormat('yy.MM.dd').format(date);
      default:
        return '';
    }
  }

  static String _getSinceDates(DateTime date) {
    String dateFormatted = DateFormat('yyyy-MM-dd').format(date);
    final DateTime nowDate = DateTime.now();
    DateTime nowShortDate = DateTime(nowDate.year, nowDate.month, nowDate.day);
    DateTime weekFromToday = nowShortDate.subtract(const Duration(days: 6));
    String today = DateFormat('yyyy-MM-dd').format(DateTime.now());
    String yesterday = DateFormat('yyyy-MM-dd')
        .format(DateTime.now().subtract(const Duration(days: 1)));
    if (dateFormatted == today) {
      return 'اليوم';
    } else if (dateFormatted == yesterday) {
      return 'أمس';
    } else if (weekFromToday.isBefore(date)) {
      return 'منذ أسبوع';
    } else {
      return 'سابقاً';
    }
  }

  static StatelessWidget getCell({required Cell cell, Function()? onPressed}) {
    if (cell.type == 'cell') {
      if (cell.category == 'pronoun' ||
          cell.category == 'verb' ||
          cell.category == 'adjective') {
        return TriangleCell(
          cell: cell,
          onPressed: onPressed,
        );
      } else {
        return NormalCell(cell: cell);
      }
    } else {
      return FolderCell(cell: cell);
    }
  }
}
