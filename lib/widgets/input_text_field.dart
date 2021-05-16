import 'package:flutter/material.dart';

class PaddedInputTextField extends StatelessWidget {
  final String _hintText;
  final TextEditingController _textEditingController;

  const PaddedInputTextField(this._hintText, this._textEditingController);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: TextField(
        controller: _textEditingController,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: _hintText,
        ),
      ),
    );
  }
}
