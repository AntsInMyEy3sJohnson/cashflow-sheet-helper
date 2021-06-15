import 'package:cashflow_sheet_helper/widgets/buttons/confirm_abort_button_bar.dart';
import 'package:cashflow_sheet_helper/widgets/helpers/dimension_helper.dart';
import 'package:cashflow_sheet_helper/widgets/paddings/adjustable_padding.dart';
import 'package:cashflow_sheet_helper/widgets/paddings/padding_kind.dart';
import 'package:cashflow_sheet_helper/widgets/rows/amount_selection_row.dart';
import 'package:cashflow_sheet_helper/widgets/textfields/variable_size_text_field.dart';
import 'package:flutter/material.dart';

class SelectAmountDialog extends StatelessWidget {
  final String title;
  final String infoBoxText;
  final TextEditingController amountController;
  final Function callbackAmountIncreased;
  final Function callbackAmountDecreased;
  final Function callbackDialogConfirmed;
  final Function callbackDialogAborted;

  const SelectAmountDialog(
      {required this.title,
      required this.infoBoxText,
      required this.amountController,
      required this.callbackAmountIncreased,
      required this.callbackAmountDecreased,
      required this.callbackDialogConfirmed,
      required this.callbackDialogAborted});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          VariableSizeTextField(title, 20, TextAlign.center),
          AdjustablePadding(
            paddingKind: PaddingKind.large,
            child: AmountSelectionRow(
              amountController,
              callbackAmountIncreased,
              callbackAmountDecreased,
            ),
          ),
          Text(infoBoxText),
          ConfirmAbortButtonBar(
            callbackDialogConfirmed,
            callbackDialogAborted,
          ),
        ],
      ),
    );
  }
}
