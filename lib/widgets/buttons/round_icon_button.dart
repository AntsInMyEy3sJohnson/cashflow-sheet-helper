import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  final Function onPressedCallback;
  final IconData iconData;

  const RoundIconButton(this.onPressedCallback, this.iconData);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => onPressedCallback(),
      child: Icon(iconData),
      style: ElevatedButton.styleFrom(shape: CircleBorder()),
    );
  }
}
