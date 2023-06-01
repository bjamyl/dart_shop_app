import 'package:flutter/material.dart';

class CartItem extends StatelessWidget {
  const CartItem(
      {super.key,
      required this.id,
      required this.price,
      required this.quantity,
      required this.title});

  final String id;
  final double price;
  final int quantity;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
      child: Padding(
        padding: const EdgeInsets.all(2),
        child: ListTile(
          leading: CircleAvatar(
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: FittedBox(child: Text('\$$price')),
            ),
          ),
          title: Text(title),
          subtitle: Text('Total: \$${{price * quantity}}'),
          trailing: Text('$quantity x'),
        ),
      ),
    );
  }
}
