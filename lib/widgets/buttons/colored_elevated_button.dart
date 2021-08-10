import 'package:cashflow_sheet_helper/widgets/buttons/style_kind.dart';
import 'package:cashflow_sheet_helper/widgets/textfields/variable_size_text_field.dart';
import 'package:flutter/material.dart';

class ColoredElevatedButton extends StatelessWidget {
  final String text;
  final double textSize;
  final Function callback;
  final StyleKind styleKind;
  final EdgeInsets edgeInsets;

  const ColoredElevatedButton(
      this.text, this.textSize, this.callback, this.styleKind, this.edgeInsets);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: _evaluateStyle(),
      onPressed: () => callback(),
      child: VariableSizeTextField(
        text,
        textSize,
        TextAlign.center,
        textColor: _evaluateTextColor(),
      ),
    );
  }

  Color _evaluateTextColor() {
    return styleKind == StyleKind.ENABLED ? Colors.white : Colors.grey;
  }

  ButtonStyle _evaluateStyle() {
    if (styleKind == StyleKind.ENABLED) {
      return _styleFromProperties(3, Colors.blue, Colors.white);
    }
    return _styleFromProperties(1, Colors.white38, Colors.grey);
  }

  ButtonStyle _styleFromProperties(double elevation, Color primaryColor, Color textColor) {
    return ElevatedButton.styleFrom(
      elevation: elevation,
      primary: primaryColor,
      textStyle: TextStyle(
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
