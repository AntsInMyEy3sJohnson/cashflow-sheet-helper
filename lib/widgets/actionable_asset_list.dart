import 'package:cashflow_sheet_helper/state/game/events/asset_bought.dart';
import 'package:cashflow_sheet_helper/state/game/player_bloc.dart';
import 'package:cashflow_sheet_helper/state/game/player_state.dart';
import 'package:cashflow_sheet_helper/widgets/dialogs/buy_asset_dialog.dart';
import 'package:cashflow_sheet_helper/widgets/three_text_field_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AssetList extends StatefulWidget {
  const AssetList();

  @override
  _AssetListState createState() => _AssetListState();
}

class _AssetListState extends State<AssetList> {
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
          itemCount: state.assets.length + 1,
          itemBuilder: (context, i) {
            if (i < state.assets.length) {
              final asset = state.assets[i];
              return ListTile(
                title: ThreeTextFieldRow(
                  "${asset.name}",
                  "${asset.numShares}",
                  "${asset.costPerShare}",
                  18,
                ),
              );
            }
            return ElevatedButton(
                onPressed: () async {
                  AssetBought assetBought = await showDialog<AssetBought>(
                      context: context,
                      builder: (_) {
                        return BuyAssetDialog();
                      });
                  _addAsset(context, assetBought);
                },
                child: const Text("Add"));
          },
        );
      },
    );
  }

  void _addAsset(BuildContext context, AssetBought assetBought) {
    // Hard-coded asset for now
    _playerBloc.add(assetBought);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text("Asset bought."),
            Text("Cash -${assetBought.totalCost}"),
          ],
        ),
      ),
    );
  }
}
