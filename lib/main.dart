import 'package:cashflow_sheet_helper/body_scaffold.dart';
import 'package:cashflow_sheet_helper/data/player.dart';
import 'package:cashflow_sheet_helper/state/game/player_bloc.dart';
import 'package:cashflow_sheet_helper/state/game/player_state.dart';
import 'package:cashflow_sheet_helper/state/navigation/page_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

Future<void> main() async {
  await _initHydratedBloc();
  runApp(MyApp());
}

Future<void> _initHydratedBloc() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory: await getApplicationDocumentsDirectory(),
  );

}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Hard-coded for now
    // TODO Put initialization of Player in initialization screen
    final Player player = Player.createInstance(
        title: "Doctor",
        dream: "Complete financial independence",
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
      player: player,
      bankLoan: 0,
      numChildren: 0,
      numGoldCoins: 0,
      // Initial cash = initial cashflow + savings
      balance: 4900.0 + 3500.0,
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
