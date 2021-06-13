import 'package:cashflow_sheet_helper/widgets/text_size_constants.dart';
import 'package:cashflow_sheet_helper/widgets/textfields/variable_size_text_field.dart';
import 'package:flutter/material.dart';

class ButtonRow extends StatelessWidget {
  final String textLeft;
  final String textRight;

  final Function? callbackLeft;
  final Function? callbackRight;

  const ButtonRow(
      this.textLeft, this.textRight, this.callbackLeft, this.callbackRight);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: ElevatedButton(
              onPressed: callbackLeft == null ? null : () => callbackLeft!(),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: VariableSizeTextField(textLeft,
                    TextSizeConstants.BUTTON_MEDIUM, TextAlign.center),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: ElevatedButton(
              onPressed: callbackRight == null ? null : () => callbackRight!(),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: VariableSizeTextField(textRight,
                    TextSizeConstants.BUTTON_MEDIUM, TextAlign.center),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
