import 'package:equatable/equatable.dart';

abstract class PlayerEvent extends Equatable {

  const PlayerEvent();

  @override
  List<Object> get props => [];
}

class AssetBought extends PlayerEvent {

  final String name;
  final int numShares;
  final double costPerShare;

  const AssetBought(this.name, this.numShares, this.costPerShare);

}