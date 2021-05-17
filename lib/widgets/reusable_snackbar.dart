import 'package:flutter/material.dart';

class ReusableSnackbar {

  ReusableSnackbar._();

  static SnackBar fromChildren(List<Widget> children) {
    return SnackBar(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: children,
      ),
    );
  }

}

