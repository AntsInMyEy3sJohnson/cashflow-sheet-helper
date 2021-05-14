import 'package:flutter/cupertino.dart';

class Asset {
  final String name;
  final int numShares;
  final double costPerShare;

  const Asset(
      {@required this.name,
      @required this.numShares,
      @required this.costPerShare});
}
