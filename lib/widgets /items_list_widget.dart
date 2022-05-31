import 'package:crypto_watcher/model/model.dart';
import 'package:crypto_watcher/widgets%20/star_icon_widget.dart';
import 'package:flutter/material.dart';

class ItemList extends StatelessWidget {
  final CoinModel? coin;

  const ItemList({
    Key? key,
    required this.coin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(child: Text(coin?.name ?? '')),
          Text(coin?.currentPrice?.toString() ?? '0.0'),
          const SizedBox(width: 20),
          StarIcon(
            coin: coin,
          )
        ],
      ),
    );
  }
}
