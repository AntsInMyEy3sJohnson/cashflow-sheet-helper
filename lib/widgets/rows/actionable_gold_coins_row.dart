import 'package:cashflow_sheet_helper/state/game/events/coins_bought.dart';
import 'package:cashflow_sheet_helper/state/game/player_bloc.dart';
import 'package:cashflow_sheet_helper/state/game/player_state.dart';
import 'package:cashflow_sheet_helper/widgets/dialogs/buy_coins_dialog.dart';
import 'package:cashflow_sheet_helper/widgets/reusable_snackbar.dart';
import 'package:cashflow_sheet_helper/widgets/rows/two_text_field_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ActionableGoldCoinsRow extends StatefulWidget {

  const ActionableGoldCoinsRow();

  @override
  _ActionableGoldCoinsRowState createState() => _ActionableGoldCoinsRowState();
}

class _ActionableGoldCoinsRowState extends State<ActionableGoldCoinsRow> {

  late final PlayerBloc _playerBloc;

  @override
  void initState() {
    super.initState();
    _playerBloc = context.read<PlayerBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlayerBloc, PlayerState>(
        builder: (context, state) {
          return Slidable(
            actionPane: SlidableDrawerActionPane(),
            actionExtentRatio: 0.25,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TwoTextFieldRow("Gold coins:", "${state.numGoldCoins}", 19),
            ),
            actions: [
              IconSlideAction(
                caption: "Buy",
                color: Colors.purpleAccent,
                icon: Icons.shopping_cart_outlined,
                onTap: _showBuyCoinsDialog,
              ),
            ],
            secondaryActions: [
              IconSlideAction(
                caption: "Sell",
                color: Colors.blueAccent,
                icon: Icons.monetization_on_outlined,
                onTap: () => print("Sell coins"),
              )
            ],
          );
        }
    );
  }

  void _showBuyCoinsDialog() async {
    final CoinsBought? coinsBought = await showDialog<CoinsBought>(
        context: context,
        builder: (_) {
          return BuyCoinsDialog();
        });
    if(coinsBought != null) {
      _playerBloc.add(coinsBought);
      ScaffoldMessenger.of(context).showSnackBar(
        ReusableSnackbar.fromChildren(<Widget>[
          const Text("Gold coins bought."),
          Text("Number of coins +${coinsBought.amount}"),
          Text("Cash -${coinsBought.amount * coinsBought.price}"),
        ])
      );
    }
  }
}