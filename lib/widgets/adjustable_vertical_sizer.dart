import 'package:flutter/material.dart';

class AdjustableVerticalSizer extends StatelessWidget {

  final double heightModifier;

  const AdjustableVerticalSizer({this.heightModifier = 0.01});

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: MediaQuery.of(context).size.height * heightModifier);
  }
}
