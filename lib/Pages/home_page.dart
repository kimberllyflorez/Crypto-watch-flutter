import 'package:crypto_watcher/Pages/pages.dart';
import 'package:crypto_watcher/bloc/coin_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;

  final List<Widget> _widgetsPages = <Widget>[
    CryptoPage(),
    WatchListPage(),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetsPages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.amberAccent,
        unselectedIconTheme: IconThemeData(color: Colors.black87),
        items: const [
          BottomNavigationBarItem(
            label: 'coins',
            icon: Icon(Icons.arrow_forward_sharp),
          ),
          BottomNavigationBarItem(
            label: 'watchlist',
            icon: Icon(Icons.arrow_forward_sharp),
          ),
        ],
        currentIndex: currentIndex,
        onTap: (int index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}
