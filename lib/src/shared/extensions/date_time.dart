import 'package:intl/intl.dart';

extension XDateTime on DateTime {
  DateTime get toEndOfDay => DateTime(year, month, day, 23, 59, 59);
  String get toYyyyMMDd => DateFormat('yyyy-MM-dd').format(this);
  String get dateMonthTime => '$dateMonth • $time';
  String get dateMonthYear => DateFormat('dd MMMM yyyy').format(this);
  String get dateMonth => DateFormat('dd MMMM').format(this);
  String get dateWithMonth => DateFormat('dd/M').format(this);
  String get dayName => DateFormat('EEEE').format(this);
  String get monthName => DateFormat('MMMM').format(this);
  String get time => DateFormat('Hm').format(this);
  String get hourWithMinute => DateFormat('HH:mm').format(this);
  String get age => (DateTime.now().year - year).toString();
  String get historyDate {
    final DateTime now = DateTime.now();
    final DateTime yesterday = DateTime(now.year, now.month, now.day - 1);
    final DateTime today = DateTime(now.year, now.month, now.day);
    final DateTime date = DateTime(year, month, day);
    if (date == today) {
      return time;
    } else if (date == yesterday) {
      return 'Kemarin';
    } else {
      return dateWithMonth;
    }
  }
}
