import 'package:cashflow_sheet_helper/data/holding_kind.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'holding.g.dart';

@JsonSerializable()
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

  factory Holding.fromJson(Map<String, dynamic> json) => _$HoldingFromJson(json);

  Map<String, dynamic> toJson() => _$HoldingToJson(this);

  @override
  List<Object> get props => [name, holdingKind, numUnits, downPayment, buyingCost, mortgage, cashflow];

}
