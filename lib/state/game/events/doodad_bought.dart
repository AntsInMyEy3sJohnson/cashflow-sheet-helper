import 'package:cashflow_sheet_helper/state/game/events/player_event.dart';

class DoodadBought extends PlayerEvent {

  final double amount;

  const DoodadBought(this.amount);

}