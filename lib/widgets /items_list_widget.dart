import 'package:flutter/material.dart';

class ItemList extends StatefulWidget {
  const ItemList({Key? key}) : super(key: key);

  @override
  State<ItemList> createState() => _ItemListState();

}

class _ItemListState extends State<ItemList> {
  late bool  isSelect;

  @override
  void initState() {
    isSelect = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children:  [
        Text('nombre de la moneda'),
        Text('valor de la moneda'),
        IconButton(
          onPressed: () {
            isSelect = !isSelect;
            setState(() {
            });
          },
          icon: Icon(Icons.star,
            color: isSelect ? Colors.red : Colors.orangeAccent,
          ),
        ),
      ],
    );
  }
}
