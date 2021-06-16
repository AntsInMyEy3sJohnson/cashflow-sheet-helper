import 'package:cashflow_sheet_helper/data/holding_kind.dart';
import 'package:cashflow_sheet_helper/helpers/holding_kind_helper.dart';
import 'package:cashflow_sheet_helper/state/player/events/holding_bought.dart';
import 'package:cashflow_sheet_helper/widgets/buttons/confirm_abort_button_bar.dart';
import 'package:cashflow_sheet_helper/widgets/constants/text_size_constants.dart';
import 'package:cashflow_sheet_helper/widgets/textfields/padded_input_text_field.dart';
import 'package:cashflow_sheet_helper/widgets/textfields/variable_size_text_field.dart';
import 'package:flutter/material.dart';

class BuyHoldingDialog extends StatefulWidget {
  @override
  _BuyHoldingDialogState createState() => _BuyHoldingDialogState();
}

class _BuyHoldingDialogState extends State<BuyHoldingDialog> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _numUnitsController = TextEditingController();
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
  void dispose() {
    _disposeControllers();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const VariableSizeTextField("Buy Real Estate Or Business",
                TextSizeConstants.DIALOG_HEADING, TextAlign.center),
            DropdownButton<String>(
              value: HoldingKindHelper.toHumanReadableName(_holdingKind),
              items: _holdingKindsToDropdownMenuItems(),
              hint: const Text("Kind of real estate"),
              onChanged: (String? value) =>
                  _processHoldingKindSelectionChanged(value),
            ),
            // TODO Pre-populate name field base on selected type
            PaddedInputTextField("Name", _nameController),
            // TODO Hide this if selected type cannot contain more than one unit
            if (!HoldingKindHelper.isSingleUnitHolding(_holdingKind))
              PaddedInputTextField(
                "# Units",
                _numUnitsController,
                textInputType: TextInputType.number,
              ),
            PaddedInputTextField(
              "Down payment",
              _downPaymentController,
              textInputType: TextInputType.number,
            ),
            PaddedInputTextField(
              "Buying cost",
              _buyingCostController,
              textInputType: TextInputType.number,
            ),
            PaddedInputTextField(
              "Mortgage",
              _mortgageController,
              textInputType: TextInputType.number,
            ),
            PaddedInputTextField(
              "Cashflow",
              _cashflowController,
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

  List<DropdownMenuItem<String>> _holdingKindsToDropdownMenuItems() {
    return List.from(HoldingKind.values
        .map((e) => HoldingKindHelper.toHumanReadableName(e))
        .map((e) => DropdownMenuItem<String>(value: e, child: Text(e))));
  }

  void _processHoldingKindSelectionChanged(String? value) {
    if (value != null) {
      setState(() {
        _holdingKind = HoldingKindHelper.fromHumanReadableName(value);
        if (_holdingKind == HoldingKind.twoFamilyHouse) {
          _numUnitsController.text = "2";
        } else if (HoldingKindHelper.isSingleUnitHolding(_holdingKind)) {
          _numUnitsController.text = "1";
        } else {
          _numUnitsController.text = "";
        }
      });
    }
  }

  void _processAbort(BuildContext context) {
    Navigator.pop(context);
  }

  void _processConfirm(BuildContext context) {
    final int numUnits = _numUnitsController.text.isEmpty
        ? 1
        : int.parse(_numUnitsController.text);
    final holdingBought = HoldingBought(
        _nameController.text,
        _holdingKind,
        numUnits,
        double.parse(_downPaymentController.text),
        double.parse(_buyingCostController.text),
        double.parse(_mortgageController.text),
        double.parse(_cashflowController.text));
    Navigator.pop(context, holdingBought);
  }

  void _disposeControllers() {
    _nameController.dispose();
    _numUnitsController.dispose();
    _downPaymentController.dispose();
    _buyingCostController.dispose();
    _mortgageController.dispose();
    _cashflowController.dispose();
  }
}
