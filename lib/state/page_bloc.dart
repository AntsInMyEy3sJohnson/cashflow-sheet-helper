import 'package:cashflow_sheet_helper/pages/assets.dart';
import 'package:cashflow_sheet_helper/pages/expenses.dart';
import 'package:cashflow_sheet_helper/pages/income.dart';
import 'package:cashflow_sheet_helper/pages/liabilities.dart';
import 'package:cashflow_sheet_helper/pages/overview.dart';
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
