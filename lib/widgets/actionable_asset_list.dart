import 'package:cashflow_sheet_helper/data/asset.dart';
import 'package:cashflow_sheet_helper/state/game/events/asset_bought.dart';
import 'package:cashflow_sheet_helper/state/game/events/shares_backward_split.dart';
import 'package:cashflow_sheet_helper/state/game/events/shares_sold.dart';
import 'package:cashflow_sheet_helper/state/game/events/shares_split.dart';
import 'package:cashflow_sheet_helper/state/game/player_bloc.dart';
import 'package:cashflow_sheet_helper/state/game/player_state.dart';
import 'package:cashflow_sheet_helper/widgets/dialogs/buy_asset_dialog.dart';
import 'package:cashflow_sheet_helper/widgets/dialogs/sell_shares_dialog.dart';
import 'package:cashflow_sheet_helper/widgets/dialogs/yes_no_alert_dialog.dart';
import 'package:cashflow_sheet_helper/widgets/reusable_snackbar.dart';
import 'package:cashflow_sheet_helper/widgets/rows/three_text_field_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ActionableAssetList extends StatefulWidget {
  const ActionableAssetList();

  @override
  _ActionableAssetListState createState() => _ActionableAssetListState();
}

class _ActionableAssetListState extends State<ActionableAssetList> {
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
          itemCount: state.assets.length + 1,
          itemBuilder: (context, i) {
            if (i < state.assets.length) {
              final asset = state.assets[i];
              // TODO Add indicator to right edge of item row to signal to user that row can be swiped
              return Slidable(
                actionPane: SlidableDrawerActionPane(),
                actionExtentRatio: 0.25,
                child: ListTile(
                  title: ThreeTextFieldRow(
                    "${asset.name}",
                    "${asset.numShares}",
                    "${asset.costPerShare}",
                    18,
                  ),
                ),
                secondaryActions: [
                  IconSlideAction(
                    caption: "Sell",
                    // TODO Put these into file with constants
                    color: Colors.blueAccent,
                    icon: Icons.monetization_on_outlined,
                    onTap: () => _showSellSharesDialog(asset),
                  ),
                  IconSlideAction(
                    caption: "Split",
                    color: Colors.greenAccent,
                    icon: Icons.arrow_upward,
                    onTap: () => _showSplitSharesDialog(asset),
                  ),
                  IconSlideAction(
                    caption: "Backward split",
                    color: Colors.redAccent,
                    icon: Icons.arrow_downward,
                    // TODO Disable this button if player holds only one share by this company
                    onTap: () => _showBackwardSplitSharesDialog(asset),
                  ),
                ],
              );
            }
            return ElevatedButton(
                onPressed: () async {
                  AssetBought? assetBought = await showDialog<AssetBought>(
                      context: context,
                      builder: (_) {
                        return BuyAssetDialog();
                      });
                  if (assetBought != null) {
                    _addAsset(context, assetBought);
                  }
                },
                child: const Text("Add"));
          },
        );
      },
    );
  }

  void _showBackwardSplitSharesDialog(Asset asset) async {
    final bool? dialogResult = await showDialog<bool>(
        context: context,
        builder: (_) {
          return YesNoAlertDialog(
            "Share Backward Split",
            Text(
                "Perform backward split on ${asset.name} shares? This will halve "
                "the number of shares you own by this company."),
          );
        });
    if (dialogResult ?? false) {
      _playerBloc.add(SharesBackwardSplit(asset));
      ScaffoldMessenger.of(context).showSnackBar(
        ReusableSnackbar.fromChildren(<Widget>[
          Text("Performed backward split on ${asset.name} shares."),
          Text("Number of ${asset.name} shares: -${(asset.numShares / 2).round()}"),
        ]),
      );
    }
  }

  void _showSplitSharesDialog(Asset asset) async {
    final bool? dialogResult = await showDialog<bool>(
        context: context,
        builder: (_) {
          // TODO Upper-case all dialog title
          return YesNoAlertDialog(
            "Share Split",
            Text("Perform split for ${asset.name} shares? This will double "
                "the number of shares you hold by this company."),
          );
        });
    if (dialogResult ?? false) {
      _playerBloc.add(SharesSplit(asset));
      ScaffoldMessenger.of(context).showSnackBar(
        ReusableSnackbar.fromChildren(<Widget>[
          Text("Performed split on ${asset.name} shares."),
          Text("Number of ${asset.name} shares +${asset.numShares}"),
        ]),
      );
    }
  }

  void _showSellSharesDialog(Asset asset) async {
    final SharesSold? sharesSold = await showDialog<SharesSold>(
        context: context,
        builder: (context) {
          return SellSharesDialog(asset);
        });
    if (sharesSold != null) {
      _playerBloc.add(sharesSold);
      ScaffoldMessenger.of(context).showSnackBar(
        ReusableSnackbar.fromChildren(<Widget>[
          Text("${sharesSold.numSold} shares sold."),
          Text("Balance +${sharesSold.numSold * sharesSold.price}"),
        ]),
      );
    }
  }

  void _addAsset(BuildContext context, AssetBought assetBought) {
    // Hard-coded asset for now
    _playerBloc.add(assetBought);
    ScaffoldMessenger.of(context)
        .showSnackBar(ReusableSnackbar.fromChildren(<Widget>[
      const Text("Asset bought."),
      Text("Balance -${assetBought.totalCost}"),
    ]));
  }
}
