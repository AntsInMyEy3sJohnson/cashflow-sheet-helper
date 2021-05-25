import 'package:cashflow_sheet_helper/state/game/events/shares_sold.dart';
import 'package:cashflow_sheet_helper/widgets/padded_input_text_field.dart';
import 'package:cashflow_sheet_helper/widgets/variable_size_text_field.dart';
import 'package:flutter/material.dart';

class SellSharesDialog extends StatelessWidget {

  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const VariableSizeTextField("Sell shares", 20, TextAlign.center),
          PaddedInputTextField("Price to sell for", _priceController),
          PaddedInputTextField("# shares to sell", _amountController),
          ElevatedButton(onPressed: () => _processConfirm(context), child: const Text("Confirm")),
          ElevatedButton(onPressed: () => _processAbort(context), child: const Text("Abort"))
        ],
      ),
    );
  }

  void _processConfirm(BuildContext context) {
    final SharesSold sharesSold = SharesSold(int.parse(_amountController.text), double.parse(_priceController.text));
    Navigator.pop(context, sharesSold);
  }

  void _processAbort(BuildContext context) {
    Navigator.pop(context);
  }

}