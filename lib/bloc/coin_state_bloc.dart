part of 'coin_bloc.dart';


@immutable
abstract class CoinState{
  final CoinModel coin;
  const CoinState({
    required this.coin
  });
}
class CoinInitState extends CoinState{
   CoinInitState(): super(coin: coin);

}