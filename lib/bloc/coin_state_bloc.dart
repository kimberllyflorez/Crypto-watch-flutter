part of 'coin_bloc.dart';

@immutable
abstract class CoinState extends Equatable {
  final List<CoinModel>? coins = [];

  List<Object> get props => [];
}

class CoinInitState extends CoinState {
  final List<String>? saveCoins;
  final List<CoinModel>? coins;

  CoinInitState({this.coins, this.saveCoins});
}

class LoadingCoinsState extends CoinState {}

class ErrorCoinsState extends CoinState {}
