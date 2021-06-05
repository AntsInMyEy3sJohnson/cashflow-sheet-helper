import 'package:cashflow_sheet_helper/state/game/events/player_event.dart';

class CoinsBought extends PlayerEvent {

  final int amount;
  final double price;

  const CoinsBought(this.amount, this.price);

}