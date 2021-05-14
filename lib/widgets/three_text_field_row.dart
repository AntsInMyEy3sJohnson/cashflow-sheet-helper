import 'package:cashflow_sheet_helper/widgets/variable_size_text_field.dart';
import 'package:flutter/material.dart';

class ThreeTextFieldRow extends StatelessWidget {
  final String leftText;
  final String middleText;
  final String rightText;
  final double fontSize;
  final TextAlign customTextAlign;

  const ThreeTextFieldRow(
      this.leftText, this.middleText, this.rightText, this.fontSize,
      {this.customTextAlign});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: VariableSizeTextField(
              leftText, 19, customTextAlign ?? TextAlign.left),
        ),
        Expanded(
          child: VariableSizeTextField(
              middleText, 19, customTextAlign ?? TextAlign.center),
        ),
        Expanded(
          child: VariableSizeTextField(
              rightText, 19, customTextAlign ?? TextAlign.right),
        ),
      ],
    );
  }
}
