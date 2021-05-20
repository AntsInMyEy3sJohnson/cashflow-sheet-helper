import 'package:flutter/material.dart';

class AmountSelectionRow extends StatelessWidget {

  final TextEditingController _amountController;

  const AmountSelectionRow(this._amountController);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: _amountController,
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Amount"
            ),
          ),
        ),
        Container(
          child: Column(
            children: [
              Icon(Icons.arrow_circle_up),
              Icon(Icons.arrow_circle_down),
            ],
          ),
        ),
      ],
    );
  }

}