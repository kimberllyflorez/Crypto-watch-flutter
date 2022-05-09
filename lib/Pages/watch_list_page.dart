
import 'package:flutter/material.dart';

class WatchListPage extends StatelessWidget {
  const WatchListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WHATVCHER'),
      ),
      body: Column(
        children:[
          Text('lista de monedas'),
        ]

      ),
    );
  }
}
