import 'package:cashflow_sheet_helper/state/game/events/asset_bought.dart';
import 'package:cashflow_sheet_helper/widgets/textfields/padded_input_text_field.dart';
import 'package:flutter/material.dart';

class BuyAssetDialog extends StatelessWidget {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _numSharesController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // TODO Add some validation to those
          PaddedInputTextField(
            "Name",
            _nameController,
          ),
          PaddedInputTextField(
            "Today's price",
            _priceController,
            textInputType: TextInputType.number,
          ),
          PaddedInputTextField(
            "# shares to buy",
            _numSharesController,
            textInputType: TextInputType.number,
          ),
          ElevatedButton(
              onPressed: () => _process(context), child: const Text("Confirm"))
        ],
      ),
    );
  }

  void _process(BuildContext context) {
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
