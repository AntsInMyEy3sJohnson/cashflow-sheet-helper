import 'package:cashflow_sheet_helper/state/game/events/player_event.dart';

class CoinsSold extends PlayerEvent {

  final int numSold;
  final double pricePerCoin;

  const CoinsSold(this.numSold, this.pricePerCoin);

}