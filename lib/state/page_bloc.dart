import 'package:cashflow_sheet_helper/routes/assets.dart';
import 'package:cashflow_sheet_helper/routes/expenses.dart';
import 'package:cashflow_sheet_helper/routes/income.dart';
import 'package:cashflow_sheet_helper/routes/liabilities.dart';
import 'package:cashflow_sheet_helper/routes/overview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PageBloc extends Bloc<String, Widget> {
  static final Map<String, Widget> _pages = <String, Widget>{
    Overview.ROUTE_ID: const Overview(),
    Income.ROUTE_ID: const Income(),
    Expenses.ROUTE_ID: const Expenses(),
    Assets.ROUTE_ID: const Assets(),
    Liabilities.ROUTE_ID: const Liabilities(),
  };

  PageBloc() : super(_pages[Overview.ROUTE_ID]);

  @override
  Stream<Widget> mapEventToState(String event) async* {
    yield _pages[event];
  }
}
