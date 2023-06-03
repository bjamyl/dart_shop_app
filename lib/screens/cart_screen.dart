import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart.dart' show Cart;
import '../widgets/cart_item.dart';
import '../providers/orders.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  static const routeName = '/cart_screen';

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(title: Text('Your Cart')),
      body: Column(children: [
        Card(
          margin: const EdgeInsets.all(15),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Total',
                    style: TextStyle(fontSize: 20),
                  ),
                  Spacer(),
                  Chip(
                    label: Text(
                      '\$${cart.totalAmount.toStringAsFixed(2)}',
                      style: const TextStyle(color: Colors.white),
                    ),
                    backgroundColor: Theme.of(context).colorScheme.primary,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Provider.of<Orders>(context, listen: false).addOrder(
                            cart.items.values.toList(), cart.totalAmount);
                        cart.clearCart();
                      },
                      child: Text('ORDER NOW'))
                ]),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Expanded(
            child: ListView.builder(
          itemCount: cart.items.length,
          itemBuilder: (ctx, i) => CartItem(
              id: cart.items.values.toList()[i].id,
              productId: cart.items.keys.toList()[i],
              price: cart.items.values.toList()[i].price,
              quantity: cart.items.values.toList()[i].quantity,
              title: cart.items.values.toList()[i].title),
        ))
      ]),
    );
  }
}
