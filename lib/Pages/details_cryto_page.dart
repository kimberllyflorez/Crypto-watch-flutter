import 'package:crypto_watcher/model/model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DestailCryptoPage extends StatelessWidget {
  const DestailCryptoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final coin = ModalRoute.of(context)!.settings.arguments as CoinModel?;

    return Scaffold(
      appBar: AppBar(
        title: Text(coin?.name ?? ''),
      ),
      body: Column(

        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ImageCrypto(imageCoin: coin?.image ?? ''),
              Icon(
                Icons.star,
                size: 100,
                color: Colors.orangeAccent,
              ),
            ],
          ),
          ListTile( title: Text('Market cap: ${coin?.marketCap.toString()}') ) ,
          ListTile( title: Text('Market cap: ${coin?.priceChange24H.toString()}') ) ,

        ],
      ),
    );
  }
}

class ImageCrypto extends StatelessWidget {
  final String imageCoin;

  const ImageCrypto({Key? key, required this.imageCoin}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 30),
      height: 200,
      width: 200,
      child: FadeInImage(
        placeholder: AssetImage('assets/betcoin.jpeg'),
        image: NetworkImage(imageCoin),
        fit: BoxFit.fitWidth,
      ),
    );
  }
}
