import 'package:cashflow_sheet_helper/state/game/events/holding_bought.dart';
import 'package:cashflow_sheet_helper/widgets/padded_input_text_field.dart';
import 'package:flutter/material.dart';

class BuyHoldingDialog extends StatelessWidget {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _downPaymentController = TextEditingController();
  final TextEditingController _buyingCostController = TextEditingController();
  final TextEditingController _mortgageController = TextEditingController();
  final TextEditingController _cashflowController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          PaddedInputTextField("Name", _nameController),
          PaddedInputTextField("Down payment", _downPaymentController),
          PaddedInputTextField("Buying cost", _buyingCostController),
          PaddedInputTextField("Mortgage", _mortgageController),
          PaddedInputTextField("Cashflow", _cashflowController),
          ElevatedButton(
              onPressed: () => _process(context), child: const Text("Confirm")),
        ],
      ),
    );
  }

  void _process(BuildContext context) {
    final holdingBought = HoldingBought(
        _nameController.text,
        double.parse(_downPaymentController.text),
        double.parse(_buyingCostController.text),
        double.parse(_mortgageController.text),
        double.parse(_cashflowController.text));
    Navigator.pop(context, holdingBought);
  }
}
