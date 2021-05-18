import 'package:flutter/material.dart';

class YesNoAlertDialog extends StatelessWidget {

  final String title;
  final Widget content;

  const YesNoAlertDialog(this.title, this.content);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: content,
      actions: [
        TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text("Confirm")),
        TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text("Abort")),
      ],
    );
  }



}