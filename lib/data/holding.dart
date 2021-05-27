import 'package:cashflow_sheet_helper/data/holding_kind.dart';
import 'package:equatable/equatable.dart';

class Holding extends Equatable {
  final String name;
  final HoldingKind holdingKind;
  final int numUnits;
  final double downPayment;
  final double buyingCost;
  final double mortgage;
  final double cashflow;

  const Holding({
    required this.name,
    required this.holdingKind,
    required this.numUnits,
    required this.downPayment,
    required this.buyingCost,
    required this.mortgage,
    required this.cashflow,
  });

  @override
  List<Object> get props => [name, holdingKind, numUnits, downPayment, buyingCost, mortgage, cashflow];

}
