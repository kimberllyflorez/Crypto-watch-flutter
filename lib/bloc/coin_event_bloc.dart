part of 'coin_bloc.dart';

@immutable
abstract class CoinEvent extends Equatable {

}

class LoadCoinsEvent extends CoinEvent {
  @override
  List<Object> get props => [];
}
