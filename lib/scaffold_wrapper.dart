import 'package:cashflow_sheet_helper/routes/expenses.dart';
import 'package:cashflow_sheet_helper/routes/income.dart';
import 'package:cashflow_sheet_helper/routes/overview.dart';
import 'package:flutter/material.dart';

class ScaffoldWrapper extends StatelessWidget {

  static final Map<String, String> appBarTitles = <String, String> {
    Overview.ROUTE_ID: Overview.TITLE_FOR_APP_BAR,
    Income.ROUTE_ID: Income.TITLE_FOR_APP_BAR,
    Expenses.ROUTE_ID: Expenses.TITLE_FOR_APP_BAR,
  };

  final Widget body;

  const ScaffoldWrapper(this.body);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(),
      // Navigator.canPop(context) ? null :
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
            )
          ],
        ),
      ),
      body: this.body,
    );
  }


}