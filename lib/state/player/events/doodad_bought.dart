import 'package:cashflow_sheet_helper/state/player/events/player_event.dart';

class DoodadBought extends PlayerEvent {

  final double amount;

  const DoodadBought(this.amount);

}