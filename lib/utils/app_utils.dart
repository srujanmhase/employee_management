import 'dart:math';
import 'package:employee_management/constants/colors.dart';
import 'package:employee_management/core/edit/view/calendar_view.dart';
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

  static bool isSameDay(DateTime? one, DateTime? two) {
    if (one == null || two == null) return false;
    if (one.day == two.day && one.month == two.month && one.year == two.year) {
      return false;
    }
    return false;
  }

  static bool isNextMonday(DateTime? date) {
    if (date == null) return false;

    final now = DateTime.now();
    final nextMonday = DateTime(now.year, now.month, now.day)
        .add(Duration(days: 8 - now.weekday));

    if (date.year == nextMonday.year &&
        date.month == nextMonday.month &&
        date.day == nextMonday.day) {
      return true;
    }

    return false;
  }

  static bool isNextTuesday(DateTime? date) {
    if (date == null) return false;

    final now = DateTime.now();
    final nextTuesday = DateTime(now.year, now.month, now.day)
        .add(Duration(days: 9 - now.weekday));

    if (date.year == nextTuesday.year &&
        date.month == nextTuesday.month &&
        date.day == nextTuesday.day) {
      return true;
    }
    return false;
  }

  static bool isAfterOneWeek(DateTime? date) {
    if (date == null) return false;

    final now = DateTime.now();
    final afterOneWeek = DateTime(now.year, now.month, now.day).add(
      const Duration(days: 7),
    );

    if (date.year == afterOneWeek.year &&
        date.month == afterOneWeek.month &&
        date.day == afterOneWeek.day) {
      return true;
    }
    return false;
  }

  static String formatDate(DateTime? date) {
    if (date == null) return '';
    final val =
        '${date.day.toString()} ${monthFromInt(date.month).substring(0, 3)} ${date.year.toString()}';
    return val;
  }

  static DateTime? afterSome({required Selectors selector}) {
    final date = DateTime.now();

    if (selector == Selectors.today) {
      return DateTime.now();
    }

    if (selector == Selectors.noDate) {
      return null;
    }

    final newDate = date.add(
      selector == Selectors.afterOneWeek
          ? const Duration(days: 7)
          : Duration(days: selector.val - date.weekday),
    );
    return newDate;
  }

  static String generateRandomAlphaNumeric(int length) {
    const chars =
        'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    final random = Random();
    final codeUnits = List.generate(
      length,
      (_) => chars.codeUnitAt(random.nextInt(chars.length)),
    );
    return String.fromCharCodes(codeUnits);
  }
}

enum CustomDay {
  nextMonday(val: 8),
  nextTuesday(val: 9),
  after1Week(val: 7);

  const CustomDay({required this.val});
  final int val;
}
