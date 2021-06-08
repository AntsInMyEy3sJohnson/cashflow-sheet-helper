import 'package:cashflow_sheet_helper/state/game/events/profession_chosen.dart';
import 'package:cashflow_sheet_helper/state/game/game_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InitPage extends StatelessWidget {
  static const ROUTE_ID = "/init";

  const InitPage();

  @override
  Widget build(BuildContext context) {

    final gameBloc = context.watch<GameBloc>();

    return Center(
      child: ElevatedButton(
        onPressed: () => _processGameStart(gameBloc),
        child: const Text("Start Game!"),
      ),
    );
  }

  void _processGameStart(GameBloc gameBloc) {

    Map<String, dynamic> professionData = {
      "title": "Doctor",
      "dream": "Complete financial independence",
      "activeIncome": 13200,
      "taxes": 3200,
      "monthlyMortgageOrRent": 1900,
      "monthlyStudentLoan": 700,
      "monthlyCarLoan": 300,
      "monthlyCreditCardLoan": 200,
      "monthlyChildExpenses": 700,
      "monthlyOtherExpenses": 2000,
      "savings": 3500,
      "totalMortgage": 202000,
      "totalStudentLoan": 150000,
      "totalCarLoan": 19000,
      "totalCreditCardDebt": 10000,
      "bankLoan": 0,
      "numChildren": 0,
      "numGoldCoins": 0,
      // Initial cash = initial cashflow + savings
      "balance": 4900.0 + 3500.0,
      "holdings": [],
      "assets": [],
    };

    gameBloc.add(ProfessionChosen(professionData));

  }
}
