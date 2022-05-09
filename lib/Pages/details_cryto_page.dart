import 'package:flutter/material.dart';

class DestailCryptoPage extends StatelessWidget {
  const DestailCryptoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            children: const[
              ImageCrypto(),
              Text('data'),
            ],
          ),
          Text('data')

        ],
      ),
    );
  }
}
class ImageCrypto extends StatelessWidget {
  const ImageCrypto({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 30),
      height: 200,
      width: 200,
      child: FadeInImage(
        placeholder: AssetImage('assets/betcoin.jpeg'),
        image: AssetImage('assets/betcoin.jpeg'),
        fit: BoxFit.cover,
      ),
    );
  }
}


