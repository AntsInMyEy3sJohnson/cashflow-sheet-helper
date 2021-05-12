import 'package:cashflow_sheet_helper/routes.dart';
import 'package:cashflow_sheet_helper/routes/cashflow_overview.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      onGenerateTitle: (_) => "CashFlow Sheet Helper",
      onGenerateRoute: RouteGenerator.generateRoute,
      initialRoute: CashflowOverview.ROUTE_ID,
    );
  }
}
