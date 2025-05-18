// filename: favorite_service.dart
// filepath: lib/services/favorite_service.dart

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../models/product.dart';

class FavoriteService {
  final _db = FirebaseFirestore.instance;
  User? get _user => FirebaseAuth.instance.currentUser;

  Stream<bool> isFavorite(String productId) {
    return _db
        .collection('users')
        .doc(_user!.uid)
        .collection('favorites')
        .doc(productId)
        .snapshots()
        .map((snap) => snap.exists);
  }

  Future<void> toggleFavorite(Product product) async {
    final favRef = _db.collection('users').doc(_user!.uid).collection('favorites').doc(product.id);
    final fav = await favRef.get();
    if (fav.exists) {
      await favRef.delete();
    } else {
      await favRef.set({
        'title': product.title,
        'image': product.image,
        'price': product.price,
      });
    }
  }
}