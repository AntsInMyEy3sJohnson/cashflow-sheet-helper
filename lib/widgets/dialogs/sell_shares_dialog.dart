import 'package:cashflow_sheet_helper/data/asset.dart';
import 'package:cashflow_sheet_helper/state/game/events/shares_sold.dart';
import 'package:cashflow_sheet_helper/widgets/buttons/confirm_abort_button_bar.dart';
import 'package:cashflow_sheet_helper/widgets/textfields/padded_input_text_field.dart';
import 'package:cashflow_sheet_helper/widgets/textfields/variable_size_text_field.dart';
import 'package:flutter/material.dart';

class SellSharesDialog extends StatelessWidget {
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  final Asset asset;

  SellSharesDialog(this.asset);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const VariableSizeTextField("Sell shares", 20, TextAlign.center),
          PaddedInputTextField(
            "Price to sell for",
            _priceController,
            textInputType: TextInputType.number,
          ),
          PaddedInputTextField(
            "# shares to sell",
            _amountController,
            textInputType: TextInputType.number,
          ),
          ConfirmAbortButtonBar(
                () => _processConfirm(context),
                () => _processAbort(context),
          ),
        ],
      ),
    );
  }

  void _processConfirm(BuildContext context) {
    final SharesSold sharesSold = SharesSold(asset,
        int.parse(_amountController.text), double.parse(_priceController.text));
    Navigator.pop(context, sharesSold);
  }

  void _processAbort(BuildContext context) {
    Navigator.pop(context);
  }
}
