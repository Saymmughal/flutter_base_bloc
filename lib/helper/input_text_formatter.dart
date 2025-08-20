import 'package:flutter/services.dart';

class MaxValueInputFormatter extends TextInputFormatter {
  final double maxValue;

  MaxValueInputFormatter({required this.maxValue});

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    // Allow empty field
    if (newValue.text.isEmpty) {
      return newValue;
    }

    // Try to parse the new value as a double
    try {
      final double? enteredValue = double.tryParse(newValue.text);

      // If the value is valid and less than or equal to maxValue, allow it
      if (enteredValue != null && enteredValue <= maxValue) {
        return newValue;
      }
    } catch (e) {
      // Ignore the error, will handle it by returning oldValue
    }

    // If the new value is invalid or exceeds the limit, return the old value
    return oldValue;
  }
}
