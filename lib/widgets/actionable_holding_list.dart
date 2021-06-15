import 'package:cashflow_sheet_helper/data/holding.dart';
import 'package:cashflow_sheet_helper/state/player/events/holding_bought.dart';
import 'package:cashflow_sheet_helper/state/player/events/holding_sold.dart';
import 'package:cashflow_sheet_helper/state/player/player_bloc.dart';
import 'package:cashflow_sheet_helper/state/player/player_state.dart';
import 'package:cashflow_sheet_helper/widgets/constants/color_constants.dart';
import 'package:cashflow_sheet_helper/widgets/constants/icon_constants.dart';
import 'package:cashflow_sheet_helper/widgets/dialogs/buy_holding_dialog.dart';
import 'package:cashflow_sheet_helper/widgets/helpers/dialog_helper.dart';
import 'package:cashflow_sheet_helper/widgets/dialogs/sell_holding_dialog.dart';
import 'package:cashflow_sheet_helper/widgets/reusable_snackbar.dart';
import 'package:cashflow_sheet_helper/widgets/rows/three_text_field_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ActionableHoldingList extends StatefulWidget {
  const ActionableHoldingList();

  @override
  _ActionableHoldingListState createState() => _ActionableHoldingListState();
}

class _ActionableHoldingListState extends State<ActionableHoldingList> {
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
        return ListView.builder(
          itemCount: state.holdings.length + 1,
          itemBuilder: (context, i) {
            if (i < state.holdings.length) {
              final holding = state.holdings[i];
              return Slidable(
                actionPane: SlidableDrawerActionPane(),
                actionExtentRatio: 0.25,
                child: ListTile(
                  title: ThreeTextFieldRow(
                    "${holding.name}",
                    "${holding.downPayment}",
                    "${holding.buyingCost}",
                    18,
                  ),
                ),
                secondaryActions: [
                  IconSlideAction(
                    caption: "Sell",
                    color: ColorConstants.SELL_ITEM,
                    icon: IconConstants.SELL,
                    onTap: () => _showSellHoldingDialog(holding),
                  )
                ],
              );
            }
            return ElevatedButton(
                onPressed: _showBuyHoldingDialog,
                child: const Text("Buy"));
          },
        );
      },
    );
  }

  void _showBuyHoldingDialog() async {
    final HoldingBought? holdingBought = await DialogHelper<HoldingBought?>()
        .displayDialog(context, BuyHoldingDialog());
    if (holdingBought != null) {
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

  void _showSellHoldingDialog(Holding holding) async {
    final HoldingSold? holdingSold = await DialogHelper<HoldingSold?>()
        .displayDialog(context, SellHoldingDialog(holding));
    if (holdingSold != null) {
      _playerBloc.add(holdingSold);
      ScaffoldMessenger.of(context).showSnackBar(
        ReusableSnackbar.fromChildren(<Widget>[
          Text("${holdingSold.holding.name} sold."),
          Text("Mortgage removed: ${holding.mortgage}"),
          Text("Cashflow removed: ${holding.cashflow}"),
          Text("Balance +${holdingSold.gains}"),
        ]),
      );
    }
  }

}
