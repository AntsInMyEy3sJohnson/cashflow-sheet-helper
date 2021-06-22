import 'package:cashflow_sheet_helper/helpers/input_validation/buy_doodad_input_validation.dart';
import 'package:cashflow_sheet_helper/state/player/events/doodad_bought.dart';
import 'package:cashflow_sheet_helper/widgets/buttons/confirm_abort_button_bar.dart';
import 'package:cashflow_sheet_helper/widgets/constants/text_size_constants.dart';
import 'package:cashflow_sheet_helper/widgets/textfields/padded_form_field.dart';
import 'package:cashflow_sheet_helper/widgets/textfields/variable_size_text_field.dart';
import 'package:flutter/material.dart';

class BuyDoodadDialog extends StatefulWidget {
  const BuyDoodadDialog();

  @override
  _BuyDoodadDialogState createState() => _BuyDoodadDialogState();
}

class _BuyDoodadDialogState extends State<BuyDoodadDialog> {
  final TextEditingController _amountController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const VariableSizeTextField("Buy Doodad",
                TextSizeConstants.DIALOG_HEADING, TextAlign.center),
            PaddedFormField(
              _amountController,
              "Amount To Deduct From Account",
              BuyDoodadInputValidation.validateAmount,
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
      Navigator.pop(
          context, DoodadBought(double.parse(_amountController.text)));
    }
  }

  void _processAbort(BuildContext context) {
    Navigator.pop(context, null);
  }
}
