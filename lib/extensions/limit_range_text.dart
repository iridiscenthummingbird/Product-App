import 'package:flutter/services.dart';

class LimitRangeTextInputFormatter extends TextInputFormatter {
  LimitRangeTextInputFormatter(this.min, this.max) : assert(min < max);

  final int min;
  final int max;

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text == '') {
      return newValue;
    }
    final value = int.parse(newValue.text);

    if (value == min) {
      return TextEditingValue(
        text: 1.toString(),
        selection: TextSelection.fromPosition(
          TextPosition(offset: newValue.text.length),
        ),
      );
    }
    if (value < min) {
      return TextEditingValue(
        text: min.toString(),
        selection: TextSelection.fromPosition(
          TextPosition(offset: newValue.text.length),
        ),
      );
    } else if (value > max) {
      return TextEditingValue(
        text: max.toString(),
        selection: TextSelection.fromPosition(
          TextPosition(offset: newValue.text.length),
        ),
      );
    }
    return newValue;
  }
}
