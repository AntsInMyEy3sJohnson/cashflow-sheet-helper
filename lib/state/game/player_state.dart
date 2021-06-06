import 'package:cashflow_sheet_helper/data/asset.dart';
import 'package:cashflow_sheet_helper/data/holding.dart';
import 'package:cashflow_sheet_helper/data/player.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'player_state.g.dart';

/// Encapsulates all pieces of state about the player that
/// can change during a game.
@JsonSerializable(explicitToJson: true)
class PlayerState extends Equatable {
  final Player player;
  final double bankLoan;
  final double balance;
  final int numChildren;
  final int numGoldCoins;
  final List<Holding> holdings;
  final List<Asset> assets;

  late final double cashflow;
  late final double passiveIncome;
  late final double totalChildExpenses;
  late final double totalExpenses;
  late final double totalIncome;

  static double _calculatePassiveIncome(List<Holding> holdings) {
    if (holdings.length == 0) return 0.0;
    return holdings
        .map((h) => h.cashflow)
        .reduce((value, element) => value + element);
  }

  static double _calculateTotalIncome(List<Holding> holdings) {
    return Player.getInstance().activeIncome +
        _calculatePassiveIncome(holdings);
  }

  static double _calculateCashflow(
      List<Holding> holdings, double totalBankLoan, int numChildren) {
    return _calculateTotalIncome(holdings) -
        _calculateTotalExpenses(totalBankLoan, numChildren);
  }

  static double _calculateTotalExpenses(double totalBankLoan, int numChildren) {
    final player = Player.getInstance();
    final staticExpenses = player.taxes +
        player.monthlyMortgageOrRent +
        player.monthlyStudentLoan +
        player.monthlyCarLoan +
        player.monthlyCreditCardExpenses +
        player.monthlyOtherExpenses;
    final dynamicExpenses = _calculateMonthlyBankLoan(totalBankLoan) +
        _calculateChildExpenses(numChildren);
    return staticExpenses + dynamicExpenses;
  }

  static double _calculateChildExpenses(int numChildren) {
    return Player.getInstance().monthlyChildExpenses * numChildren;
  }

  static double _calculateMonthlyBankLoan(double totalBankLoan) {
    return totalBankLoan * 0.1;
  }

  PlayerState({
    required this.player,
    required this.bankLoan,
    required this.balance,
    required this.numChildren,
    required this.numGoldCoins,
    required this.holdings,
    required this.assets,
  })   : passiveIncome = PlayerState._calculatePassiveIncome(holdings),
        cashflow =
            PlayerState._calculateCashflow(holdings, bankLoan, numChildren),
        totalChildExpenses = PlayerState._calculateChildExpenses(numChildren),
        totalExpenses =
            PlayerState._calculateTotalExpenses(bankLoan, numChildren),
        totalIncome = PlayerState._calculateTotalIncome(holdings);

  PlayerState copyWithBalanceAndNumGoldCoins(double balance, int numGoldCoins) {
    return PlayerState(
        player: this.player,
        bankLoan: this.bankLoan,
        balance: balance,
        numChildren: this.numChildren,
        numGoldCoins: numGoldCoins,
        holdings: this.holdings,
        assets: this.assets);
  }

  PlayerState copyWithNumChildren(int newNumChildren) {
    return PlayerState(
      player: this.player,
      bankLoan: this.bankLoan,
      balance: this.balance,
      numChildren: newNumChildren,
      numGoldCoins: this.numGoldCoins,
      holdings: this.holdings,
      assets: this.assets,
    );
  }

  PlayerState copyWithBalanceAndBankLoan(double balance, double bankLoan) {
    return PlayerState(
        player: this.player,
        bankLoan: bankLoan,
        balance: balance,
        numChildren: this.numChildren,
        numGoldCoins: this.numGoldCoins,
        holdings: this.holdings,
        assets: this.assets);
  }

  PlayerState copyWithBalance(double balance) {
    return PlayerState(
      player: this.player,
      bankLoan: this.bankLoan,
      balance: balance,
      numChildren: this.numChildren,
      numGoldCoins: this.numGoldCoins,
      holdings: this.holdings,
      assets: this.assets,
    );
  }

  PlayerState copyWithHoldings(List<Holding> holdings) {
    return PlayerState(
      player: this.player,
      bankLoan: this.bankLoan,
      balance: this.balance,
      numChildren: this.numChildren,
      numGoldCoins: this.numGoldCoins,
      holdings: holdings,
      assets: this.assets,
    );
  }

  PlayerState copyWithHoldingsAndBalance(
      List<Holding> holdings, double balance) {
    return PlayerState(
      player: this.player,
      bankLoan: this.bankLoan,
      balance: balance,
      numChildren: this.numChildren,
      numGoldCoins: this.numGoldCoins,
      holdings: holdings,
      assets: this.assets,
    );
  }

  PlayerState copyWithAssets(List<Asset> assets) {
    return PlayerState(
        player: this.player,
        bankLoan: this.bankLoan,
        balance: this.balance,
        numChildren: this.numChildren,
        numGoldCoins: this.numGoldCoins,
        holdings: this.holdings,
        assets: assets);
  }

  PlayerState copyWithAssetsAndBalance(List<Asset> assets, double balance) {
    return PlayerState(
      player: this.player,
      bankLoan: this.bankLoan,
      balance: balance,
      numChildren: this.numChildren,
      numGoldCoins: this.numGoldCoins,
      holdings: this.holdings,
      assets: assets,
    );
  }

  factory PlayerState.fromJson(Map<String, dynamic> json) => _$PlayerStateFromJson(json);

  Map<String, dynamic> toJson() => _$PlayerStateToJson(this);

  @override
  List<Object> get props => [
        player,
        bankLoan,
        numChildren,
        numGoldCoins,
        totalChildExpenses,
        passiveIncome,
        totalIncome,
        totalExpenses,
        cashflow,
        balance,
        holdings,
        assets
      ];
}
