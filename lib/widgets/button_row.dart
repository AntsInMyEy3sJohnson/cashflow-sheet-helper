import 'package:cashflow_sheet_helper/widgets/variable_size_text_field.dart';
import 'package:flutter/material.dart';

class ButtonRow extends StatelessWidget {

  final String textLeft;
  final String textRight;

  final Function callbackLeft;
  final Function callbackRight;

  const ButtonRow(this.textLeft, this.textRight, this.callbackLeft, this.callbackRight);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: ElevatedButton(
                onPressed: callbackLeft,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: VariableSizeTextField(textLeft, 18, TextAlign.center),
                )),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: ElevatedButton(
                onPressed: callbackRight,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: VariableSizeTextField(textRight, 18, TextAlign.center),
                )),
          ),
        ),
      ],
    );
  }


}