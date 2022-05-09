

import 'package:crypto_watcher/Service/data_service.dart';
import 'package:flutter/material.dart';

import '../model/model.dart';

class DataRepositoryService {
  final Service = DataService();
  CoinModel? coinData;

  DataRepositoryService() {

    getProjectsData();
  }

  Future getProjectsData() async {
    final data = await Service.get('/api/v3/coins/marketsgu');
    coinData = CoinModel.fromJson(data.toString());
     print(coinData);

  }
}
//al llamar la clase trae lo que esta dentro del constructor