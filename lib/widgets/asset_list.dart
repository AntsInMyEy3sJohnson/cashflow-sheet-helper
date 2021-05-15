import 'package:cashflow_sheet_helper/state/events/player_events.dart';
import 'package:cashflow_sheet_helper/state/player_bloc.dart';
import 'package:cashflow_sheet_helper/state/player_state.dart';
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
    print("Rebuilding");

    return BlocBuilder<PlayerBloc, PlayerState>(
      builder: (context, state) {
        print("In BlocBuilder");
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
            return ElevatedButton(onPressed: _addAsset, child: const Text("Add"));
          },
        );
      },
    );
  }

  void _addAsset() {
    // Hard-coded asset for now
    print("Adding asset");
    _playerBloc.add(AssetBought("ON2U", 15, 10));
  }
}
