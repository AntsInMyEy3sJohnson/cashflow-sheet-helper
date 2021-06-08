import 'package:cashflow_sheet_helper/body_scaffold.dart';
import 'package:cashflow_sheet_helper/pages/init_page.dart';
import 'package:cashflow_sheet_helper/state/game/game_bloc.dart';
import 'package:cashflow_sheet_helper/state/game/game_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

Future<void> main() async {
  final Storage storage = await _initHydratedBloc();
  storage.delete('PlayerBloc');
  storage.delete('GameBloc');
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
        create: (_) => GameBloc(GameState(InitPage.ROUTE_ID, {})),
        child: const BodyScaffold(),
      ),
    );
  }
}
