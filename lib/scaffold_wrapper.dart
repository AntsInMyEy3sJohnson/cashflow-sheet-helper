import 'package:cashflow_sheet_helper/routes/assets.dart';
import 'package:cashflow_sheet_helper/routes/expenses.dart';
import 'package:cashflow_sheet_helper/routes/income.dart';
import 'package:cashflow_sheet_helper/routes/liabilities.dart';
import 'package:flutter/material.dart';

class ScaffoldWrapper extends StatelessWidget {

  final Widget body;

  const ScaffoldWrapper(this.body);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(),
      drawer: Navigator.canPop(context) ? null : Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              child: const Text("Cashflow Sheet Helper"),
            ),
            ListTile(
              title: const Text("Income"),
              onTap: () => Navigator.pushNamed(context, Income.ROUTE_ID),
            ),
            ListTile(
              title: const Text("Expenses"),
              onTap: () => Navigator.pushNamed(context, Expenses.ROUTE_ID),
            ),
            ListTile(
              title: const Text("Assets"),
              onTap: () => Navigator.pushNamed(context, Assets.ROUTE_ID),
            ),
            ListTile(
              title: const Text("Liabilities"),
              onTap: () => Navigator.pushNamed(context, Liabilities.ROUTE_ID),
            ),
          ],
        ),
      ),
      body: this.body,
    );
  }


}