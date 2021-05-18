import 'package:cashflow_sheet_helper/data/asset.dart';
import 'package:cashflow_sheet_helper/data/holding.dart';
import 'package:cashflow_sheet_helper/state/game/events/cashflow_reached.dart';
import 'package:cashflow_sheet_helper/state/game/events/doodad_bought.dart';
import 'package:cashflow_sheet_helper/state/game/events/holding_bought.dart';
import 'package:cashflow_sheet_helper/state/game/events/money_given_to_charity.dart';
import 'package:cashflow_sheet_helper/state/game/events/player_event.dart';
import 'package:cashflow_sheet_helper/state/game/player_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'events/asset_bought.dart';

class PlayerBloc extends Bloc<PlayerEvent, PlayerState> {
  PlayerBloc(PlayerState initialState) : super(initialState);

  @override
  Stream<PlayerState> mapEventToState(PlayerEvent event) async* {
    if (event is AssetBought) {
      yield await _mapAssetBoughtToPlayerState(event);
    } else if (event is HoldingBought) {
      yield await _mapHoldingBoughtToPlayerState(event);
    } else if (event is CashflowReached) {
      yield await _mapCashflowReachedToPlayerState(state);
    } else if (event is MoneyGivenToCharity) {
      yield await _mapCharityToPlayerState();
    } else if (event is DoodadBought) {
      yield await _mapDoodadBoughtToPlayerState(event);
    }
  }

  Future<PlayerState> _mapDoodadBoughtToPlayerState(DoodadBought event) async {
    final newBalance = state.balance - event.amount;
    return state.copyWithBalance(newBalance);
  }

  Future<PlayerState> _mapCharityToPlayerState() async {
    final newCash = state.balance - (state.totalIncome * 0.1);
    return state.copyWithBalance(newCash);
  }

  Future<PlayerState> _mapCashflowReachedToPlayerState(
      PlayerState state) async {
    final newCash = state.balance + state.cashflow;
    return state.copyWithBalance(newCash);
  }

  Future<PlayerState> _mapHoldingBoughtToPlayerState(HoldingBought event) async {
    List<Holding> holdings = List.from(state.holdings);
    holdings.add(Holding(
        name: event.name,
        downPayment: event.downPayment,
        buyingCost: event.buyingCost,
        mortgage: event.mortgage,
        cashflow: event.cashflow));
    final newCash = state.balance - event.downPayment;
    return state.copyWithHoldingsAndBalance(holdings, newCash);
  }

  Future<PlayerState> _mapAssetBoughtToPlayerState(AssetBought event) async {
    // We need new state containers -- list and enclosing
    // 'PlayerState' -- to cause all listening BlocBuilders
    // to rebuild
    List<Asset> assets = List.from(state.assets);
    assets.add(Asset(
        name: event.name,
        numShares: event.numShares,
        costPerShare: event.costPerShare));
    final newCash = state.balance - event.totalCost;
    return state.copyWithAssetsAndBalance(assets, newCash);
  }
}
