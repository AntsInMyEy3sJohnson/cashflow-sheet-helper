import 'package:cashflow_sheet_helper/data/holding.dart';
import 'package:cashflow_sheet_helper/state/game/events/holding_sold.dart';
import 'package:cashflow_sheet_helper/widgets/padded_input_text_field.dart';
import 'package:cashflow_sheet_helper/widgets/variable_size_text_field.dart';
import 'package:flutter/material.dart';

class SellSingleUnitHolding extends StatefulWidget {
  final Holding holding;

  const SellSingleUnitHolding(this.holding);

  @override
  _SellSingleUnitHoldingState createState() => _SellSingleUnitHoldingState();
}

class _SellSingleUnitHoldingState extends State<SellSingleUnitHolding> {
  static const List<String> _SELL_OPTION_NAMES = <String>[
    "Absolute",
    "Percentage"
  ];
  static const String _ABSOLUTE_HINT_TEXT = "Original Price + X";
  static const String _PERCENTAGE_HINT_TEXT = "Original Price + X %";
  static const String _INITIAL_PREVIEW_TEXT =
      "Provide an amount to preview your gains";
  static const String _DYNAMIC_PREVIEW_PREFIX = "Preview: ";

  static final List<bool> _sellOptions = <bool>[true, false];

  final TextEditingController _priceController = TextEditingController();

  late String _inputFieldHintText;
  late String _gainsPreview;
  late double _totalGains;

  // TODO Dispose controllers!
  @override
  void initState() {
    super.initState();
    _inputFieldHintText = _ABSOLUTE_HINT_TEXT;
    _gainsPreview = _INITIAL_PREVIEW_TEXT;
    _priceController.addListener(_priceChangeListener);
    _totalGains = 0.0;
  }

  @override
  void dispose() {
    _priceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const VariableSizeTextField(
              "Sell real estate holding", 20, TextAlign.center),
          const VariableSizeTextField(
              "How much is your buyer willing to pay on top the original price?",
              16,
              TextAlign.center),
          ToggleButtons(
            children: List.of(_SELL_OPTION_NAMES.map((e) => Text(e))),
            onPressed: (index) => _processSellOptionChanged(index),
            isSelected: _sellOptions,
          ),
          PaddedInputTextField(_inputFieldHintText, _priceController),
          Text(_gainsPreview),
          ElevatedButton(
              onPressed: () => _processConfirm(widget.holding, _totalGains),
              child: const Text("Confirm")),
          ElevatedButton(onPressed: _processAbort, child: const Text("Abort")),
        ],
      ),
    );
  }

  void _processConfirm(Holding holding, double sellingPrice) {
    Navigator.pop(context, HoldingSold(holding, sellingPrice));
  }

  void _processAbort() {
    Navigator.pop(context);
  }

  void _priceChangeListener() {
    setState(() {
      _generatePreviewText();
    });
  }

  void _generatePreviewText() {
    if (_priceController.text.isEmpty) {
      _gainsPreview = _INITIAL_PREVIEW_TEXT;
    } else {
      _totalGains = widget.holding.buyingCost +
          _calculateAmountOnTop() -
          widget.holding.mortgage;
      _gainsPreview =
          "$_DYNAMIC_PREVIEW_PREFIX: Selling price - mortgage = $_totalGains";
    }
  }

  double _calculateAmountOnTop() {
    double? priceInput = double.tryParse(_priceController.text);

    if (priceInput == null) {
      return 0.0;
    }

    if (_isAbsolute()) {
      return priceInput;
    }

    return widget.holding.buyingCost * priceInput / 100;
  }

  void _processSellOptionChanged(int selectedIndex) {
    if (!_sellOptions[selectedIndex]) {
      setState(() {
        _setSelectedState(selectedIndex);
        _setInputTextFieldHint(selectedIndex);
        _generatePreviewText();
      });
    }
  }

  void _setInputTextFieldHint(int selectedIndex) {
    if (_isAbsolute()) {
      _inputFieldHintText = _ABSOLUTE_HINT_TEXT;
    } else {
      _inputFieldHintText = _PERCENTAGE_HINT_TEXT;
    }
  }

  void _setSelectedState(int selectedIndex) {
    _sellOptions[selectedIndex] = true;
    for (int i = 0; i < _sellOptions.length; i++) {
      if (i == selectedIndex) {
        continue;
      }
      _sellOptions[i] = false;
    }
  }

  bool _isAbsolute() {
    int trueIndex = _sellOptions.indexWhere((element) => element);
    return _SELL_OPTION_NAMES[trueIndex] == "Absolute";
  }
}
