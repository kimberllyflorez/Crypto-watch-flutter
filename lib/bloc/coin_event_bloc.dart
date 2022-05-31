part of 'coin_bloc.dart';

@immutable
abstract class CoinEvent extends Equatable {}

class LoadCoinsEvent extends CoinEvent {
  @override
  List<Object> get props => [];
}
class CoinSave extends CoinEvent{
  final CoinModel? selectCoin;

  CoinSave(this.selectCoin);
  @override
  List<Object> get props => [];

}