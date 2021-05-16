import 'package:cashflow_sheet_helper/data/player.dart';
import 'package:cashflow_sheet_helper/state/game/player_bloc.dart';
import 'package:cashflow_sheet_helper/state/game/player_state.dart';
import 'package:cashflow_sheet_helper/widgets/bordered_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Overview extends StatelessWidget {
  static const ROUTE_ID = "/";

  const Overview();

  @override
  Widget build(BuildContext context) {
    final player = Player.getInstance();

    return BlocBuilder<PlayerBloc, PlayerState>(
      builder: (context, state) {
        return Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              BorderedTextField("${player.activeIncome}"),
              BorderedTextField("${state.passiveIncome}"),
              BorderedTextField("${state.totalIncome}"),
              BorderedTextField("${state.totalExpenses}"),
              BorderedTextField("${state.cashflow}"),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text("${state.cash}"),
              ),
            ],
          ),
        );
      },
    );
  }
}
