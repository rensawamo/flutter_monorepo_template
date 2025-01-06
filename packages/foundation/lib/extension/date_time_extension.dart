import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;

extension DateTimeExtension on DateTime {
  // Format DateTime with optional pattern and locale
  String format([String pattern = 'yyyy/MM/dd HH:mm:ss', String? locale]) {
    if (locale != null && locale.isNotEmpty) {
      initializeDateFormatting(locale);
    }
    return DateFormat(pattern, locale).format(this);
  }

  // Get the date only (year, month, day)
  DateTime getDateOnly() {
    return DateTime(year, month, day);
  }

  // Get the year and month only (year, month)
  DateTime getDateTillMonth() {
    return DateTime(year, month);
  }

  // Get the year only (year)
  DateTime getDateTillYear() {
    return DateTime(year);
  }

  // Create a time ago string with a flexible locale
  String createTimeAgoString(DateTime postDateTime) {
    final now = DateTime.now();
    final difference = now.difference(postDateTime);
    return timeago.format(
      now.subtract(difference),
    );
  }

  // Set hour and optionally minute, second, millisecond, microsecond
  DateTime setHour(
    int hour, [
    int? minute,
    int? second,
    int? millisecond,
    int? microsecond,
  ]) =>
      DateTime(
        year,
        month,
        day,
        hour,
        minute ?? this.minute,
        second ?? this.second,
        millisecond ?? this.millisecond,
        microsecond ?? this.microsecond,
      );
}
