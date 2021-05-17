import 'package:cashflow_sheet_helper/data/asset.dart';
import 'package:cashflow_sheet_helper/data/holding.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

/// Encapsulates all pieces of state about the player that
/// can change during a game.
class PlayerState extends Equatable {
  final double bankLoan;
  final int numChildren;
  final double totalChildExpenses;
  final double passiveIncome;
  final double totalIncome;
  final double totalExpenses;
  final double cashflow;
  final double balance;
  final List<Holding> holdings;
  final List<Asset> assets;

  const PlayerState({
    @required this.bankLoan,
    @required this.numChildren,
    @required this.totalChildExpenses,
    @required this.passiveIncome,
    @required this.totalIncome,
    @required this.totalExpenses,
    @required this.cashflow,
    @required this.balance,
    @required this.holdings,
    @required this.assets,
  });

  PlayerState copyWithBalance(double balance) {
    return PlayerState(
      bankLoan: this.bankLoan,
      numChildren: this.numChildren,
      totalChildExpenses: this.totalChildExpenses,
      passiveIncome: this.passiveIncome,
      totalIncome: this.totalIncome,
      totalExpenses: this.totalExpenses,
      cashflow: this.cashflow,
      balance: balance,
      holdings: this.holdings,
      assets: this.assets,
    );
  }

  PlayerState copyWithHoldingsAndBalance(List<Holding> holdings, double balance) {
    return PlayerState(
      bankLoan: this.bankLoan,
      numChildren: this.numChildren,
      totalChildExpenses: this.totalChildExpenses,
      passiveIncome: this.passiveIncome,
      totalIncome: this.totalIncome,
      totalExpenses: this.totalExpenses,
      cashflow: this.cashflow,
      balance: balance,
      holdings: holdings,
      assets: this.assets,
    );
  }

  PlayerState copyWithAssetsAndBalance(List<Asset> assets, double balance) {
    return PlayerState(
      bankLoan: this.bankLoan,
      numChildren: this.numChildren,
      totalChildExpenses: this.totalChildExpenses,
      passiveIncome: this.passiveIncome,
      totalIncome: this.totalIncome,
      totalExpenses: this.totalExpenses,
      cashflow: this.cashflow,
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