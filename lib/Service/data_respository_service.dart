
import 'package:crypto_watcher/Service/data_service.dart';
import '../model/model.dart';

class DataRepositoryService {
  final Service = DataService();
  CoinModel? coinData;

  DataRepositoryService() {

    getProjectsData();
  }

  Future getProjectsData() async {
    var params = {
      'vs_currency': 'usd',
      'order':'market_cap_desc',
      'per_page': 1000,
      'page':1,
      'sparkline':true,

    };
    final data = await Service.get(
       segment:  '/api/v3/coins/marketsgu',queryParams: params
    );
    coinData = CoinModel.fromJson(data.toString());
     print(coinData);

  }
}
//al llamar la clase trae lo que esta dentro del constructor