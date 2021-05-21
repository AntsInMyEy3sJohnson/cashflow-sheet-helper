import 'package:cashflow_sheet_helper/state/game/events/loan_taken.dart';
import 'package:cashflow_sheet_helper/widgets/amount_selection_row.dart';
import 'package:cashflow_sheet_helper/widgets/variable_size_text_field.dart';
import 'package:flutter/material.dart';

class TakeUpLoanDialog extends StatefulWidget {
  @override
  _TakeUpLoanDialogState createState() => _TakeUpLoanDialogState();
}

class _TakeUpLoanDialogState extends State<TakeUpLoanDialog> {
  final TextEditingController _amountController = TextEditingController();

  late double _step;

  @override
  void initState() {
    super.initState();
    _step = 1;
    _amountController.text = "${_step * 1000}";
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const VariableSizeTextField(
              "Take up bank loan", 20, TextAlign.center),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: AmountSelectionRow(
              _amountController,
              () => _processAmountIncreased(),
              () => _processAmountDecreased(),
            ),
          ),
          Text("Monthly expenses +${_step * 100}"),
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

  void _processAmountIncreased() {
    _step++;
    setState(() {
      _amountController.text = "${_step * 1000}";
    });
  }

  void _processAmountDecreased() {
    if (_step > 1) {
      _step--;
      setState(() {
        _amountController.text = "${_step * 1000}";
      });
    }
  }

  void _processConfirm(BuildContext context) {
    Navigator.pop(context, LoanTaken(double.parse(_amountController.text)));
  }

  void _processAbort(BuildContext context) {
    Navigator.pop(context);
  }
}
