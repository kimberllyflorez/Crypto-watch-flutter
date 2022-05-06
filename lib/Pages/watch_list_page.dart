
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                color: Colors.grey,
                height: 100,
                width: 100,
              ),
              Icon(Icons.star),
            ],
          ),
          Container(
            child: Text('hello wirfasa '),
          ),
        ]
      ),
    );
  }
}
