import 'package:cashflow_sheet_helper/state/game/events/player_event.dart';

class HoldingSold extends PlayerEvent {

  final String holdingName;
  final double price;

  const HoldingSold(this.holdingName, this.price);

}