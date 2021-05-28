import 'package:cashflow_sheet_helper/widgets/textfields/variable_size_text_field.dart';
import 'package:flutter/material.dart';

class BorderedTextField extends StatelessWidget {

  final String text;

  const BorderedTextField(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        minWidth: 180,
      ),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
        ),
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: VariableSizeTextField(text, 20, TextAlign.right),
    );
  }



}