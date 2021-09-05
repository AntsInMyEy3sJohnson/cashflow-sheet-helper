import 'package:cashflow_sheet_helper/widgets/buttons/style_kind.dart';
import 'package:flutter/material.dart';

class ConfirmAbortButtonBar extends StatelessWidget {
  final Function processConfirm;
  final Function processAbort;

  final StyleKind styleKindConfirm;

  const ConfirmAbortButtonBar(this.processConfirm, this.processAbort,
      {StyleKind styleKindConfirm = StyleKind.ENABLED})
      : styleKindConfirm = styleKindConfirm;

  @override
  Widget build(BuildContext context) {
    return ButtonBar(
      children: [
        TextButton(
          onPressed: () => processAbort(),
          child: const Text(
            "Abort",
            textAlign: TextAlign.end,
          ),
        ),
        TextButton(
          onPressed: styleKindConfirm == StyleKind.ENABLED ? () => processConfirm() : null,
          child: Text(
            "Confirm",
            textAlign: TextAlign.end,
          ),
        ),
      ],
    );
  }

}
