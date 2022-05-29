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

  saveCoin(CoinModel? coin) async {
    final List<String>? coinList = await PreferenceUtils.getStringList('listCoin');
    if (coinList != null) {
      int? indexCoin = validateCoinExist(coinList, coin?.id ?? '');
      if (indexCoin != null) {
        coinList.removeAt(indexCoin);
      } else {
        coinList.add(coin?.toJson() ?? '');
      }
      await PreferenceUtils.setStringList('listCoin', coinList);
    } else {
      await PreferenceUtils.setStringList('listCoin', [coin?.toJson() ?? '']);
    }
  }

  int? validateCoinExist(List<String> coinList, String value) {
    int? index;
    if (value.isNotEmpty && coinList.isNotEmpty) {
      for (int i = 0; i < coinList.length; i++) {
        CoinModel coinModel = CoinModel.fromJson(coinList[i]);
        if (coinModel.id == value) {
          index = i;
          break;
        }
      }
    }
    return index;
  }

}
