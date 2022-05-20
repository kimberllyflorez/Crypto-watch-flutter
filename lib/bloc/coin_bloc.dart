import 'package:crypto_watcher/model/model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'coin_event_bloc.dart';
part 'coin_state_bloc.dart';

class CoinBloc extends Bloc<CoinEvent, CoinState>{
  CoinBloc() : super(CoinInitState()){
   on<ActiveCoint>(((event, emit){
   emit(CoinState(event.coin))
  }));
}