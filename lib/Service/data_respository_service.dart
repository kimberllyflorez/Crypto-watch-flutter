import 'dart:convert';

import 'package:crypto_watcher/Service/data_service.dart';
import '../model/model.dart';

class DataRepositoryService {
  final Service = DataService();
  List<CoinModel> coinData = [];

  Future<List<CoinModel>> getProjectsData() async {
    var params = {
      'vs_currency': 'usd',
      'order': 'market_cap_desc',
    };
    final data = await Service.get(
        segment: '/api/v3/coins/markets', queryParams: params);
    final List<dynamic> listCoins = jsonDecode(data);
    for (var element in listCoins) {
      coinData.add(CoinModel.fromMap(element));
    }

    return coinData;
  }
}
//al llamar la clase trae lo que esta dentro del constructor
