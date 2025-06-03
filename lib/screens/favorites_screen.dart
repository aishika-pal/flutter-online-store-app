// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import '../services/product_service.dart';
import '../services/cart_service.dart';
import '../services/favorite_service.dart';
import '../models/product.dart';
import 'cart_screen.dart';
import 'favorites_screen.dart';
import '../widgets/product_title.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});
  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  late Future<List<Product>> _products;
  final cartService = CartService();
  final favoriteService = FavoriteService();

  @override
  void initState() {
    super.initState();
    _products = ProductService().fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Online Store'),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const FavoritesScreen()),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const CartScreen()),
              );
            },
          ),
        ],
      ),
      body: FutureBuilder<List<Product>>(
        future: _products,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          final products = snapshot.data!;
          return ListView.builder(
            itemCount: products.length,
            itemBuilder: (context, i) {
              final product = products[i];
              return ProductTile(
                product: product,
                onAddToCart: () => cartService.addToCart(product),
                favoriteService: favoriteService,
              );
            },
          );
        },
      ),
    );
  }
}
