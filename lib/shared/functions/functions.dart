import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:speech_assistance_app/data/models/cell.dart';
import 'package:speech_assistance_app/shared/styles/colors.dart';
import 'package:speech_assistance_app/view/widgets/home/folder_cell.dart';
import 'package:speech_assistance_app/view/widgets/home/normal_cell.dart';
import 'package:speech_assistance_app/view/widgets/home/triangle_cell.dart';

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
        return NormalCell(
          cell: cell,
          onPressed: onPressed,
        );
      }
    } else {
      return FolderCell(
        cell: cell,
        onPressed: onPressed,
      );
    }
  }

  static Map<String, Color> getCellColor(Cell cell) {
    if (cell.type == 'cell') {
      if (cell.category == 'little_words') {
        return {'cellBorder': orangeBorder, 'cellContent': orangeContent};
      } else if (cell.category == 'actions') {
        return {'cellBorder': pinkBorder, 'cellContent': pinkContent};
      } else if (cell.category == 'where') {
        return {'cellBorder': greenBorder, 'cellContent': greenContent};
      } else if (cell.category == 'describe') {
        return {'cellBorder': blueBorder, 'cellContent': blueContent};
      } else if (cell.category == 'numbers') {
        return {'cellBorder': purpleBorder, 'cellContent': purpleContent};
      } else if (cell.category == 'question' || cell.category == 'help') {
        return {'cellBorder': blackBorder, 'cellContent': whiteContent};
      } else {
        return {'cellBorder': yellowBorder, 'cellContent': yellowContent};
      }
    }
    return {'cellBorder': blackBorder, 'cellContent': whiteContent};
  }
}
