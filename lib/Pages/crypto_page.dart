import 'package:crypto_watcher/Service/data_respository_service.dart';
import 'package:crypto_watcher/model/model.dart';
import 'package:crypto_watcher/widgets%20/items_list_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CryptoPage extends StatefulWidget {
  const CryptoPage({Key? key}) : super(key: key);

  @override
  State<CryptoPage> createState() => _CryptoPageState();
}

class _CryptoPageState extends State<CryptoPage> {
  late bool isSelect;

  @override
  void initState() {
    isSelect = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CRYPTO'),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        alignment: Alignment.center,
        child: FutureBuilder(
          future: _callData(),
          builder: (context, AsyncSnapshot<List<CoinModel>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data?.length,
                itemBuilder: (BuildContext context, int index) {
                  final CoinModel? coin = snapshot.data?[index];
                  return InkWell(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        'detail',
                        arguments: coin,
                      );
                    },
                    child: ItemList(
                      name: coin?.name ?? '',
                      value: coin?.currentPrice ?? 0.0,
                    ),
                  );
                },
              );
            }
            return const Center(
              child: Text('No data'),
            );
          },
        ),
      ),
    );
  }

  Future<List<CoinModel>> _callData() async {
    final dataRepo = DataRepositoryService();
    return await dataRepo.getProjectsData();
  }
}
