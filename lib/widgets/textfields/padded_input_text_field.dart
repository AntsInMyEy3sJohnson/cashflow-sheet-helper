import 'package:cashflow_sheet_helper/widgets/paddings/adjustable_padding.dart';
import 'package:cashflow_sheet_helper/widgets/paddings/padding_kind.dart';
import 'package:flutter/material.dart';

class PaddedInputTextField extends StatelessWidget {
  final String _hintText;
  final TextEditingController _textEditingController;
  final TextInputType textInputType;

  const PaddedInputTextField(this._hintText, this._textEditingController,
      {this.textInputType = TextInputType.text});

  @override
  Widget build(BuildContext context) {
    return AdjustablePadding(
      paddingKind: PaddingKind.small,
      child: TextField(
        controller: _textEditingController,
        keyboardType: textInputType,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: _hintText,
        ),
      ),
    );
  }
}
