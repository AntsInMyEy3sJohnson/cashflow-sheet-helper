import 'package:flutter/material.dart';

class ConfirmAbortButtonBar extends StatelessWidget {

  final Function processConfirm;
  final Function processAbort;

  const ConfirmAbortButtonBar(this.processConfirm, this.processAbort);


  @override
  Widget build(BuildContext context) {
    return ButtonBar(
      children: [
        TextButton(
            onPressed: () => processConfirm(),
            child: const Text("Confirm", textAlign: TextAlign.end,)),
        TextButton(
            onPressed: () => processAbort(),
            child: const Text("Abort", textAlign: TextAlign.end,)),
      ],
    );
  }
}