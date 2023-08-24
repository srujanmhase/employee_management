import 'package:employee_management/constants/colors.dart';
import 'package:flutter/material.dart';

class AppUtils {
  static void showSnackbar({
    required BuildContext context,
    required String message,
    Color color = themeDark,
    SnackBarAction? action,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: color,
        action: action,
        content: Text(message),
      ),
    );
  }

  static String monthFromInt(int monthNumber) {
    final months = {
      1: "January",
      2: "February",
      3: "March",
      4: "April",
      5: "May",
      6: "June",
      7: "July",
      8: "August",
      9: "September",
      10: "October",
      11: "November",
      12: "December",
    };

    return months[monthNumber] ?? '';
  }

  static bool isToday(DateTime? date) {
    if (date == null) return false;
    final now = DateTime.now();
    if (now.day == date.day &&
        now.month == date.month &&
        now.year == date.year) {
      return true;
    }
    return false;
  }

  static String formatDate(DateTime? date) {
    if (date == null) return '';
    final val =
        '${date.day.toString()} ${monthFromInt(date.month)} ${date.year.toString()}';
    return val;
  }
}
