import 'package:cashflow_sheet_helper/state/player/events/player_event.dart';

class BusinessBoomOccurred extends PlayerEvent {

  final double affectsBusinessesBelowThreshold;
  final double cashflowIncrease;

  const BusinessBoomOccurred(this.affectsBusinessesBelowThreshold, this.cashflowIncrease);

}