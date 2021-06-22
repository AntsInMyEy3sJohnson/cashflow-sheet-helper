import 'package:cashflow_sheet_helper/helpers/input_validation/buy_asset_input_validation.dart';
import 'package:cashflow_sheet_helper/state/player/events/asset_bought.dart';
import 'package:cashflow_sheet_helper/widgets/buttons/confirm_abort_button_bar.dart';
import 'package:cashflow_sheet_helper/widgets/constants/text_size_constants.dart';
import 'package:cashflow_sheet_helper/widgets/textfields/padded_form_field.dart';
import 'package:cashflow_sheet_helper/widgets/textfields/padded_input_text_field.dart';
import 'package:cashflow_sheet_helper/widgets/textfields/variable_size_text_field.dart';
import 'package:flutter/material.dart';

class BuyAssetDialog extends StatefulWidget {
  @override
  _BuyAssetDialogState createState() => _BuyAssetDialogState();
}

class _BuyAssetDialogState extends State<BuyAssetDialog> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _numSharesController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _nameController.dispose();
    _priceController.dispose();
    _numSharesController.dispose();
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
            const VariableSizeTextField(
                "Buy Shares", TextSizeConstants.DIALOG_HEADING, TextAlign.center),
            PaddedFormField(
                _nameController, "Name", BuyAssetInputValidation.validateName),
            PaddedFormField(_priceController, "Today's Price", BuyAssetInputValidation.validatePrice),
            PaddedFormField(_numSharesController, "# Shares To Buy", BuyAssetInputValidation.validateNumShares),
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
    if(_formKey.currentState?.validate() ?? false) {
      final numShares = int.parse(_numSharesController.text);
      final price = double.parse(_priceController.text);
      final assetBought = AssetBought(
        _nameController.text,
        numShares,
        price,
        numShares * price,
      );
      Navigator.pop(context, assetBought);
    }
  }

  void _processAbort(BuildContext context) {
    Navigator.pop(context);
  }
}
