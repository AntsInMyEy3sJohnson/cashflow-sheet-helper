import 'package:cashflow_sheet_helper/body_scaffold.dart';
import 'package:cashflow_sheet_helper/state/page_bloc.dart';
import 'package:cashflow_sheet_helper/state/player_bloc.dart';
import 'package:cashflow_sheet_helper/state/player_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'data/asset.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static final PlayerState _playerState = PlayerState(<Asset>[
    Asset(name: "GRO4US", numShares: 25, costPerShare: 5),
  ]);

  @override
  Widget build(BuildContext context) {
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
