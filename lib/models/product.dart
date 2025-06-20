// filename: product.dart
// filepath: lib/models/product.dart

class Product {
  final String id;
  final String title;
  final String image;
  final double price;

  Product({
    required this.id,
    required this.title,
    required this.image,
    required this.price,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json['id'].toString(),
        title: json['title'],
        image: json['image'],
        price: (json['price'] as num).toDouble(),
      );
        
    
 }