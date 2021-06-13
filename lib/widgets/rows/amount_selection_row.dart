import 'package:cashflow_sheet_helper/widgets/buttons/round_icon_button.dart';
import 'package:cashflow_sheet_helper/widgets/constants/icon_constants.dart';
import 'package:cashflow_sheet_helper/widgets/textfields/padded_input_text_field.dart';
import 'package:flutter/material.dart';

class AmountSelectionRow extends StatelessWidget {
  final TextEditingController amountController;
  final Function callbackAmountIncreased;
  final Function callbackAmountDecreased;

  const AmountSelectionRow(this.amountController, this.callbackAmountIncreased,
      this.callbackAmountDecreased);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: PaddedInputTextField(
            "Amount",
            amountController,
            textInputType: TextInputType.number,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Container(
            child: Column(
              children: [
                RoundIconButton(
                    callbackAmountIncreased, IconConstants.INCREASE),
                RoundIconButton(
                    callbackAmountDecreased, IconConstants.DECREASE),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
