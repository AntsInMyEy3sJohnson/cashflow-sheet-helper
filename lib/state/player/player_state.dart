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
  static const String _PLACEHOLDER = "Unspecified";

  final Player player;
  final double bankLoan;
  final double balance;
  final int numChildren;
  final int numGoldCoins;
  final List<Holding> holdings;
  final List<Asset> assets;

  @JsonKey(ignore: true)
  late final double cashflow;

  @JsonKey(ignore: true)
  late final double passiveIncome;

  @JsonKey(ignore: true)
  late final double totalChildExpenses;

  @JsonKey(ignore: true)
  late final double totalExpenses;

  @JsonKey(ignore: true)
  late final double totalIncome;

  static double _calculatePassiveIncome(List<Holding> holdings) {
    if (holdings.length == 0) return 0.0;
    return holdings
        .map((h) => h.cashflow)
        .reduce((value, element) => value + element);
  }

  static double _calculateTotalIncome(
      double activeIncome, List<Holding> holdings) {
    return activeIncome + _calculatePassiveIncome(holdings);
  }

  static double _calculateCashflow(Player player, List<Holding> holdings,
      double totalBankLoan, int numChildren) {
    return _calculateTotalIncome(player.activeIncome, holdings) -
        _calculateTotalExpenses(player, totalBankLoan, numChildren);
  }

  static double _calculateTotalExpenses(
      Player player, double totalBankLoan, int numChildren) {
    final staticExpenses = player.taxes +
        player.monthlyMortgageOrRent +
        player.monthlyStudentLoan +
        player.monthlyCarLoan +
        player.monthlyCreditCardLoan +
        player.monthlyOtherExpenses;
    final dynamicExpenses = _calculateMonthlyBankLoan(totalBankLoan) +
        _calculateChildExpenses(player.monthlyChildExpenses, numChildren);
    return staticExpenses + dynamicExpenses;
  }

  static double _calculateChildExpenses(
      double monthlyChildExpenses, int numChildren) {
    return monthlyChildExpenses * numChildren;
  }

  static double _calculateMonthlyBankLoan(double totalBankLoan) {
    return totalBankLoan * 0.1;
  }

  factory PlayerState.dummyState() {
    return PlayerState(
        player: Player(
          title: _PLACEHOLDER,
          dream: _PLACEHOLDER,
          activeIncome: 0.0,
          taxes: 0.0,
          monthlyMortgageOrRent: 0.0,
          monthlyStudentLoan: 0.0,
          monthlyCarLoan: 0.0,
          monthlyCreditCardLoan: 0.0,
          monthlyChildExpenses: 0.0,
          monthlyOtherExpenses: 0.0,
          savings: 0.0,
          totalMortgage: 0.0,
          totalStudentLoan: 0.0,
          totalCarLoan: 0.0,
          totalCreditCardDebt: 0.0,
        ),
        bankLoan: 0.0,
        balance: 0.0,
        numChildren: 0,
        numGoldCoins: 0,
        holdings: <Holding>[],
        assets: <Asset>[]);
  }

  factory PlayerState.fromProfessionData(Map<String, dynamic> professionData) {
    final Player player = Player(
      title: professionData["title"] as String,
      dream: professionData["dream"] as String,
      activeIncome: professionData["activeIncome"],
      taxes: professionData["taxes"] as double,
      monthlyMortgageOrRent: professionData["monthlyMortgageOrRent"] as double,
      monthlyStudentLoan: professionData["monthlyStudentLoan"] as double,
      monthlyCarLoan: professionData["monthlyCarLoan"] as double,
      monthlyCreditCardLoan: professionData["monthlyCreditCardLoan"] as double,
      monthlyChildExpenses: professionData["monthlyChildExpenses"] as double,
      monthlyOtherExpenses: professionData["monthlyOtherExpenses"] as double,
      savings: professionData["savings"] as double,
      totalMortgage: professionData["totalMortgage"] as double,
      totalStudentLoan: professionData["totalStudentLoan"] as double,
      totalCarLoan: professionData["totalCarLoan"] as double,
      totalCreditCardDebt: professionData["totalCreditCardDebt"] as double,
    );
    final PlayerState playerState = PlayerState(
      player: player,
      bankLoan: professionData["bankLoan"] as double,
      balance: professionData["balance"] as double,
      numChildren: professionData["numChildren"] as int,
      numGoldCoins: professionData["numGoldCoins"] as int,
      holdings: <Holding>[],
      assets: <Asset>[],
    );
    return playerState;
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
        cashflow = PlayerState._calculateCashflow(
            player, holdings, bankLoan, numChildren),
        totalChildExpenses = PlayerState._calculateChildExpenses(
            player.monthlyChildExpenses, numChildren),
        totalExpenses =
            PlayerState._calculateTotalExpenses(player, bankLoan, numChildren),
        totalIncome =
            PlayerState._calculateTotalIncome(player.activeIncome, holdings);

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

  factory PlayerState.fromJson(Map<String, dynamic> json) =>
      _$PlayerStateFromJson(json);

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
