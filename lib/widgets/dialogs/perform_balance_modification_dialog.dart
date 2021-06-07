import 'package:cashflow_sheet_helper/state/player/events/balance_manually_modified.dart';
import 'package:cashflow_sheet_helper/widgets/buttons/confirm_abort_button_bar.dart';
import 'package:cashflow_sheet_helper/widgets/textfields/padded_input_text_field.dart';
import 'package:cashflow_sheet_helper/widgets/textfields/variable_size_text_field.dart';
import 'package:flutter/material.dart';

class PerformBalanceModificationDialog extends StatefulWidget {
  @override
  _PerformBalanceModificationDialogState createState() =>
      _PerformBalanceModificationDialogState();
}

class _PerformBalanceModificationDialogState
    extends State<PerformBalanceModificationDialog> {
  static const List<String> _MODIFICATION_OPTION_NAMES = <String>[
    "Increase",
    "Decrease"
  ];

  static const String _INCREASE_HINT_TEXT = "Current balance +X";
  static const String _DECREASE_HINT_TEXT = "Current balance -X";

  final TextEditingController _amountController = TextEditingController();

  static final List<bool> _modificationOptions = <bool>[true, false];

  late String _currentHintText;
  late double _modificationAmount;
  late ModificationMode _modificationMode;

  @override
  void initState() {
    super.initState();
    _modificationAmount = 0.0;
    _currentHintText = _INCREASE_HINT_TEXT;
    _modificationMode = _evaluateModificationMode();
  }

  @override
  void dispose() {
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const VariableSizeTextField(
              "Manual account balance modification", 20, TextAlign.center),
          const VariableSizeTextField(
            "Which kind of action would you like to perform?",
            16,
            TextAlign.center,
          ),
          ToggleButtons(
              children: List.of(_MODIFICATION_OPTION_NAMES.map((e) => Text(e))),
              onPressed: (index) => _processModificationKindChanged(index),
              isSelected: _modificationOptions),
          PaddedInputTextField(
            _currentHintText,
            _amountController,
            textInputType: TextInputType.number,
          ),
          ConfirmAbortButtonBar(
                _processConfirm,
                _processAbort,
          ),
        ],
      ),
    );
  }

  void _processConfirm() {
    Navigator.pop(
        context,
        BalanceManuallyModified(double.parse(_amountController.text),
            _modificationMode == ModificationMode.increase));
  }

  void _processAbort() {
    Navigator.pop(context);
  }

  void _processModificationKindChanged(int selectedIndex) {
    if (!_modificationOptions[selectedIndex]) {
      setState(() {
        _setSelectedState(selectedIndex);
        _setHintText();
      });
    }
  }

  void _setHintText() {
    if (_modificationMode == ModificationMode.increase) {
      _currentHintText = _INCREASE_HINT_TEXT;
    } else {
      _currentHintText = _DECREASE_HINT_TEXT;
    }
  }

  ModificationMode _evaluateModificationMode() {
    int selectedIndex = _modificationOptions.indexWhere((element) => element);
    final String currentlySelected = _MODIFICATION_OPTION_NAMES[selectedIndex];
    switch (currentlySelected) {
      case "Increase":
        return ModificationMode.increase;
      case "Decrease":
        return ModificationMode.decrease;
      default:
        return ModificationMode.increase;
    }
  }

  void _setSelectedState(int selectedIndex) {
    _modificationOptions[selectedIndex] = true;
    for (int i = 0; i < _modificationOptions.length; i++) {
      if (i == selectedIndex) {
        continue;
      }
      _modificationOptions[i] = false;
    }
    _modificationMode = _evaluateModificationMode();
  }
}

enum ModificationMode { increase, decrease }
