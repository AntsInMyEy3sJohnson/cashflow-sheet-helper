import 'package:cashflow_sheet_helper/state/game/events/player_event.dart';

class SharesSold extends PlayerEvent {

  final int numSold;
  final double price;

  const SharesSold(this.numSold, this.price);

}