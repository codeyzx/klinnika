import 'package:intl/intl.dart';

extension XDateTime on DateTime {
  DateTime get toEndOfDay => DateTime(year, month, day, 23, 59, 59);
  String get toYyyyMMDd => DateFormat('yyyy-MM-dd').format(this);
  String get dateMonthTime => '$dateMonth • $time';
  String get dateMonthYear => DateFormat('dd MMMM yyyy').format(this);
  String get dateMonth => DateFormat('dd MMMM').format(this);
  String get dayName => DateFormat('EEEE').format(this);
  String get monthName => DateFormat('MMMM').format(this);
  String get time => DateFormat('jm').format(this);
  String get age => (DateTime.now().year - year).toString();
}
