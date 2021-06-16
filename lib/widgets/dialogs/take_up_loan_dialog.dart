import 'package:cashflow_sheet_helper/state/player/events/loan_taken.dart';
import 'package:cashflow_sheet_helper/widgets/dialogs/select_amount_dialog.dart';
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
  void dispose() {
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SelectAmountDialog(
      title: "Take Up Loan",
      infoBoxText: "Monthly expenses +${_step * 100}",
      amountController: _amountController,
      callbackAmountIncreased: _processAmountIncreased,
      callbackAmountDecreased: _processAmountDecreased,
      callbackDialogConfirmed: _processConfirm,
      callbackDialogAborted: _processAbort,
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

  void _processConfirm() {
    Navigator.pop(context, LoanTaken(double.parse(_amountController.text)));
  }

  void _processAbort() {
    Navigator.pop(context);
  }
}
