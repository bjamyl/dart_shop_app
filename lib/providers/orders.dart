import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import './cart.dart';

class OrderItem {
  final String id;
  final double amount;
  final List<CartItem> products;
  final DateTime dateTime;

  OrderItem(
      {required this.id,
      required this.amount,
      required this.products,
      required this.dateTime});
}

class Orders with ChangeNotifier {
  List<OrderItem> _orders = [];

  List<OrderItem> get orders {
    return [..._orders];
  }

  Future<void> addOrder(List<CartItem> cartProducts, double total) async {
    final url = Uri.parse(
        'https://flutter-shop-app-ef785-default-rtdb.firebaseio.com/orders.json');
    try {
      final res = await http.post(url,
          body: json.encode({
            'amount': total,
            'products': cartProducts,
            'dateTime': DateTime.now()
          }));
      final newOrder = OrderItem(
          id: json.decode(res.body)["name"],
          amount: total,
          products: cartProducts,
          dateTime: DateTime.now());
      _orders.add(newOrder);
      notifyListeners();
    } catch (error) {
      throw error;
    }
    // _orders.insert(
    //     0,
    //     OrderItem(
    //         id: DateTime.now().toString(),
    //         amount: total,
    //         products: cartProducts,
    //         dateTime: DateTime.now()));
  }
}
