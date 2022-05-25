import 'package:crypto_watcher/model/model.dart';
import 'package:crypto_watcher/preference/utils_preference.dart';
import 'package:flutter/material.dart';

class ItemList extends StatefulWidget {
  final CoinModel? coin;

  const ItemList({
    Key? key,
    required this.coin,
  }) : super(key: key);

  @override
  State<ItemList> createState() => _ItemListState();
}

class _ItemListState extends State<ItemList> {

  late bool isSelect = false;

  @override
  void initState() {
    super.initState();
    _loadSelect();
  }
  void _loadSelect () async {
    final coins = PreferenceUtils.getStringList('listCoin') ?? [];
    isSelect = _validateCoinExist(coins, widget.coin?.id);
    final json = widget.coin!.toJson();
    await PreferenceUtils.setStringList('listCoin', [json]);
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(child: Text(widget.coin?.name ?? '')),
          Text(widget.coin?.currentPrice?.toString() ?? '0.0'),
          const SizedBox(width: 20),
          IconButton(
            onPressed: () {
              isSelect = !isSelect;
              _saveCoin(widget.coin?.toJson() ?? '');
              setState(() {});
            },
            icon: Icon(
              Icons.star,
              color: isSelect ? Colors.red : Colors.orangeAccent,
            ),
          ),
        ],
      ),
    );
  }
}

_saveCoin(String value) async{
  final List<String>? coinList =
      await PreferenceUtils.getStringList('listCoin');
  if(coinList != null){
    bool existCoin = _validateCoinExist(coinList, value);
    if(!existCoin){
      coinList.add(value);
    }else{
      coinList.remove(value);
    }
    await PreferenceUtils.setStringList('listCoin', coinList);
  }else{
    await PreferenceUtils.setStringList('listCoin', [value]);
  }
}
bool _validateCoinExist(List<String> coinList, value){
  bool exist = false;
  for(var coin in coinList){
    if(coin == value){
      exist = true;
      break;
    }
  }
  return exist;
}
readCoinList()async {
  final coins =
  await PreferenceUtils.getStringList('listCoin');
  print(coins);
}