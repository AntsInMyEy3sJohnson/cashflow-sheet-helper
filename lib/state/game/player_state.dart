import 'package:cashflow_sheet_helper/data/asset.dart';
import 'package:cashflow_sheet_helper/data/holding.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

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
  late final double totalChildExpenses;
  late final double totalExpenses;
  late final double totalIncome;

  PlayerState({
    required this.bankLoan,
    required this.numChildren,
    required this.balance,
    required this.holdings,
    required this.assets,
  })  : passiveIncome = PlayerState._calculatePassiveIncome(),
        cashflow = 0,
        totalChildExpenses = 0,
        totalExpenses = 0,
        totalIncome = 0;

  static double _calculatePassiveIncome() {

    return 0.0;

  }

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
