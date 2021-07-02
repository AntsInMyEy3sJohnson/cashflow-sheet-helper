import 'package:flutter/material.dart';

class VariableSizeTextField extends StatelessWidget {
  final String text;
  final double fontSize;
  final TextAlign textAlign;
  final Color textColor;

  const VariableSizeTextField(this.text, this.fontSize, this.textAlign,
      {Color textColor = Colors.black})
      : textColor = textColor;

  @override
  Widget build(BuildContext context) {
    return Text(text,
        textAlign: textAlign,
        style: TextStyle(fontSize: fontSize, color: textColor));
  }
}
