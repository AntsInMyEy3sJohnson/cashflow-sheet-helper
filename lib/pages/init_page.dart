import 'package:cashflow_sheet_helper/data/asset.dart';
import 'package:cashflow_sheet_helper/data/holding.dart';
import 'package:cashflow_sheet_helper/pages/overview.dart';
import 'package:cashflow_sheet_helper/state/game/events/profession_chosen.dart';
import 'package:cashflow_sheet_helper/state/game/game_bloc.dart';
import 'package:cashflow_sheet_helper/state/navigation/events/navigation_event.dart';
import 'package:cashflow_sheet_helper/state/navigation/events/page_switched.dart';
import 'package:cashflow_sheet_helper/state/navigation/page_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InitPage extends StatelessWidget {
  static const ROUTE_ID = "/init";

  const InitPage();

  @override
  Widget build(BuildContext context) {

    final gameBloc = context.watch<GameBloc>();
    final pageBloc = context.watch<PageBloc>();

    return Center(
      child: ElevatedButton(
        onPressed: () => _processGameStart(gameBloc, pageBloc),
        child: const Text("Start Game!"),
      ),
    );
  }

  void _processGameStart(GameBloc gameBloc, PageBloc pageBloc) {

    Map<String, dynamic> professionData = {
      "title": "Doctor",
      "dream": "Complete financial independence",
      "activeIncome": 13200.toDouble(),
      "taxes": 3200.toDouble(),
      "monthlyMortgageOrRent": 1900.toDouble(),
      "monthlyStudentLoan": 700.toDouble(),
      "monthlyCarLoan": 300.toDouble(),
      "monthlyCreditCardLoan": 200.toDouble(),
      "monthlyChildExpenses": 700.toDouble(),
      "monthlyOtherExpenses": 2000.toDouble(),
      "savings": 3500.toDouble(),
      "totalMortgage": 202000.toDouble(),
      "totalStudentLoan": 150000.toDouble(),
      "totalCarLoan": 19000.toDouble(),
      "totalCreditCardDebt": 10000.toDouble(),
      "bankLoan": 0.toDouble(),
      "numChildren": 0,
      "numGoldCoins": 0,
      // Initial cash = initial cashflow + savings
      "balance": 4900.0 + 3500.0,
    };

    gameBloc.add(ProfessionChosen(professionData));
    pageBloc.add(const PageSwitched(Overview.ROUTE_ID));

  }
}
