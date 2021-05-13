import 'package:cashflow_sheet_helper/routes.dart';
import 'package:cashflow_sheet_helper/routes/overview.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateTitle: (_) => "CashFlow Sheet Helper",
      onGenerateRoute: RouteGenerator.generateRoute,
      initialRoute: Overview.ROUTE_ID,
    );
  }
}
