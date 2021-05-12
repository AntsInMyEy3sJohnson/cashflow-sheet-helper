import 'package:flutter/material.dart';

class StyledTextField extends StatelessWidget {

  final String text;

  const StyledTextField(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        minWidth: 200,
        minHeight: 50,
      ),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
        ),
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Text(
        text,
        textAlign: TextAlign.right,
        style: TextStyle(fontSize: 32),
      ),
    );
  }



}