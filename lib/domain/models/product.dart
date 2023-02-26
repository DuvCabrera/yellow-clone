class Product {
  final int id;
  final String name;
  final String description;
  final double price;
  final int? discount;
  final String imageUrl;

  Product(this.id,
      {required this.name,
      required this.description,
      required this.price,
      required this.discount,
      required this.imageUrl});
}
