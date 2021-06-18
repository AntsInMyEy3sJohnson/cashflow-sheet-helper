import 'package:flutter/material.dart';

class SimpleInfoDialog extends StatelessWidget {
  final String title;
  final Widget content;

  const SimpleInfoDialog(this.title, this.content);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: content,
      actions: [
        TextButton(
            onPressed: () => Navigator.pop(context), child: const Text("OK")),
      ],
    );
  }

}
