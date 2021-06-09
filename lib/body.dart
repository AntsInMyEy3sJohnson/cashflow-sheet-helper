import 'package:cashflow_sheet_helper/state/game/game_bloc.dart';
import 'package:cashflow_sheet_helper/state/game/game_state.dart';
import 'package:cashflow_sheet_helper/state/navigation/page_bloc.dart';
import 'package:cashflow_sheet_helper/state/player/player_bloc.dart';
import 'package:cashflow_sheet_helper/state/player/player_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Body extends StatelessWidget {
  const Body();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PageBloc, Widget>(
      builder: (context, pageBlocState) {
        return Padding(
          padding: EdgeInsets.all(8),
          child: BlocBuilder<GameBloc, GameState>(
            builder: (context, gameBlocState) {
              return BlocProvider<PlayerBloc>(
                create: (_) => PlayerBloc(
                  PlayerState.fromProfessionData(gameBlocState.professionData),
                ),
                child: pageBlocState,
              );
            },
          ),
        );
      },
    );
  }
}
