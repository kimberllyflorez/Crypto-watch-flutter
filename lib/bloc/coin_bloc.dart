import 'package:crypto_watcher/Service/data_respository_service.dart';
import 'package:crypto_watcher/model/model.dart';
import 'package:crypto_watcher/preference/utils_preference.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:collection/collection.dart'; // You have to add this manually, for some reason it cannot be added automatically


part 'coin_event_bloc.dart';

part 'coin_state_bloc.dart';

class CoinBloc extends Bloc<CoinEvent, CoinState> {
  final DataRepositoryService _dataService;

  CoinBloc(this._dataService) : super(CoinInitState()) {
    _loadCoins();
  }

  _loadCoins() {
    on<LoadCoinsEvent>(
      ((event, emit) async {
        emit(LoadingCoinsState());
        try {
          final coins = await _dataService.getProjectsData();
          final saveListCoin = await PreferenceUtils.getStringList('listCoin');
          emit(CoinInitState(
            coins: coins,
            saveCoins: saveListCoin ?? [],
          ));
        } catch (e) {
          emit(ErrorCoinsState());
        }
      }),
    );
  }

}
