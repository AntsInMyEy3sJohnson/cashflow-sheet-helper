import 'package:cashflow_sheet_helper/routes/expenses.dart';
import 'package:cashflow_sheet_helper/routes/income.dart';
import 'package:cashflow_sheet_helper/routes/overview.dart';
import 'package:cashflow_sheet_helper/scaffold_wrapper.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  RouteGenerator._();

  static Route<dynamic> generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Overview.ROUTE_ID:
        return MaterialPageRoute(
            builder: (_) => ScaffoldWrapper(const Overview()));
      case Income.ROUTE_ID:
        return MaterialPageRoute(
            builder: (_) => ScaffoldWrapper(const Income()));
      case Expenses.ROUTE_ID:
        return MaterialPageRoute(
            builder: (_) => ScaffoldWrapper(const Expenses()));
      default:
        throw RouteException("No such route: ${routeSettings.name}");
    }
  }
}

class RouteException implements Exception {
  final String message;

  RouteException(this.message);
}
