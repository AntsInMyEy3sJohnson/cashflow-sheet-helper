import 'package:cashflow_sheet_helper/state/player/events/player_event.dart';

class AssetBought extends PlayerEvent {

  final String name;
  final int numShares;
  final double costPerShare;
  final double totalCost;

  const AssetBought(this.name, this.numShares, this.costPerShare, this.totalCost);

}