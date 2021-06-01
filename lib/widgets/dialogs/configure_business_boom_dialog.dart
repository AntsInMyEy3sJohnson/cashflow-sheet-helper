import 'package:cashflow_sheet_helper/state/game/events/business_boom_occurred.dart';
import 'package:cashflow_sheet_helper/widgets/textfields/padded_input_text_field.dart';
import 'package:cashflow_sheet_helper/widgets/textfields/variable_size_text_field.dart';
import 'package:flutter/material.dart';

class ConfigureBusinessBoomDialog extends StatelessWidget {

  final TextEditingController _thresholdController = TextEditingController();
  final TextEditingController _cashflowIncreaseController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const VariableSizeTextField("Business Boom!", 20, TextAlign.center),
          PaddedInputTextField("Cashflow threshold", _thresholdController),
          PaddedInputTextField("Cashflow increase", _cashflowIncreaseController),
          // TODO Refactor confirmation and abort buttons into dedicated widget and make dialogs use custom widget button
          ElevatedButton(onPressed: () => _processConfirm(context), child: const Text("Confirm")),
          ElevatedButton(onPressed: () => _processAbort(context), child: const Text("Abort")),
        ],
      ),
    );
  }

  void _processConfirm(BuildContext context) {
    final BusinessBoomOccurred businessBoomOccurred = BusinessBoomOccurred(double.parse(_thresholdController.text), double.parse(_cashflowIncreaseController.text));
    Navigator.pop(context, businessBoomOccurred);
  }

  void _processAbort(BuildContext context) {
    Navigator.pop(context);
  }

}