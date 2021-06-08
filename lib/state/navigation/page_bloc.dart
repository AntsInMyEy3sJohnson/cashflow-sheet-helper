import 'package:cashflow_sheet_helper/pages/assets.dart';
import 'package:cashflow_sheet_helper/pages/expenses.dart';
import 'package:cashflow_sheet_helper/pages/income.dart';
import 'package:cashflow_sheet_helper/pages/init_page.dart';
import 'package:cashflow_sheet_helper/pages/liabilities.dart';
import 'package:cashflow_sheet_helper/pages/overview.dart';
import 'package:cashflow_sheet_helper/state/navigation/events/navigation_event.dart';
import 'package:cashflow_sheet_helper/state/navigation/events/page_switched.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PageBloc extends Bloc<NavigationEvent, Widget> {

  static final Map<String, Widget> _pages = <String, Widget>{
    InitPage.ROUTE_ID: const InitPage(),
    Overview.ROUTE_ID: const Overview(),
    Income.ROUTE_ID: const Income(),
    Expenses.ROUTE_ID: const Expenses(),
    Assets.ROUTE_ID: const Assets(),
    Liabilities.ROUTE_ID: const Liabilities(),
  };

  PageBloc(String initialPageRoute) : super(_pages[initialPageRoute]!);

  @override
  Stream<Widget> mapEventToState(NavigationEvent event) async* {
    if(event is PageSwitched) {
      yield _pages[event.targetPageRoute]!;
    }
  }
}
