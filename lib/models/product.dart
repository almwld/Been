class Product {
  final String id;
  final String name;
  final double price;
  final String category;
  final String image;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.category,
    required this.image,
  });

  factory Product.fromMap(Map<String, dynamic> data, String docId) {
    return Product(
      id: docId,
      name: data['name'] ?? '',
      price: (data['price'] ?? 0).toDouble(),
      category: data['category'] ?? 'All',
      image: data['image'] ?? '',
    );
  }
}
