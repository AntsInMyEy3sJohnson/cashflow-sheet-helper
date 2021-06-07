import 'package:cashflow_sheet_helper/state/player/events/business_boom_occurred.dart';
import 'package:cashflow_sheet_helper/widgets/buttons/confirm_abort_button_bar.dart';
import 'package:cashflow_sheet_helper/widgets/textfields/padded_input_text_field.dart';
import 'package:cashflow_sheet_helper/widgets/textfields/variable_size_text_field.dart';
import 'package:flutter/material.dart';

class ConfigureBusinessBoomDialog extends StatelessWidget {
  final TextEditingController _thresholdController = TextEditingController();
  final TextEditingController _cashflowIncreaseController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const VariableSizeTextField("Business Boom!", 20, TextAlign.center),
          PaddedInputTextField(
            "Cashflow threshold",
            _thresholdController,
            textInputType: TextInputType.number,
          ),
          PaddedInputTextField(
            "Cashflow increase",
            _cashflowIncreaseController,
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
    final BusinessBoomOccurred businessBoomOccurred = BusinessBoomOccurred(
        double.parse(_thresholdController.text),
        double.parse(_cashflowIncreaseController.text));
    Navigator.pop(context, businessBoomOccurred);
  }

  void _processAbort(BuildContext context) {
    Navigator.pop(context);
  }
}
