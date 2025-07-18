import 'package:flutter/material.dart';
import '../models/product.dart';
import '../services/favorite_service.dart';

class ProductTile extends StatelessWidget {
  final Product product;
  final VoidCallback onAddToCart;
  final FavoriteService favoriteService;

  const ProductTile({
    super.key,
    required this.product,
    required this.onAddToCart,
    required this.favoriteService,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(product.image, width: 50, height: 50),
      title: Text(product.title),
      subtitle: Text('\$${product.price}'),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: onAddToCart,
          ),
          // Favorite toggle button
          StreamBuilder<bool>(
            stream: favoriteService.isFavorite(product.id),
            builder: (context, snapshot) {
              final isFav = snapshot.data ?? false;
              return IconButton(
                icon: Icon(
                  isFav ? Icons.favorite : Icons.favorite_border,
                  color: isFav ? Colors.red : null,
                ),
                onPressed: () => favoriteService.toggleFavorite(product),
              );
            },
          ),
        ],
      ),
    );
  }
}
