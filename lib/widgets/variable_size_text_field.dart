import 'package:flutter/material.dart';

class VariableSizeTextField extends StatelessWidget {

  final String text;
  final double fontSize;
  final TextAlign textAlign;

  const VariableSizeTextField(this.text, this.fontSize, this.textAlign);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(fontSize: fontSize),
    );
  }



}