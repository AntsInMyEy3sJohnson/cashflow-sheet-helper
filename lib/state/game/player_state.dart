import 'package:cashflow_sheet_helper/data/asset.dart';
import 'package:cashflow_sheet_helper/data/holding.dart';
import 'package:cashflow_sheet_helper/data/player.dart';
import 'package:equatable/equatable.dart';

/// Encapsulates all pieces of state about the player that
/// can change during a game.
class PlayerState extends Equatable {
  final double bankLoan;
  final int numChildren;
  final double balance;
  final List<Holding> holdings;
  final List<Asset> assets;

  late final double cashflow;
  late final double passiveIncome;
  late final double monthlyBankLoan;
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
    required this.bankLoan,
    required this.numChildren,
    required this.balance,
    required this.holdings,
    required this.assets,
  })   : passiveIncome = PlayerState._calculatePassiveIncome(holdings),
        cashflow =
            PlayerState._calculateCashflow(holdings, bankLoan, numChildren),
        totalChildExpenses = PlayerState._calculateChildExpenses(numChildren),
        totalExpenses =
            PlayerState._calculateTotalExpenses(bankLoan, numChildren),
        totalIncome = PlayerState._calculateTotalIncome(holdings);

  PlayerState copyWithNumChildren(int newNumChildren) {
    return PlayerState(
      bankLoan: this.bankLoan,
      numChildren: newNumChildren,
      balance: this.balance,
      holdings: this.holdings,
      assets: this.assets,
    );
  }

  PlayerState copyWithBalance(double balance) {
    return PlayerState(
      bankLoan: this.bankLoan,
      numChildren: this.numChildren,
      balance: balance,
      holdings: this.holdings,
      assets: this.assets,
    );
  }

  PlayerState copyWithHoldingsAndBalance(
      List<Holding> holdings, double balance) {
    return PlayerState(
      bankLoan: this.bankLoan,
      numChildren: this.numChildren,
      balance: balance,
      holdings: holdings,
      assets: this.assets,
    );
  }

  PlayerState copyWithAssetsAndBalance(List<Asset> assets, double balance) {
    return PlayerState(
      bankLoan: this.bankLoan,
      numChildren: this.numChildren,
      balance: balance,
      holdings: this.holdings,
      assets: assets,
    );
  }

  @override
  List<Object> get props => [
        bankLoan,
        numChildren,
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
