import 'package:flutter_base_bloc/utils/app_strings.dart';
import 'package:intl/intl.dart';

String getFormattedDateTime(DateTime dateTime) {
  // Get the current date and time
  DateTime now = DateTime.now();

  // Calculate the time difference
  Duration difference = now.difference(dateTime);

  // Format the difference as a human-readable string
  String formattedDifference = _formatTimeDifference(difference);

  return formattedDifference;
}

String _formatTimeDifference(Duration difference) {
  if (difference.inDays >= 365) {
    int years = difference.inDays ~/ 365;
    return '$years ${years == 1 ? AppStrings.yearText : AppStrings.yearsText} ${AppStrings.agoText}';
  } else if (difference.inDays >= 30) {
    int months = difference.inDays ~/ 30;
    return '$months ${months == 1 ? AppStrings.monthText : AppStrings.monthsText} ${AppStrings.agoText}';
  } else if (difference.inDays > 0) {
    if (difference.inDays == 1) {
      return AppStrings.yesterdayText;
    } else {
      return '${difference.inDays} ${AppStrings.daysText} ${AppStrings.agoText}';
    }
  } else if (difference.inHours > 0) {
    if (difference.inHours == 1) {
      return '${AppStrings.anHourText} ${AppStrings.agoText}';
    } else {
      return '${difference.inHours} ${AppStrings.hoursText} ${AppStrings.agoText}';
    }
  } else if (difference.inMinutes > 0) {
    if (difference.inMinutes == 1) {
      return '${AppStrings.aMinuteText} ${AppStrings.agoText}';
    } else {
      return '${difference.inMinutes} ${AppStrings.minutesText} ${AppStrings.agoText}';
    }
  } else {
    return '${AppStrings.secondsText} ${AppStrings.agoText}';
  }
}

String getFormattedDate(DateTime date) {
  final DateFormat formatter = DateFormat('yyyy-MM-dd');
  final String formatted = formatter.format(date);
  return formatted;
}
