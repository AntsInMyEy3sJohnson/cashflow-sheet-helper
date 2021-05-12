import 'package:cashflow_sheet_helper/routes/cashflow_overview.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  RouteGenerator._();

  static Route<dynamic> generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case CashflowOverview.ROUTE_ID:
        return MaterialPageRoute(builder: (_) => _withScaffold(const CashflowOverview()));
      default:
        throw RouteException("No such route: ${routeSettings.name}");
    }
  }

  static Widget _withScaffold(Widget widget) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Cashflow Sheet Helper"),
      ),
      body: widget,
    );

  }

}

class RouteException implements Exception {
  final String message;

  RouteException(this.message);
}
