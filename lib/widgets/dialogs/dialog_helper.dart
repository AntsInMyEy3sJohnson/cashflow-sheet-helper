import 'package:flutter/material.dart';

class DialogHelper<T> {

  const DialogHelper();

  Future<T?> showDialog(BuildContext context, Widget dialog) {
    return Navigator.push(
      context,
      PageRouteBuilder(
        barrierDismissible: true,
        opaque: false,
        pageBuilder: (context, animation1, animation2) => dialog,
      ),
    );
  }

}