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
import '../widgets/cart_item.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});
  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final cartService = CartService();
  late Future<List<Product>> _products;

  @override
  void initState() {
    super.initState();
    _products = ProductService().fetchProducts();
  }

  void _showAddProductDialog() async {
    final products = await _products;
    if (!mounted) return;
    showDialog(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: const Text('Add Product to Cart'),
          content: SizedBox(
            width: double.maxFinite,
            height: 400,
            child: ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, i) {
                final product = products[i];
                return ListTile(
                  leading: Image.network(product.image, width: 40, height: 40),
                  title: Text(product.title),
                  subtitle: Text('\$${product.price}'),
                  trailing: IconButton(
                    icon: const Icon(Icons.add_shopping_cart),
                    onPressed: () {
                      Navigator.of(dialogContext, rootNavigator: true).pop();
                      cartService.addToCart(product);
                    },
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }

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
              return CartItem(
                item: item,
                onRemove: () => cartService.removeFromCart(item['id']),
                onIncrease: () => cartService.updateQuantity(
                  item['id'],
                  item['quantity'] + 1,
                ),
                onDecrease: () => cartService.updateQuantity(
                  item['id'],
                  item['quantity'] - 1,
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddProductDialog,
        tooltip: 'Add product to cart',
        child: const Icon(Icons.add),
      ),
    );
  }
}
