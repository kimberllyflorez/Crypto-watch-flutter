import 'package:crypto_watcher/Service/data_respository_service.dart';
import 'package:crypto_watcher/bloc/coin_bloc.dart';
import 'package:crypto_watcher/preference/utils_preference.dart';
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
        builder: (context, AsyncSnapshot<List<String>> snapshot) {
          if (snapshot.hasData) {
            final coins = snapshot.data ?? [];
            return ListView.builder(
              itemCount: coins.length,
              itemBuilder: (_, i) {
                return ListTile(title: Text(coins[i]));
              },
            );
          } else {
            return Center(
              child: Text('no select coin'),
            );
          }
        },
      ),
    );
  }

  Future<List<String>> getListCoin()async{
    final listCoin =
    await PreferenceUtils.getStringList('listCoin');
    return listCoin;
  }
}


