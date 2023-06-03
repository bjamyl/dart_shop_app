import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/orders.dart' show Orders;
import '../widgets/order_item.dart';
import '../widgets/app_drawer.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});
  static const routeName = '/orders';

  @override
  Widget build(BuildContext context) {
    final orders = Provider.of<Orders>(context);
    return Scaffold(
      appBar: AppBar(title:const Text('Your Orders')),
      drawer: AppDrawer(),
      body: ListView.builder(
        itemBuilder: (context, i) => OrderItem(order: orders.orders[i]),
        itemCount: orders.orders.length,
      ),
    );
  }
}
