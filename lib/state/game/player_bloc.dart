import 'package:cashflow_sheet_helper/data/asset.dart';
import 'package:cashflow_sheet_helper/data/holding.dart';
import 'package:cashflow_sheet_helper/data/player.dart';
import 'package:cashflow_sheet_helper/state/game/events/baby_born.dart';
import 'package:cashflow_sheet_helper/state/game/events/cashflow_reached.dart';
import 'package:cashflow_sheet_helper/state/game/events/doodad_bought.dart';
import 'package:cashflow_sheet_helper/state/game/events/holding_bought.dart';
import 'package:cashflow_sheet_helper/state/game/events/holding_sold.dart';
import 'package:cashflow_sheet_helper/state/game/events/loan_paid_back.dart';
import 'package:cashflow_sheet_helper/state/game/events/loan_taken.dart';
import 'package:cashflow_sheet_helper/state/game/events/money_given_to_charity.dart';
import 'package:cashflow_sheet_helper/state/game/events/player_event.dart';
import 'package:cashflow_sheet_helper/state/game/events/shares_backward_split.dart';
import 'package:cashflow_sheet_helper/state/game/events/shares_sold.dart';
import 'package:cashflow_sheet_helper/state/game/events/shares_split.dart';
import 'package:cashflow_sheet_helper/state/game/events/unemployment_incurred.dart';
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
    } else if (event is BabyBorn) {
      yield await _mapBabyBornToPlayerState(event, Player.getInstance());
    } else if (event is UnemploymentIncurred) {
      yield await _mapUnemploymentIncurredToPlayerState();
    } else if (event is LoanTaken) {
      yield await _mapLoanTakenToPlayerState(event);
    } else if (event is LoanPaidBack) {
      yield await _mapLoanPaidBackToPlayerState(event);
    } else if (event is SharesSold) {
      yield await _mapSharesSoldToPlayerState(event);
    } else if (event is SharesSplit) {
      yield await _mapShareSplitPerformedToPlayerState(event);
    } else if (event is SharesBackwardSplit) {
      yield await _mapShareBackwardSplitPerformedToPlayerState(event);
    } else if (event is HoldingSold) {
      yield await _mapHoldingSoldToPlayerState(event);
    }
  }

  Future<PlayerState> _mapHoldingSoldToPlayerState(HoldingSold event) async {
    final List<Holding> holdings = List.from(state.holdings);
    holdings.remove(event.holding);
    final double newBalance = state.balance + event.gains;
    return state.copyWithHoldingsAndBalance(holdings, newBalance);
  }

  Future<PlayerState> _mapShareBackwardSplitPerformedToPlayerState(
      SharesBackwardSplit event) async {
    final List<Asset> assets = List.from(state.assets);
    int index = assets.indexOf(event.asset);
    assets[index] = Asset(
      name: event.asset.name,
      numShares: (event.asset.numShares / 2).round(),
      costPerShare: event.asset.costPerShare,
    );
    return state.copyWithAssets(assets);
  }

  Future<PlayerState> _mapShareSplitPerformedToPlayerState(
      SharesSplit event) async {
    final List<Asset> assets = List.from(state.assets);
    int index = assets.indexOf(event.asset);
    assets[index] = Asset(
      name: event.asset.name,
      numShares: event.asset.numShares * 2,
      costPerShare: event.asset.costPerShare,
    );
    return state.copyWithAssets(assets);
  }

  Future<PlayerState> _mapSharesSoldToPlayerState(SharesSold event) async {
    final List<Asset> assets = List.from(state.assets);
    final Asset matchingAsset =
        assets.singleWhere((element) => element == event.asset);
    if (event.numSold == matchingAsset.numShares) {
      assets.remove(matchingAsset);
    } else {
      int index = assets.indexOf(event.asset);
      assets[index] = Asset(
          name: matchingAsset.name,
          numShares: matchingAsset.numShares - event.numSold,
          costPerShare: matchingAsset.costPerShare);
    }
    final newBalance = state.balance + (event.numSold * event.price);
    return state.copyWithAssetsAndBalance(assets, newBalance);
  }

  Future<PlayerState> _mapLoanPaidBackToPlayerState(LoanPaidBack event) async {
    final newBalance = state.balance - event.amount;
    final newTotalBankLoan = state.bankLoan - event.amount;
    return state.copyWithBalanceAndBankLoan(newBalance, newTotalBankLoan);
  }

  Future<PlayerState> _mapLoanTakenToPlayerState(LoanTaken event) async {
    final newBalance = state.balance + event.amount;
    final newTotalBankLoan = state.bankLoan + event.amount;
    return state.copyWithBalanceAndBankLoan(newBalance, newTotalBankLoan);
  }

  Future<PlayerState> _mapUnemploymentIncurredToPlayerState() async {
    final newBalance = state.balance - state.totalExpenses;
    return state.copyWithBalance(newBalance);
  }

  Future<PlayerState> _mapBabyBornToPlayerState(
      BabyBorn event, Player player) async {
    final newNumChildren = state.numChildren + 1;
    return state.copyWithNumChildren(newNumChildren);
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

  Future<PlayerState> _mapHoldingBoughtToPlayerState(
      HoldingBought event) async {
    List<Holding> holdings = List.from(state.holdings);
    holdings.add(Holding(
        name: event.name,
        holdingKind: event.holdingKind,
        numUnits: event.numUnits,
        downPayment: event.downPayment,
        buyingCost: event.buyingCost,
        mortgage: event.mortgage,
        cashflow: event.cashflow));
    final newBalance = state.balance - event.downPayment;
    return state.copyWithHoldingsAndBalance(holdings, newBalance);
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
    final newBalance = state.balance - event.totalCost;
    return state.copyWithAssetsAndBalance(assets, newBalance);
  }
}
