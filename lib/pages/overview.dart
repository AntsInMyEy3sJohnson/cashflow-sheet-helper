import 'package:cashflow_sheet_helper/data/player.dart';
import 'package:cashflow_sheet_helper/state/game/events/cashflow_reached.dart';
import 'package:cashflow_sheet_helper/state/game/events/money_given_to_charity.dart';
import 'package:cashflow_sheet_helper/state/game/player_bloc.dart';
import 'package:cashflow_sheet_helper/state/game/player_state.dart';
import 'package:cashflow_sheet_helper/widgets/bordered_text_field.dart';
import 'package:cashflow_sheet_helper/widgets/button_row.dart';
import 'package:cashflow_sheet_helper/widgets/overview_row.dart';
import 'package:cashflow_sheet_helper/widgets/reusable_snackbar.dart';
import 'package:cashflow_sheet_helper/widgets/variable_size_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Overview extends StatefulWidget {
  static const ROUTE_ID = "/";

  const Overview();

  @override
  _OverviewState createState() => _OverviewState();
}

class _OverviewState extends State<Overview> {
  PlayerBloc _playerBloc;

  @override
  void initState() {
    super.initState();
    _playerBloc = context.read<PlayerBloc>();
  }

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
                child: const VariableSizeTextField(
                    "Income and balance overview", 25, TextAlign.center),
              ),
              OverviewRow(
                  "Income", "${player.activeIncome} + ${state.passiveIncome}"),
              OverviewRow("Expenses", "${state.totalExpenses}"),
              OverviewRow("Cashflow", "${state.cashflow}"),
              OverviewRow("Account balance", "${state.balance}"),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: const VariableSizeTextField(
                    "Actions", 25, TextAlign.center),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () => _processCashflowDay(context, state),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: const VariableSizeTextField(
                        "Cashflow day!", 40, TextAlign.center),
                  ),
                ),
              ),
              ButtonRow("Charity", "Consuming",
                  () => _processCharity(context, state), _processConsuming),
              ButtonRow("Child", "Unemployed", null, null),
              ButtonRow("Take up loan", "Pay back loan", null, null),
            ],
          ),
        );
      },
    );
  }

  void _processCashflowDay(BuildContext context, PlayerState state) {
    _playerBloc.add(const CashflowReached());
    ScaffoldMessenger.of(context)
        .showSnackBar(ReusableSnackbar.fromChildren(<Widget>[
      const Text("Monthly cashflow added to balance."),
      Text("Cash +${state.cashflow}"),
    ]));
  }

  void _processCharity(BuildContext context, PlayerState state) async {
    final charityAmount = state.totalIncome * 0.1;
    final charity = await showDialog<bool>(
        context: context,
        builder: (_) {
          return AlertDialog(
            title: const Text("Give money to charity"),
            content: Text(
                "Give 10 % of your total income ($charityAmount) to charity?"),
            actions: [
              TextButton(
                  onPressed: () => Navigator.pop(context, true),
                  child: const Text("Confirm")),
              TextButton(
                  onPressed: () => Navigator.pop(context, false),
                  child: const Text("Abort")),
            ],
          );
        });

    if (charity) {
      _playerBloc.add(const MoneyGivenToCharity());
      ScaffoldMessenger.of(context)
          .showSnackBar(ReusableSnackbar.fromChildren(<Widget>[
        const Text("10 % of income given to charity."),
        Text("Cash -$charityAmount"),
      ]));
    }
  }

  void _processConsuming() {}
}
