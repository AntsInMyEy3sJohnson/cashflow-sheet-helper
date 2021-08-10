import 'package:cashflow_sheet_helper/widgets/buttons/style_kind.dart';
import 'package:flutter/material.dart';

import 'colored_elevated_button.dart';

class ActionTileButton extends StatelessWidget {
  final String text;
  final double textSize;
  final Function callback;
  final StyleKind styleKind;

  const ActionTileButton(
      this.text, this.textSize, this.callback, this.styleKind);

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.9,
      heightFactor: 0.8,
      child: GridTile(
        child: ColoredElevatedButton(
          text,
          textSize,
          callback,
          styleKind,
          EdgeInsets.zero,
        ),
      ),
    );
  }
}
