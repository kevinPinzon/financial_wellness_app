import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class MoneyInputFormatter extends TextInputFormatter {
  // NumberFormat instance for formatting currency with a dollar symbol and no decimal digits.
  final NumberFormat _formatter =
      NumberFormat.currency(symbol: '', decimalDigits: 0, locale: 'en_US');

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String newText = newValue.text;

    // Remove any non-numeric characters (except decimals).
    newText = newText.replaceAll(RegExp(r'[^0-9]'), '');

    // Convert the string to an integer.
    final value = int.tryParse(newText);

    // If the value is not a valid number, return the old value.
    if (value == null) {
      return oldValue;
    }

    // Format the number with the dollar symbol and commas as thousand separators.
    final formattedText = _formatter.format(value);

    // Return the new value with the formatted text and adjust the cursor position.
    return newValue.copyWith(
      text: formattedText,
      selection: TextSelection.collapsed(offset: formattedText.length),
    );
  }
}
