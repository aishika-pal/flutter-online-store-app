// filename: cart_service.dart
// filepath: lib/services/cart_service.dart

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../models/product.dart';

class CartService {
  final _db = FirebaseFirestore.instance;
  User? get _user => FirebaseAuth.instance.currentUser;

  /// Stream of cart items for the current user.
  Stream<List<Map<String, dynamic>>> cartItems() {
    return _db
        .collection('carts')
        .doc(_user!.uid)
        .collection('items')
        .snapshots()
        .map(
          (snap) =>
              snap.docs.map((doc) => {...doc.data(), 'id': doc.id}).toList(),
        );
  }

  /// Add a product to the cart. If it exists, increment quantity.
  Future<void> addToCart(Product product) async {
    final cartRef = _db.collection('carts').doc(_user!.uid);
    final itemRef = cartRef.collection('items').doc(product.id);
    final item = await itemRef.get();
    if (item.exists) {
      await itemRef.update({'quantity': FieldValue.increment(1)});
    } else {
      await itemRef.set({
        'title': product.title,
        'image': product.image,
        'price': product.price,
        'quantity': 1,
      });
    }
  }

  /// Update the quantity of a product in the cart. Removes item if quantity <= 0.
  Future<void> updateQuantity(String productId, int quantity) async {
    final itemRef = _db
        .collection('carts')
        .doc(_user!.uid)
        .collection('items')
        .doc(productId);
    if (quantity <= 0) {
      await itemRef.delete();
    } else {
      await itemRef.update({'quantity': quantity});
    }
  }

  /// Remove a product from the cart.
  Future<void> removeFromCart(String productId) async {
    final itemRef = _db
        .collection('carts')
        .doc(_user!.uid)
        .collection('items')
        .doc(productId);
    await itemRef.delete();
  }
}
