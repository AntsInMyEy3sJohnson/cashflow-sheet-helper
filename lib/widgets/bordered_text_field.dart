import 'package:cashflow_sheet_helper/widgets/variable_size_text_field.dart';
import 'package:flutter/material.dart';

class BorderedTextField extends StatelessWidget {

  final String text;

  const BorderedTextField(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        minWidth: 200,
        minHeight: 50,
      ),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
        ),
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: VariableSizeTextField(text, 32, TextAlign.right),
    );
  }



}