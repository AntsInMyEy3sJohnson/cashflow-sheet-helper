import 'package:cashflow_sheet_helper/state/game/events/player_event.dart';

class BalanceManuallyModified extends PlayerEvent {

  final double amount;
  final bool increase;

  const BalanceManuallyModified(this.amount, this.increase);

}