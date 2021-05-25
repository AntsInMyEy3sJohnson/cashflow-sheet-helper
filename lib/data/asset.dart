import 'package:equatable/equatable.dart';

class Asset extends Equatable {
  final String name;
  final int numShares;
  final double costPerShare;

  const Asset(
      {required this.name,
      required this.numShares,
      required this.costPerShare});

  @override
  List<Object> get props => [name, numShares, costPerShare];

}
