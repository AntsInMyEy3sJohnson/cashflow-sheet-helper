import 'package:cashflow_sheet_helper/state/game/events/coins_sold.dart';
import 'package:cashflow_sheet_helper/widgets/textfields/padded_input_text_field.dart';
import 'package:cashflow_sheet_helper/widgets/textfields/variable_size_text_field.dart';
import 'package:flutter/material.dart';

class SellCoinsDialog extends StatelessWidget {
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();

  final int numCurrentlyAvailable;

  SellCoinsDialog(this.numCurrentlyAvailable);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const VariableSizeTextField("Sell Gold Coins", 20, TextAlign.center),
          VariableSizeTextField(
              "Available: $numCurrentlyAvailable", 16, TextAlign.left),
          PaddedInputTextField("Number of coins to sell", _amountController),
          PaddedInputTextField("Price per coin", _priceController),
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
    Navigator.pop(
        context,
        CoinsSold(int.parse(_amountController.text),
            double.parse(_priceController.text)));
  }

  void _processAbort(BuildContext context) {
    Navigator.pop(context);
  }
}
