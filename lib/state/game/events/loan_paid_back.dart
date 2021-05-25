import 'package:cashflow_sheet_helper/state/game/events/player_event.dart';

class LoanPaidBack extends PlayerEvent {

  final double amount;

  const LoanPaidBack(this.amount);

}