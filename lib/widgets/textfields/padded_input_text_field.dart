import 'package:flutter/material.dart';

class PaddedInputTextField extends StatelessWidget {
  final String _hintText;
  final TextEditingController _textEditingController;
  final TextInputType textInputType;

  const PaddedInputTextField(this._hintText, this._textEditingController,
      {this.textInputType = TextInputType.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
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
