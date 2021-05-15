import 'package:cashflow_sheet_helper/state/game/events/player_event.dart';

class HoldingBought extends PlayerEvent {
  final String name;
  final double downPayment;
  final double buyingCost;
  final double mortgage;
  final double cashflow;

  const HoldingBought(this.name, this.downPayment, this.buyingCost,
      this.mortgage, this.cashflow);

}
