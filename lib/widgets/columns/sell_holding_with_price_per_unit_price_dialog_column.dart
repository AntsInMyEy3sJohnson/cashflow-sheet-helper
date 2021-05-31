import 'package:cashflow_sheet_helper/widgets/textfields/padded_input_text_field.dart';
import 'package:flutter/material.dart';

class SellHoldingWithPricePerUnitPriceDialogColumn extends StatefulWidget {
  final String inputFieldHintText;
  final double originalBuyingCost;
  final double mortgage;
  final int numUnits;
  final Function updateGainsCallback;

  const SellHoldingWithPricePerUnitPriceDialogColumn(this.inputFieldHintText,
      this.originalBuyingCost, this.mortgage, this.numUnits, this.updateGainsCallback);

  @override
  _SellHoldingWithPricePerUnitPriceDialogColumnState createState() =>
      _SellHoldingWithPricePerUnitPriceDialogColumnState();
}

class _SellHoldingWithPricePerUnitPriceDialogColumnState
    extends State<SellHoldingWithPricePerUnitPriceDialogColumn> {
  final TextEditingController _pricePerUnitController = TextEditingController();

  late double _pricePerUnit;
  late double _totalSellingPrice;
  late double _gains;

  @override
  void initState() {
    super.initState();
    _pricePerUnit = 0.0;
    _totalSellingPrice = _calculateTotalSellingPrice();
    _gains = _calculateGains();
    _pricePerUnitController.addListener(_pricePerUnitChangeListener);
  }

  @override
  void dispose() {
    _pricePerUnitController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          PaddedInputTextField(
              widget.inputFieldHintText, _pricePerUnitController),
          // TODO Make this more beautiful -- table?
          Text("Selling for (${widget.numUnits} * $_pricePerUnit = $_totalSellingPrice)"),
          Text("- Mortgage (${widget.mortgage})"),
          Text("= Gains ($_gains)"),
        ],
      ),
    );
  }

  void _pricePerUnitChangeListener() {
    setState(() {
      _pricePerUnit = _getPricePerUnit();
      _totalSellingPrice = _calculateTotalSellingPrice();
      _gains = _calculateGains();
    });
    widget.updateGainsCallback(_gains);
  }

  double _getPricePerUnit() {

    final double? pricePerUnitInput = double.tryParse(_pricePerUnitController.text);

    return pricePerUnitInput ?? 0.0;

  }

  double _calculateTotalSellingPrice() {
    return widget.numUnits * _getPricePerUnit();
  }

  double _calculateGains() {
    return _calculateTotalSellingPrice() - widget.mortgage;
  }
}
