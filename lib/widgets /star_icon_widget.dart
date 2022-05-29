import 'package:crypto_watcher/bloc/coin_bloc.dart';
import 'package:crypto_watcher/model/model.dart';
import 'package:crypto_watcher/preference/utils_preference.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StarIcon extends StatefulWidget {
  final CoinModel? coin;

  const StarIcon({Key? key, this.coin}) : super(key: key);

  @override
  _StarIconState createState() => _StarIconState();
}

class _StarIconState extends State<StarIcon> {
  late bool isSelect = false;

  @override
  void initState() {
    _loadSelect();
    super.initState();
  }

  void _loadSelect() async {
    final List<String> coins = await PreferenceUtils.getStringList('listCoin') ?? [];
    if (coins.isNotEmpty) {
      final id = BlocProvider.of<CoinBloc>(context).validateCoinExist(coins, widget.coin?.id ?? '');
      if (id != null) {
        isSelect = true;
        setState(() {});
      }
    }
  }

  @override
  Widget build(BuildContext context) {

    return IconButton(
      onPressed: () {
        isSelect = !isSelect;
        BlocProvider.of<CoinBloc>(context).saveCoin(widget.coin);
        setState(() {});
      },
      icon: Icon(
        Icons.star,
        color: isSelect ? Colors.red : Colors.orangeAccent,
      ),
    );
  }
}
