import 'package:cashflow_sheet_helper/state/game/events/player_event.dart';

class CoinsBought extends PlayerEvent {

  final int numBought;
  final double pricePerCoin;

  const CoinsBought(this.numBought, this.pricePerCoin);

}