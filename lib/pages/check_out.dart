import 'package:firstflutter/provider/cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CheckOut extends StatelessWidget {
  const CheckOut({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('check out'),
          actions: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "\$${Provider.of<Cart>(context).totalPrice.toInt()}",
                style:
                    const TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        body: Consumer<Cart>(
            builder: (BuildContext context, cart, Widget? child) {
          return ListView.builder(
              itemCount: cart.count,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    trailing: IconButton(
                        onPressed: () {
                          cart.remove(cart.basketitem[index]);
                        },
                        icon: const Icon(Icons.remove_shopping_cart)),
                    title: Text(cart.basketitem[index].name),
                    leading: Text("${cart.basketitem[index].price}"),
                  ),
                );
              });
        }));
  }
}
