import 'package:cashflow_sheet_helper/body_scaffold.dart';
import 'package:cashflow_sheet_helper/state/page_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Cashflow Sheet Helper",
      home: BlocProvider<PageBloc>(
        create: (_) => PageBloc(),
        child: const BodyScaffold(),
      ),
    );
  }
}
