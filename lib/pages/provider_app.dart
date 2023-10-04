import 'package:firstflutter/provider/cart.dart';
import 'package:firstflutter/model/item.dart';
import 'package:firstflutter/pages/check_out.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  final List<Item> items = const [
    Item(name: "s20 ulter", price: 250),
    Item(name: "p30 ulter", price: 400),
    Item(name: "oppo", price: 365),
  ];

  const Home({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping'),
        actions: [
          Row(
            children: [
              Consumer<Cart>(
                builder: (BuildContext context, cart, Widget? child) {
                  return Text(
                    "${cart.count}",
                    style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
                  );
                },
              ),
              IconButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return const CheckOut();
                      },
                    ));
                  },
                  icon: const Icon(
                    Icons.shopping_cart,
                    size: 40,
                  )),
            ],
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Card(
            child: Consumer<Cart>(
              builder: (BuildContext context, cart, Widget? child) {
                return ListTile(
                  trailing: IconButton(
                      onPressed: () {
                        cart.add(items[index]);
                      },
                      icon: const Icon(Icons.add_shopping_cart)),
                  title: Text(items[index].name),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
