import 'package:cashflow_sheet_helper/data/holding.dart';
import 'package:cashflow_sheet_helper/state/game/events/player_event.dart';

class HoldingSold extends PlayerEvent {

  final Holding holding;
  final double gains;

  const HoldingSold(this.holding, this.gains);

}