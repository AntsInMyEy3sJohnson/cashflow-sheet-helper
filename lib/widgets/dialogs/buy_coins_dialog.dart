import 'package:cashflow_sheet_helper/state/player/events/coins_bought.dart';
import 'package:cashflow_sheet_helper/widgets/buttons/confirm_abort_button_bar.dart';
import 'package:cashflow_sheet_helper/widgets/constants/text_size_constants.dart';
import 'package:cashflow_sheet_helper/widgets/textfields/padded_input_text_field.dart';
import 'package:cashflow_sheet_helper/widgets/textfields/variable_size_text_field.dart';
import 'package:flutter/material.dart';

class BuyCoinsDialog extends StatefulWidget {
  @override
  _BuyCoinsDialogState createState() => _BuyCoinsDialogState();
}

class _BuyCoinsDialogState extends State<BuyCoinsDialog> {
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();

  @override
  void dispose() {
    _amountController.dispose();
    _priceController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const VariableSizeTextField("Buy Gold Coins",
              TextSizeConstants.DIALOG_HEADING, TextAlign.center),
          PaddedInputTextField(
            "Number of coins to buy",
            _amountController,
            textInputType: TextInputType.number,
          ),
          PaddedInputTextField(
            "Price per coin",
            _priceController,
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
    Navigator.pop(
        context,
        CoinsBought(int.parse(_amountController.text),
            double.parse(_priceController.text)));
  }

  void _processAbort(BuildContext context) {
    Navigator.pop(context);
  }
}
