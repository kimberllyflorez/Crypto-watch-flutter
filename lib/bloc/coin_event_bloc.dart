part of 'coin_bloc.dart';

@immutable
abstract class CoinEvent{}

class ActiveCoint extends CoinEvent{
  final CoinModel coin;

  ActiveCoint(this.coin);
}