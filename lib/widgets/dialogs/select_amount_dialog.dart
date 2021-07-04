import 'package:cashflow_sheet_helper/widgets/buttons/confirm_abort_button_bar.dart';
import 'package:cashflow_sheet_helper/widgets/constants/text_size_constants.dart';
import 'package:cashflow_sheet_helper/widgets/paddings/adjustable_padding.dart';
import 'package:cashflow_sheet_helper/widgets/paddings/padding_kind.dart';
import 'package:cashflow_sheet_helper/widgets/rows/amount_selection_row.dart';
import 'package:cashflow_sheet_helper/widgets/textfields/variable_size_text_field.dart';
import 'package:flutter/material.dart';

class SelectAmountDialog extends StatelessWidget {
  final String title;
  final String infoBoxTextUpper;
  final String infoBoxTextLower;
  final TextEditingController amountController;
  final Function callbackAmountIncreased;
  final Function callbackAmountDecreased;
  final Function callbackDialogConfirmed;
  final Function callbackDialogAborted;

  const SelectAmountDialog(
      {required this.title,
      required this.infoBoxTextUpper,
      required this.infoBoxTextLower,
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
          VariableSizeTextField(title, TextSizeConstants.DIALOG_HEADING, TextAlign.center),
          if (infoBoxTextUpper.isNotEmpty)
            // TODO Padding between this text field and the AmountSelectionRow is too large
            VariableSizeTextField(infoBoxTextUpper, TextSizeConstants.DIALOG_INFO_TEXT, TextAlign.center),
          AdjustablePadding(
            // TODO This input text field must be enabled, but not directly editable!
            paddingKind: PaddingKind.large,
            child: AmountSelectionRow(
              amountController,
              callbackAmountIncreased,
              callbackAmountDecreased,
            ),
          ),
          VariableSizeTextField(infoBoxTextLower, TextSizeConstants.DIALOG_INFO_TEXT, TextAlign.center),
          ConfirmAbortButtonBar(
            callbackDialogConfirmed,
            callbackDialogAborted,
          ),
        ],
      ),
    );
  }
}
