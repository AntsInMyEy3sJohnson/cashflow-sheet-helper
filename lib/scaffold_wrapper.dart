import 'package:cashflow_sheet_helper/routes/income.dart';
import 'package:flutter/material.dart';

class ScaffoldWrapper extends StatelessWidget {

  final Widget body;

  const ScaffoldWrapper(this.body);

  @override
  Widget build(BuildContext context) {
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
              title: const Text("Income"),
              onTap: () => Navigator.pushNamed(context, Income.ROUTE_ID),
            )
          ],
        ),
      ),
      body: this.body,
    );
  }


}