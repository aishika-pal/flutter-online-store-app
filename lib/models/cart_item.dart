class CartItem {
  final String id;
  final String title;
  final String image;
  final double price;
  final int quantity;

  CartItem({
    required this.id,
    required this.title,
    required this.image,
    required this.price,
    required this.quantity,
  });

  factory CartItem.fromMap(Map<String, dynamic> map, String id) {
    return CartItem(
      id: id,
      title: map['title'],
      image: map['image'],
      price: (map['price'] as num).toDouble(),
      quantity: map['quantity'] ?? 1,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'image': image,
      'price': price,
      'quantity': quantity,
    };
  }
}
