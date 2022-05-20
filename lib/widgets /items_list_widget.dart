import 'package:flutter/material.dart';

class ItemList extends StatefulWidget {
  final String name;
  final double value;

  const ItemList({
    Key? key,
    required this.name,
    required this.value,
  }) : super(key: key);

  @override
  State<ItemList> createState() => _ItemListState();
}

class _ItemListState extends State<ItemList> {
  late bool isSelect;

  @override
  void initState() {
    isSelect = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(child: Text(widget.name)),
        Text(widget.value.toString()),
        const SizedBox(width: 30),
        IconButton(
          onPressed: () {
            isSelect = !isSelect;
            setState(() {});
          },
          icon: Icon(
            Icons.star,
            color: isSelect ? Colors.red : Colors.orangeAccent,
          ),
        ),
      ],
    );
  }
}
