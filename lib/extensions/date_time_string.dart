import 'package:shamsi_date/shamsi_date.dart';

final _weekdays = [
  'شنبه',
  'یک‌شنبه',
  'دوشنبه',
  'سه‌شنبه',
  'چهارشنبه',
  'پنج‌شنبه',
  'جمعه',
];

final _months = [
  'فروردین',
  'اردیبهشت',
  'خرداد',
  'تیر',
  'امرداد',
  'شهریور',
  'مهر',
  'آبان',
  'آذر',
  'دی',
  'بهمن',
  'اسفند',
];

extension DateTimeString on Jalali {
  String get weekDayName => _weekdays[weekDay - 1];
  String get monthName => _months[month - 1];

  String toCustomTimeString() {
    final minute = '${this.minute > 9 ? this.minute : '0${this.minute}'}';

    return '$hour:$minute';
  }

  String toCustomDateString() => '$weekDayName، $day $monthName';
}
