import 'package:cashflow_sheet_helper/state/player/events/player_event.dart';

class BalanceManuallyModified extends PlayerEvent {

  final double amount;
  final bool increase;

  const BalanceManuallyModified(this.amount, this.increase);

}