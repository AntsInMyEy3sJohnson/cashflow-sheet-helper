import 'package:cashflow_sheet_helper/data/asset.dart';
import 'package:cashflow_sheet_helper/state/events/player_events.dart';
import 'package:cashflow_sheet_helper/state/player_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PlayerBloc extends Bloc<PlayerEvent, PlayerState> {
  PlayerBloc(PlayerState initialState) : super(initialState);

  @override
  Stream<PlayerState> mapEventToState(PlayerEvent event) async* {
    if (event is AssetBought) {
      print("Caught event: AssetBought");
      yield await _mapAssetBoughtToPlayerState(state, event);
    }
  }

  Future<PlayerState> _mapAssetBoughtToPlayerState(
      PlayerState playerState, AssetBought assetBought) async {
    List<Asset> assets = List.from(playerState.assets);
    assets.add(Asset(
        name: assetBought.name,
        numShares: assetBought.numShares,
        costPerShare: assetBought.costPerShare));
    return playerState.copyWith(assets);
  }
}
