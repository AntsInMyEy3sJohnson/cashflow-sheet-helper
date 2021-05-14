import 'package:cashflow_sheet_helper/body.dart';
import 'package:cashflow_sheet_helper/routes/assets.dart';
import 'package:cashflow_sheet_helper/routes/expenses.dart';
import 'package:cashflow_sheet_helper/routes/income.dart';
import 'package:cashflow_sheet_helper/routes/liabilities.dart';
import 'package:cashflow_sheet_helper/routes/overview.dart';
import 'package:cashflow_sheet_helper/state/page_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BodyScaffold extends StatelessWidget {

  const BodyScaffold();

  @override
  Widget build(BuildContext context) {

    final pageBloc = context.watch<PageBloc>();

    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              child: const Text("Cashflow Sheet Helper"),
            ),
            ListTile(
              title: const Text("Overview"),
              onTap: () => pageBloc.add(Overview.ROUTE_ID),
            ),
            ListTile(
              title: const Text("Income"),
              onTap: () => pageBloc.add(Income.ROUTE_ID),
            ),
            ListTile(
              title: const Text("Expenses"),
              onTap: () => pageBloc.add(Expenses.ROUTE_ID),
            ),
            ListTile(
              title: const Text("Assets"),
              onTap: () => pageBloc.add(Assets.ROUTE_ID),
            ),
            ListTile(
              title: const Text("Liabilities"),
              onTap: () => pageBloc.add(Liabilities.ROUTE_ID),
            ),
          ],
        ),
      ),
      body: const Body(),
    );
  }



}