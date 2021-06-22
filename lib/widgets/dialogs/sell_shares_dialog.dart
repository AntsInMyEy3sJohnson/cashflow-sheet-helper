import 'package:cashflow_sheet_helper/data/asset.dart';
import 'package:cashflow_sheet_helper/helpers/input_validation/sell_shares_input_validation.dart';
import 'package:cashflow_sheet_helper/state/player/events/shares_sold.dart';
import 'package:cashflow_sheet_helper/widgets/buttons/confirm_abort_button_bar.dart';
import 'package:cashflow_sheet_helper/widgets/constants/text_size_constants.dart';
import 'package:cashflow_sheet_helper/widgets/textfields/padded_form_field.dart';
import 'package:cashflow_sheet_helper/widgets/textfields/padded_input_text_field.dart';
import 'package:cashflow_sheet_helper/widgets/textfields/variable_size_text_field.dart';
import 'package:flutter/material.dart';

class SellSharesDialog extends StatefulWidget {
  final Asset asset;

  SellSharesDialog(this.asset);

  @override
  _SellSharesDialogState createState() => _SellSharesDialogState();
}

class _SellSharesDialogState extends State<SellSharesDialog> {
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _priceController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const VariableSizeTextField("Sell Shares",
                TextSizeConstants.DIALOG_HEADING, TextAlign.center),
            PaddedFormField(
              _priceController,
              "Price To Sell For",
              SellSharesInputValidation.validatePrice,
              textInputType: TextInputType.number,
            ),
            PaddedFormField(
              _amountController,
              "# Shares To Sell",
              SellSharesInputValidation.validateNumShares,
              textInputType: TextInputType.number,
            ),
            ConfirmAbortButtonBar(
              () => _processConfirm(context),
              () => _processAbort(context),
            ),
          ],
        ),
      ),
    );
  }

  void _processConfirm(BuildContext context) {
    if (_formKey.currentState?.validate() ?? false) {
      final SharesSold sharesSold = SharesSold(
          widget.asset,
          int.parse(_amountController.text),
          double.parse(_priceController.text));
      Navigator.pop(context, sharesSold);
    }
  }

  void _processAbort(BuildContext context) {
    Navigator.pop(context);
  }
}
