// filename: product_service.dart
// filepath: lib/services/product_service.dart

import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/product.dart';

class ProductService {
  Future<List<Product>> fetchProducts() async {
    final res = await http.get(
      Uri.parse(
        'https://app.beeceptor.com/mock-server/fake-store-api/products',
      ),
    );
    final List data = json.decode(res.body);
    return data.map((e) => Product.fromJson(e)).toList();
  }
}
