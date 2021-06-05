import 'package:cashflow_sheet_helper/widgets/textfields/padded_input_text_field.dart';
import 'package:cashflow_sheet_helper/widgets/textfields/variable_size_text_field.dart';
import 'package:flutter/material.dart';

class BuyCoinsDialog extends StatelessWidget {

  final TextEditingController _amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const VariableSizeTextField("Buy Gold Coins", 20, TextAlign.center),
          PaddedInputTextField("Provide amount", _amountController),
          ElevatedButton(onPressed: () => _processConfirm(context), child: const Text("Confirm")),
          ElevatedButton(onPressed: () => _processAbort(context), child: const Text("Abort")),
        ],
      ),
    );
  }

  void _processConfirm(BuildContext context) {
    Navigator.pop(context, int.parse(_amountController.text));
  }

  void _processAbort(BuildContext context) {
    Navigator.pop(context);
  }

}