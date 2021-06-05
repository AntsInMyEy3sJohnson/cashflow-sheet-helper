import 'package:cashflow_sheet_helper/data/player.dart';
import 'package:cashflow_sheet_helper/state/game/events/coins_bought.dart';
import 'package:cashflow_sheet_helper/state/game/player_bloc.dart';
import 'package:cashflow_sheet_helper/state/game/player_state.dart';
import 'package:cashflow_sheet_helper/widgets/actionable_asset_list.dart';
import 'package:cashflow_sheet_helper/widgets/actionable_holding_list.dart';
import 'package:cashflow_sheet_helper/widgets/dialogs/buy_coins_dialog.dart';
import 'package:cashflow_sheet_helper/widgets/rows/three_text_field_row.dart';
import 'package:cashflow_sheet_helper/widgets/rows/two_text_field_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class Assets extends StatelessWidget {
  static const String ROUTE_ID = "/assets";

  const Assets();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlayerBloc, PlayerState>(
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TwoTextFieldRow("Savings:", "4500", 19),
              Slidable(
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
                    onTap: () => print("Buy coins"),
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
              ),
              ThreeTextFieldRow(
                  "Shares & fonds:", "# shares:", "Cost per share:", 19),
              SizedBox(
                height: 200,
                child: const ActionableAssetList(),
              ),
              ThreeTextFieldRow(
                  "Real estate/companies:", "Down payment:", "Cost:", 19),
              Expanded(child: const ActionableHoldingList()),
            ],
          );
        }
    );
  }

  void _showBuyCoinsDialog(BuildContext context) async {
    final CoinsBought? coinsBought = await showDialog<CoinsBought>(
        context: context,
        builder: (_) {
          return BuyCoinsDialog();
        });
    if(coinsBought != null) {
    }

  }
}
