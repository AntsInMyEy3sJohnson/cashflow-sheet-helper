import 'package:cashflow_sheet_helper/body_scaffold.dart';
import 'package:cashflow_sheet_helper/data/holding.dart';
import 'package:cashflow_sheet_helper/data/player.dart';
import 'package:cashflow_sheet_helper/state/navigation/page_bloc.dart';
import 'package:cashflow_sheet_helper/state/game/player_bloc.dart';
import 'package:cashflow_sheet_helper/state/game/player_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    // Hard-coded for now
    // TODO Put initialization of Player in initialization screen
    Player.createInstance(
        title: "Doctor",
        dream: "Magnum Ferrari",
        activeIncome: 13200,
        taxes: 3200,
        monthlyMortgageOrRent: 1900,
        monthlyStudentLoan: 700,
        monthlyCarLoan: 300,
        monthlyCreditCardLoan: 200,
        monthlyChildExpenses: 700,
        monthlyOtherExpenses: 2000,
        savings: 3500,
        totalMortgage: 202000,
        totalStudentLoan: 150000,
        totalCarLoan: 19000,
        totalCreditCardDebt: 10000);

    final PlayerState _playerState = PlayerState(
      bankLoan: 0,
      numChildren: 0,
      totalExpenses: 8300,
      passiveIncome: 0,
      totalIncome: 13200,
      totalChildExpenses: 0,
      cashflow: 4900,
      // Initial cash = initial cashflow + savings
      cash: 4900.0 + 3500.0,
      holdings: [],
      assets: [],
    );

    return MaterialApp(
      title: "Cashflow Sheet Helper",
      home: MultiBlocProvider(
        providers: [
          BlocProvider<PageBloc>(create: (_) => PageBloc()),
          BlocProvider<PlayerBloc>(create: (_) => PlayerBloc(_playerState)),
        ],
        child: const BodyScaffold(),
      ),
    );
  }
}
