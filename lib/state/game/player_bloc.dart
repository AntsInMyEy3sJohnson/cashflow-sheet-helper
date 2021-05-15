import 'package:cashflow_sheet_helper/data/asset.dart';
import 'package:cashflow_sheet_helper/data/holding.dart';
import 'package:cashflow_sheet_helper/state/game/events/holding_bought.dart';
import 'package:cashflow_sheet_helper/state/game/events/player_event.dart';
import 'package:cashflow_sheet_helper/state/game/player_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'events/asset_bought.dart';

class PlayerBloc extends Bloc<PlayerEvent, PlayerState> {
  PlayerBloc(PlayerState initialState) : super(initialState);

  @override
  Stream<PlayerState> mapEventToState(PlayerEvent event) async* {
    if (event is AssetBought) {
      yield await _mapAssetBoughtToPlayerState(state, event);
    } else if (event is HoldingBought) {
      yield await _mapHoldingBoughtToPlayerState(state, event);
    }
  }

  Future<PlayerState> _mapHoldingBoughtToPlayerState(
      PlayerState state, HoldingBought event) async {
    List<Holding> holdings = List.from(state.holdings);
    holdings.add(Holding(
        name: event.name,
        downPayment: event.downPayment,
        buyingCost: event.buyingCost,
        mortgage: event.mortgage,
        cashflow: event.cashflow));
    return state.copyWithHoldings(holdings);
  }

  Future<PlayerState> _mapAssetBoughtToPlayerState(
      PlayerState state, AssetBought event) async {
    // We need new state containers -- list and enclosing
    // 'PlayerState' -- to cause all listening BlocBuilders
    // to rebuild
    List<Asset> assets = List.from(state.assets);
    assets.add(Asset(
        name: event.name,
        numShares: event.numShares,
        costPerShare: event.costPerShare));
    return state.copyWithAssets(assets);
  }
}
