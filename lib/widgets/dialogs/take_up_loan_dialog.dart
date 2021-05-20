import 'package:cashflow_sheet_helper/state/game/events/loan_taken.dart';
import 'package:cashflow_sheet_helper/widgets/amount_selection_row.dart';
import 'package:cashflow_sheet_helper/widgets/variable_size_text_field.dart';
import 'package:flutter/material.dart';

class TakeUpLoanDialog extends StatelessWidget {
  final TextEditingController _amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const VariableSizeTextField(
              "Take up bank loan", 20, TextAlign.center),
          AmountSelectionRow(_amountController),
          ElevatedButton(
              onPressed: () => _processConfirm(context),
              child: const Text("Confirm")),
          ElevatedButton(
              onPressed: () => _processAbort(context),
              child: const Text("Abort")),
        ],
      ),
    );
  }

  void _processConfirm(BuildContext context) {
    Navigator.pop(context, LoanTaken(double.parse(_amountController.text)));
  }

  void _processAbort(BuildContext context) {
    Navigator.pop(context);
  }
}
