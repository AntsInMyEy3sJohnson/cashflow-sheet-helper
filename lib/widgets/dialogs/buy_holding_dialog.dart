import 'package:cashflow_sheet_helper/data/holding_kind.dart';
import 'package:cashflow_sheet_helper/helpers/holding_kind_helper.dart';
import 'package:cashflow_sheet_helper/state/game/events/holding_bought.dart';
import 'package:cashflow_sheet_helper/widgets/padded_input_text_field.dart';
import 'package:flutter/material.dart';

class BuyHoldingDialog extends StatefulWidget {
  @override
  _BuyHoldingDialogState createState() => _BuyHoldingDialogState();
}

class _BuyHoldingDialogState extends State<BuyHoldingDialog> {
  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _downPaymentController = TextEditingController();

  final TextEditingController _buyingCostController = TextEditingController();

  final TextEditingController _mortgageController = TextEditingController();

  final TextEditingController _cashflowController = TextEditingController();

  late HoldingKind _holdingKind;

  @override
  void initState() {
    super.initState();
    _holdingKind = HoldingKind.singleFamilyHouse;
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          DropdownButton(
            value: HoldingKindHelper.toHumanReadableName(_holdingKind),
            items: _holdingKindsToDropdownMenuItems(),
            hint: const Text("Kind of real estate"),
          ),
          PaddedInputTextField("Name", _nameController),
          PaddedInputTextField("Down payment", _downPaymentController),
          PaddedInputTextField("Buying cost", _buyingCostController),
          PaddedInputTextField("Mortgage", _mortgageController),
          PaddedInputTextField("Cashflow", _cashflowController),
          ElevatedButton(
              onPressed: () => _processPurchaseConfirmed(context), child: const Text("Confirm")),
        ],
      ),
    );
  }

  List<DropdownMenuItem<String>> _holdingKindsToDropdownMenuItems() {
    return List.from(HoldingKind.values
        .map((e) => HoldingKindHelper.toHumanReadableName(e))
        .map((e) => DropdownMenuItem<String>(value: e, child: Text(e))));
  }

  void _processHoldingKindSelectionChanged(String value) {
    setState(() {
      _holdingKind = HoldingKindHelper.fromHumanReadableName(value);
    });
  }

  void _processPurchaseConfirmed(BuildContext context) {
    final holdingBought = HoldingBought(
        _nameController.text,
        _holdingKind,
        42,
        double.parse(_downPaymentController.text),
        double.parse(_buyingCostController.text),
        double.parse(_mortgageController.text),
        double.parse(_cashflowController.text));
    Navigator.pop(context, holdingBought);
  }
}
