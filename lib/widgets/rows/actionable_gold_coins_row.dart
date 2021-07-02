import 'package:cashflow_sheet_helper/state/player/events/coins_bought.dart';
import 'package:cashflow_sheet_helper/state/player/events/coins_sold.dart';
import 'package:cashflow_sheet_helper/state/player/player_bloc.dart';
import 'package:cashflow_sheet_helper/state/player/player_state.dart';
import 'package:cashflow_sheet_helper/widgets/constants/color_constants.dart';
import 'package:cashflow_sheet_helper/widgets/constants/icon_constants.dart';
import 'package:cashflow_sheet_helper/widgets/dialogs/buy_coins_dialog.dart';
import 'package:cashflow_sheet_helper/widgets/helpers/dialog_helper.dart';
import 'package:cashflow_sheet_helper/widgets/dialogs/sell_coins_dialog.dart';
import 'package:cashflow_sheet_helper/widgets/paddings/adjustable_padding.dart';
import 'package:cashflow_sheet_helper/widgets/paddings/padding_kind.dart';
import 'package:cashflow_sheet_helper/widgets/reusable_snackbar.dart';
import 'package:cashflow_sheet_helper/widgets/rows/two_text_field_row.dart';
import 'package:cashflow_sheet_helper/widgets/textfields/info_text.dart';
import 'package:cashflow_sheet_helper/widgets/textfields/info_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../constants/text_size_constants.dart';

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
    return BlocBuilder<PlayerBloc, PlayerState>(builder: (context, state) {
      return Slidable(
        actionPane: SlidableDrawerActionPane(),
        actionExtentRatio: 0.25,
        child: AdjustablePadding(
          paddingKind: PaddingKind.medium,
          child: TwoTextFieldRow("Gold coins:", "${state.numGoldCoins}",
              TextSizeConstants.TEXT_FIELD_ROW_ITEM),
        ),
        secondaryActions: [
          IconSlideAction(
            caption: "Buy",
            color: ColorConstants.BUY_ITEM,
            icon: IconConstants.BUY,
            onTap: _showBuyCoinsDialog,
          ),
          IconSlideAction(
            caption: "Sell",
            color: ColorConstants.SELL_ITEM,
            icon: IconConstants.SELL,
            onTap: () => _showSellCoinsDialog(state.numGoldCoins),
          )
        ],
      );
    });
  }

  void _showBuyCoinsDialog() async {
    final CoinsBought? coinsBought = await DialogHelper<CoinsBought?>()
        .displayDialog(context, BuyCoinsDialog());
    if (coinsBought != null) {
      _playerBloc.add(coinsBought);
      ScaffoldMessenger.of(context)
          .showSnackBar(ReusableSnackbar.fromChildren(<Widget>[
        InfoText("Gold coins bought."),
        InfoText(
          "Number of coins +${coinsBought.numBought}",
          infoTextKind: InfoTextKind.GOOD,
        ),
        InfoText(
          "Cash -${coinsBought.totalPrice}",
          infoTextKind: InfoTextKind.BAD,
        ),
      ]));
    }
  }

  void _showSellCoinsDialog(int numGoldCoinsInPossession) async {
    final CoinsSold? coinsSold = await DialogHelper<CoinsSold?>()
        .displayDialog(context, SellCoinsDialog(numGoldCoinsInPossession));
    if (coinsSold != null) {
      _playerBloc.add(coinsSold);
      ScaffoldMessenger.of(context).showSnackBar(
        ReusableSnackbar.fromChildren(<Widget>[
          InfoText("Gold coins sold."),
          InfoText(
            "Number of coins -${coinsSold.numSold}",
            infoTextKind: InfoTextKind.BAD,
          ),
          InfoText(
            "Cash +${coinsSold.numSold * coinsSold.pricePerCoin}",
            infoTextKind: InfoTextKind.GOOD,
          ),
        ]),
      );
    }
  }
}
