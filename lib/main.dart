import 'package:crypto_watcher/Pages/details_cryto_page.dart';
import 'package:crypto_watcher/Pages/home_page.dart';
import 'package:crypto_watcher/bloc/coin_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (_)=> CoinBloc())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomePage(),
        initialRoute:'' ,
        routes: {
          'homePage':(_)=> HomePage(),
          'detail': (_)=> DestailCryptoPage(),
        },
      ),
    );
  }
}
