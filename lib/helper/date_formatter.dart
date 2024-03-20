import 'package:flutter_base_bloc/utils/constant.dart';

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
    return '$years ${years == 1 ? Constant.yearText : Constant.yearsText} ${Constant.agoText}';
  } else if (difference.inDays >= 30) {
    int months = difference.inDays ~/ 30;
    return '$months ${months == 1 ? Constant.monthText : Constant.monthsText} ${Constant.agoText}';
  } else if (difference.inDays > 0) {
    if (difference.inDays == 1) {
      return Constant.yesterdayText;
    } else {
      return '${difference.inDays} ${Constant.daysText} ${Constant.agoText}';
    }
  } else if (difference.inHours > 0) {
    if (difference.inHours == 1) {
      return '${Constant.anHourText} ${Constant.agoText}';
    } else {
      return '${difference.inHours} ${Constant.hoursText} ${Constant.agoText}';
    }
  } else if (difference.inMinutes > 0) {
    if (difference.inMinutes == 1) {
      return '${Constant.aMinuteText} ${Constant.agoText}';
    } else {
      return '${difference.inMinutes} ${Constant.minutesText} ${Constant.agoText}';
    }
  } else {
    return '${Constant.secondsText} ${Constant.agoText}';
  }
}
