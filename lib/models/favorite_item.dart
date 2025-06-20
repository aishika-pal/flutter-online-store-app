class FavoriteItem {
  final String id;
  final String title;
  final String image;
  final double price;

  FavoriteItem({
    required this.id,
    required this.title,
    required this.image,
    required this.price,
  });

  factory FavoriteItem.fromMap(Map<String, dynamic> map, String id) {
    return FavoriteItem(
      id: id,
      title: map['title'],
      image: map['image'],
      price: (map['price'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'image': image,
      'price': price,
    };
  }
}
// This class represents a favorite item in the user's favorites list.