import 'package:cashflow_sheet_helper/routes/overview.dart';
import 'package:cashflow_sheet_helper/state/page_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Body extends StatelessWidget {

  const Body();

  @override
  Widget build(BuildContext context) {

    final pageBloc = context.watch<PageBloc>();

    return Padding(
      padding: EdgeInsets.all(8),
      child: pageBloc.state,
    );
  }



}