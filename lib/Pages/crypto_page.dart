import 'package:crypto_watcher/Service/data_respository_service.dart';
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
        title: Text('CRYPTO'),
      ),
     body: Container(

       padding: EdgeInsets.all(10),
       alignment: Alignment.center,
       child: ListView.builder(
         itemCount: 10,
         itemBuilder: (BuildContext context, int index) {
         return GestureDetector(
           onTap:(){Navigator.pushNamed(context, 'detail');
           final data = DataRepositoryService();
             },
             child: ItemList()
         );
       },

       ),
     ),
    );
  }

}
