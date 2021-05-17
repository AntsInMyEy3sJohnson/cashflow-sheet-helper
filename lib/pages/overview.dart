import 'package:cashflow_sheet_helper/data/player.dart';
import 'package:cashflow_sheet_helper/state/game/player_bloc.dart';
import 'package:cashflow_sheet_helper/state/game/player_state.dart';
import 'package:cashflow_sheet_helper/widgets/bordered_text_field.dart';
import 'package:cashflow_sheet_helper/widgets/button_row.dart';
import 'package:cashflow_sheet_helper/widgets/overview_row.dart';
import 'package:cashflow_sheet_helper/widgets/variable_size_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Overview extends StatelessWidget {
  static const ROUTE_ID = "/";

  const Overview();

  @override
  Widget build(BuildContext context) {
    // TODO Make dimensions dynamic with 'MediaQuery.of()'
    final player = Player.getInstance();

    return BlocBuilder<PlayerBloc, PlayerState>(
      builder: (context, state) {
        return Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: const VariableSizeTextField("Income and balance overview", 25, TextAlign.center),
              ),
              OverviewRow(
                  "Income", "${player.activeIncome} + ${state.passiveIncome}"),
              OverviewRow("Expenses", "${state.totalExpenses}"),
              OverviewRow("Cashflow", "${state.cashflow}"),
              OverviewRow("Account balance", "${state.cash}"),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: const VariableSizeTextField("Actions", 25, TextAlign.center),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: const VariableSizeTextField("Cashflow day!", 40, TextAlign.center),
                  ),
                ),
              ),
              ButtonRow("Charity", "Consuming"),
              ButtonRow("Child", "Unemployed"),
              ButtonRow("Take up loan", "Pay back loan"),
            ],
          ),
        );
      },
    );
  }
}
