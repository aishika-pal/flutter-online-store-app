// filename: cart_screen.dart
// filepath: lib/screens/cart_screen.dart

// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import '../services/product_service.dart';
import '../services/cart_service.dart';
import '../services/favorite_service.dart';
import '../models/product.dart';
import 'cart_screen.dart';
import 'favorites_screen.dart';
import '../widgets/product_title.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});
  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final cartService = CartService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Your Cart')),
      body: StreamBuilder<List<Map<String, dynamic>>>(
        stream: cartService.cartItems(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          final items = snapshot.data!;
          if (items.isEmpty) return const Center(child: Text('Cart is empty.'));
          return ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, i) {
              final item = items[i];
              return ListTile(
                leading: Image.network(item['image'], width: 50, height: 50),
                title: Text(item['title']),
                subtitle: Text('\$${item['price']} x ${item['quantity']}'),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.remove),
                      onPressed: () {
                        int qty = item['quantity'] - 1;
                        cartService.updateQuantity(item['id'], qty);
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.add),
                      onPressed: () {
                        int qty = item['quantity'] + 1;
                        cartService.updateQuantity(item['id'], qty);
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () => cartService.removeFromCart(item['id']),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
