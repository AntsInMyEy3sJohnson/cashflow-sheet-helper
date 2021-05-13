import 'package:cashflow_sheet_helper/widgets/variable_size_text_field.dart';
import 'package:flutter/material.dart';

class TwoTextFieldRow extends StatelessWidget {
  final String leftTextFieldText;
  final String rightTextFieldText;
  final double fontSize;
  final TextAlign customTextAlign;

  const TwoTextFieldRow(
      this.leftTextFieldText, this.rightTextFieldText, this.fontSize,
      {this.customTextAlign});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: VariableSizeTextField(
              leftTextFieldText, fontSize, customTextAlign ?? TextAlign.left),
        ),
        Expanded(
          child: VariableSizeTextField(
              rightTextFieldText, fontSize, customTextAlign ?? TextAlign.right),
        ),
      ],
    );
  }
}
