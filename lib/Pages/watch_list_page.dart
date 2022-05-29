import 'package:crypto_watcher/Service/data_respository_service.dart';
import 'package:crypto_watcher/bloc/coin_bloc.dart';
import 'package:crypto_watcher/model/model.dart';
import 'package:crypto_watcher/preference/utils_preference.dart';
import 'package:crypto_watcher/widgets%20/items_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WatchListPage extends StatelessWidget {
  const WatchListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: Text('WHATCHER'),
      ),
      body: FutureBuilder(
        future: getListCoin(),
        builder: (context, AsyncSnapshot<List<CoinModel>> snapshot) {
          if (snapshot.hasData) {
            final coins = snapshot.data ?? [];
            return ListView.builder(
              itemCount: coins.length,
              itemBuilder: (_, i) {
                return ItemList(coin: coins[i]);
              },
            );
          } else {
            return Center(
              child: Text('No select coin'),
            );
          }
        },
      ),
    );
  }

  Future<List<CoinModel>> getListCoin() async {
    final listCoin = await PreferenceUtils.getStringList('listCoin');

    List<CoinModel> coinsSelect = [];
    for (var element in listCoin) {
      coinsSelect.add(CoinModel.fromJson(element));
    }
    return coinsSelect;
  }
}

// 1. Convertir cada objeto sea CoinModel CoinModel.fromJson(objetoString).
// 2. Con el objetoCoinModel, retonar una lista de CoinModel. List<CoinModel>
// 3. Reusar el widget ItemList para pintar cada objeto guardado. Remplazar ListTile por ItemList