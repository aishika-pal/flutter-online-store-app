import 'package:flutter/material.dart';
import '../models/product.dart';

class FavoriteItem extends StatelessWidget {
  final Product product;
  final VoidCallback onRemove;

  const FavoriteItem({
    super.key,
    required this.product,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(product.image, width: 50, height: 50),
      title: Text(product.title),
      subtitle: Text('\$${product.price}'),
      trailing: IconButton(
        icon: const Icon(Icons.delete),
        onPressed: onRemove,
      ),
    );
  }
}