import 'package:cashflow_sheet_helper/state/game/events/holding_bought.dart';
import 'package:cashflow_sheet_helper/state/game/player_bloc.dart';
import 'package:cashflow_sheet_helper/state/game/player_state.dart';
import 'package:cashflow_sheet_helper/widgets/dialogs/buy_holding_dialog.dart';
import 'package:cashflow_sheet_helper/widgets/reusable_snackbar.dart';
import 'package:cashflow_sheet_helper/widgets/three_text_field_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HoldingList extends StatefulWidget {
  const HoldingList();

  @override
  _HoldingListState createState() => _HoldingListState();
}

class _HoldingListState extends State<HoldingList> {
  PlayerBloc _playerBloc;

  @override
  void initState() {
    super.initState();
    _playerBloc = context.read<PlayerBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlayerBloc, PlayerState>(
      builder: (context, state) {
        return ListView.builder(
          itemCount: state.holdings.length + 1,
          itemBuilder: (context, i) {
            if (i < state.holdings.length) {
              final holding = state.holdings[i];
              return ListTile(
                title: ThreeTextFieldRow("${holding.name}",
                    "${holding.downPayment}", "${holding.buyingCost}", 18),
              );
            }
            return ElevatedButton(
                onPressed: () async {
                  HoldingBought holdingBought = await showDialog<HoldingBought>(
                      context: context,
                      builder: (_) {
                        return BuyHoldingDialog();
                      });
                  _addHolding(context, holdingBought);
                },
                child: const Text("Buy"));
          },
        );
      },
    );
  }

  void _addHolding(BuildContext context, HoldingBought holdingBought) {
    _playerBloc.add(holdingBought);
    ScaffoldMessenger.of(context)
        .showSnackBar(ReusableSnackbar.fromChildren(<Widget>[
      const Text("Holding bought"),
      Text("Cash -${holdingBought.downPayment}"),
      Text("Liabilities +${holdingBought.mortgage}"),
      Text("Cashflow +${holdingBought.cashflow}")
    ]));
  }
}
