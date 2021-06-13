import 'package:cashflow_sheet_helper/widgets/text_size_constants.dart';
import 'package:cashflow_sheet_helper/widgets/textfields/variable_size_text_field.dart';
import 'package:flutter/material.dart';

import '../textfields/bordered_text_field.dart';

class OverviewRow extends StatelessWidget {

  final String label;
  final String text;

  const OverviewRow(this.label, this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          VariableSizeTextField(label, TextSizeConstants.TEXT_FIELD_ROW_ITEM, TextAlign.left),
          BorderedTextField(text),
        ],
      ),
    );
  }
}
