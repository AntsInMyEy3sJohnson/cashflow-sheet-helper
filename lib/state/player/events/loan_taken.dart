import 'package:cashflow_sheet_helper/state/player/events/player_event.dart';

class LoanTaken extends PlayerEvent {
  final double amount;

  const LoanTaken(this.amount);
}
