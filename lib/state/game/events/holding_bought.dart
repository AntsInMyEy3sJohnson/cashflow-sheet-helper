import 'package:cashflow_sheet_helper/data/holding_kind.dart';
import 'package:cashflow_sheet_helper/state/game/events/player_event.dart';

class HoldingBought extends PlayerEvent {
  final String name;
  final HoldingKind holdingKind;
  final int numUnits;
  final double downPayment;
  final double buyingCost;
  final double mortgage;
  final double cashflow;

  const HoldingBought(this.name, this.holdingKind, this.numUnits,
      this.downPayment, this.buyingCost, this.mortgage, this.cashflow);
}
