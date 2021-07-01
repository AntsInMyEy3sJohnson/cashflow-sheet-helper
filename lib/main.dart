import 'package:cashflow_sheet_helper/body_scaffold.dart';
import 'package:cashflow_sheet_helper/pages/init_page.dart';
import 'package:cashflow_sheet_helper/state/game/game_bloc.dart';
import 'package:cashflow_sheet_helper/state/game/game_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
// TODO Provide checks for account balance
// TODO On dialog to buy coins: Ask player for total buying price rather than price per coin
// TODO Grey out business boom when player does not own any businesses
// TODO Provide decimal point for number input
// TODO Fix overflows (one currently on buy holding dialog)
// TODO Adapt order of fields on buy holding dialog
// TODO Pre-populate real estate name
// TODO Include additional selling mode for real estate: Absolute price
// TODO Implement undo
// TODO Write asset names in caps
// TODO "Last pressed" field for cashflow day button
// TODO Sounds! :)
// TODO Color good stuff in green, bad stuff in red (e. g. balance increase should be displayed in green)
// TODO Put information currently loaned amount on dialog to pay back loan
// TODO Display difference between passive income and expenses as a kind of "counter to win"
Future<void> main() async {
  await _initHydratedBloc();
  runApp(const MyApp());
}

Future<Storage> _initHydratedBloc() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: await getApplicationDocumentsDirectory(),
  );
  return HydratedBloc.storage;
}

class MyApp extends StatelessWidget {

  const MyApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Cashflow Sheet Helper",
      home: BlocProvider<GameBloc>(
        create: (_) => GameBloc(GameState(InitPage.ROUTE_ID)),
        child: const BodyScaffold(),
      ),
    );
  }
}
