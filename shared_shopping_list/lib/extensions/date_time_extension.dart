import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  bool get isToday {
    if (year == DateTime.now().year && month == DateTime.now().month && day == DateTime.now().day) {
      return true;
    } else {
      return false;
    }
  }

  String toTimeString() {
    return "$hour:$minute";
  }

  String toDateTimeString() {
    return "$year-$month-$day $hour:$minute";
  }

  String defaultDateFormat(MaterialLocalizations materialLocalizations) {
    return materialLocalizations.formatShortDate(this);
  }

  String defaultTimeFormat(MaterialLocalizations materialLocalizations) {
    return materialLocalizations.formatTimeOfDay(TimeOfDay.fromDateTime(this));
  }

  String defaultDateTimeFormat(MaterialLocalizations materialLocalizations) {
    return '${month}th ${DateFormat("MMMM").format(this)}, at ${materialLocalizations.formatTimeOfDay(TimeOfDay.fromDateTime(this))}';
  }
}
