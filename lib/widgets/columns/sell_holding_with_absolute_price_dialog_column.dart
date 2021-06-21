import 'package:cashflow_sheet_helper/helpers/input_validation/sell_holding_input_validation.dart';
import 'package:cashflow_sheet_helper/widgets/textfields/padded_form_field.dart';
import 'package:cashflow_sheet_helper/widgets/textfields/padded_input_text_field.dart';
import 'package:flutter/material.dart';

class SellHoldingWithAbsolutePriceDialogColumn extends StatefulWidget {
  final String inputFieldHintText;
  final double originalBuyingCost;
  final double mortgage;
  final Function updateGainsCallback;

  const SellHoldingWithAbsolutePriceDialogColumn(this.inputFieldHintText,
      this.originalBuyingCost, this.mortgage, this.updateGainsCallback);

  @override
  _SellHoldingWithAbsolutePriceDialogColumnState createState() =>
      _SellHoldingWithAbsolutePriceDialogColumnState();
}

class _SellHoldingWithAbsolutePriceDialogColumnState
    extends State<SellHoldingWithAbsolutePriceDialogColumn> {
  final TextEditingController _sellingPriceController = TextEditingController();

  late double _amountOnTop;
  late double _gains;

  @override
  void initState() {
    super.initState();
    _amountOnTop = 0.0;
    _gains = _calculateGains();
    _sellingPriceController.addListener(_priceChangeListener);
  }

  @override
  void dispose() {
    _sellingPriceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          PaddedFormField(
            _sellingPriceController,
            widget.inputFieldHintText,
            SellHoldingInputValidation.validateAbsolutePrice,
            textInputType: TextInputType.number,
          ),
          // TODO Make this more beautiful -- table?
          Text("Buying cost (${widget.originalBuyingCost})"),
          Text("+ Amount on top ($_amountOnTop)"),
          Text("- Mortgage (${widget.mortgage})"),
          Text("= Gains ($_gains)"),
        ],
      ),
    );
  }

  void _priceChangeListener() {
    setState(() {
      _calculatePriceData();
    });
    widget.updateGainsCallback(_gains);
  }

  void _calculatePriceData() {
    _amountOnTop = _getAmountOnTop();
    _gains = _calculateGains();
  }

  double _calculateGains() {
    return widget.originalBuyingCost + _amountOnTop - widget.mortgage;
  }

  double _getAmountOnTop() {
    double? priceInput = double.tryParse(_sellingPriceController.text);

    return priceInput ?? 0.0;
  }
}
